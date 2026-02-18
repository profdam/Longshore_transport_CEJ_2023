function [qlstc6,qlstb,qlstk,qlstkz]=LST(rho,rhos,poro,hb,db,teta,wf,mb,d50,T,cf,A,tim)
%________________________________________________________
% Computing the longshore sediment transport, using diferent K
% values and the CERC, Bayram et al.,  Kamphuis and Kaczmarek equations.
%
% Inputs:
%        rho = mass density of water, kg./m3
%        rhos = mass density of sediment, kg./m3
%        poro = sediment porosity, dimensionless
%        hb = wave height at breaking, m
%        db = water depth at the breaking line, m
%        tetab = wave breaker angle relative to the beach, deg
%        wf = sediment fall velocity, m./s
%        mb = slope beach, dimensionless
%        d50 = median grain size, m
%        T = wave period, s
%        cf = friction coefficient, dimensionless
%        A = shape parameter, dimensionless
%        tim = time in which you can evaluate the LST, s
%
% Outputs:
%         The results can see them on the table in the command window.
%
% References:
% Bayram, A., Larson, M. y Hanson, H. 2007. A new formula for the
%       total longshore sediment transport rate. Coastal Engineering 54,
%       700-710 p.
% Del Valle, R., Medina, R. y Losada, M. 1993. Dependence of
%       coefficient k on grain size. Technical report. 3062. 
%       J. Wtrwy, Port, Coastal and Oc. Engrg. Vol. 119(5)
%       568-574 pp.
% Kamphuis, J.W. 1991. Alonshore sediment transport rate. 
%       J. Wtrwy, Port, Coastal and Oc. Engrg. Vol. 117(6)
%       624-640 pp.
% King, D.B., Jr. 2006. Dependence of the Cerc formula K coefficient on
%       grain size. Proc. 30th Int. Coast. Engi., World Scientific Publishing
%       Co. Singapure. 3381-3390p.
% Rosati,J.D., Walton, T.L.  y Bodge, K. 2002. Longshore
%       Sediment Transport. En: Vincent, L., y Demirbilek, Z. (editores), 
%       Coastal Engineering Manual, Part III, 
%       Chapter III-2, Engineer Manual 1110-2-1100, 
%       U.S. Army Corps of Engineers, Washington, DC.
%
% Programming: Gabriel Ruiz, 2009
% Universidad Nacional Autonoma de Mexico
%________________________________________________________

%   Copyright 2017 Rafael Almar (IRD, France)- rafael.almar@ird.fr
% .*.*.*.*.*.*.*.*.*.* Inputs .*.*.*.*.*.*.*.*.*
% rho = input('Mass density of water, kg./m3 ? ');
% rhos = input('Mass density of sediment, kg./m3 ? ');
% poro = input('Sediment porosity, adim ? ');
% hb = input('Wave height at breaking, m ? ');
% db = input('Water depth at the breaking line, m ? ');
% teta = input('Wave breaker angle relative to the beach, deg ? ');
% wf = input('Sediment fall velocity, m./s ? ');
% mb = input('Slope beach, adim ? ');
% d50 = input('Median grain size, m ? ');
% T = input('Wave period, s ? ');
% cf = input('Friction coefficient, adim ? ');
% A = input('Shape parameter, adim ? ');
% ti = input('Hours you would evaluate the LST ? ');
% .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*

g = 9.81;
% tim = 3600.*ti;

% Deg to rad
tetab = abs(teta);
tethab = tetab.*(pi./180);

% Breaker index 
indk = hb./db;

% Energy wave at the breaker line
Eb = (1./8).*rho.*hb.^2;
% Wave group speed at the breaker line
Cgb = sqrt((g.*(hb./indk)));

% Wave energy flux at the breaker line
Pl = Eb.*Cgb.*sin(tethab).*cos(tethab);
Plb = Eb.*Cgb.*cos(tethab);

% Maximun oscillatory velocity at the breaker line
umb = (indk./2).*sqrt(g.*db);

% K, using  Bailard
k1= 0.05+(2.6.*((sin(2.*tethab)).^2))+((0.007.*(umb./wf)));
% using Del Valle et al.
if (d50 >= 0.44./1000) && (d50<= 1.5./1000)
    k2 = 1.4.*exp(-2.5.*(d50.*1000));
else 
    k2 = 0;
end
% using King
k3 = 0.1./(d50.*1000);
% using Swart
k4 = 1.15.*log10(0.00146./d50);
% using Kamphuis et al.
k5 = 0.022.*sqrt((hb.*indk)./(d50));
% Recommend k value
k6 = 0.39;

% k1=k1/2;k2=k2/2;k3=k3/2;k4=k4/2;k5=k5/2;k6=k6/2;
% Immersed weight transport rate
Il1 = k1.*Pl;
Il2 = k2.*Pl;
Il3 = k3.*Pl;
Il4 = k4.*Pl;
Il5 = k5.*Pl;
Il6 = k6.*Pl;

% Potential volumetric longshore transport rate, CERC
qlstc1 = (Il1./((rhos-rho).*g.*(1-poro))).*tim;
qlstc2 = (Il2./((rhos-rho).*g.*(1-poro))).*tim;
qlstc3 = (Il3./((rhos-rho).*g.*(1-poro))).*tim;
qlstc4 = (Il4./((rhos-rho).*g.*(1-poro))).*tim;
qlstc5 = (Il5./((rhos-rho).*g.*(1-poro))).*tim;
qlstc6 = (Il6./((rhos-rho).*g.*(1-poro))).*tim;

% Current velocitity
V = (5./32).*(pi.*indk.*sqrt(g))./cf.*A.^(1.5).*sin(tethab);

% Transport coefficient
e = ((9.0+(4.0.*(hb./(wf.*T))))).*10.^-5; 

% % Longshore Sediment Transport, Kamphuis
if ((2.*tetab)>270) & ((2.*tetab)<360)     
       angb = 360-(2.*tetab); 
elseif ((2.*tetab)>180) & ((2.*tetab)<270) 
       angb = (2.*tetab)-180;
elseif ((2.*tetab)>90) & ((2.*tetab)<180)  
       angb = 180-(2.*tetab);
else
       angb = 2.*tetab;                     
end

%Deg to Rad
tethabk = angb.*(pi./180);

% CERC
% Ilk=(0.39.*sqrt(g./gamma)).*sin(2.*tethabk)..*hb.^(2.5)../((rhos-rho).*(1-poro))
% Ilk=Ilk..*tim

% Immersed weight transport rate to Kamphuis
Ilk = 2.27.*(hb.^2).*(T.^1.5).*(mb.^0.75).*(d50.^-0.25).*(sin(tethabk)).^0.6;
qlstk = ((Ilk./((rhos-rho).*g.*(1-poro)))).*tim; 

% Longshore Sediment Transport, Bayram
qlstb = ((e.*Plb.*V)./((rhos-rho).*(1-poro).*g.*wf)).*tim;

%Longshore Sediment Transport, Kaczmarek
gamma = hb./db;
kv = 2.9;
Hsb2 = hb .* hb;  % Hsb = sh_m;

V = .25 .* kv .* sqrt(gamma .* g .* hb) .* sin(2.*tethab);
term = Hsb2 .* V;
% Formule independante de la periode ???
qlstkz = .00225 + .008 .* term;  % en m3./s
qlstkz(term <.15) = .023 .* term(term <.15);
qlstkz =qlstkz.*tim;

% Results
fprintf('Longshore sediment transport:      K:     Il(kg./s):      Ql(m3./yr):  \n');
fprintf('--------------------------------------------------------------------\n');
% fprintf('CERC (K Bailard):               %6.3f   %10.3f   %2.3d    \n', nanmean(k1),nanmean(Il1),nanmean(qlstc1));
% fprintf('CERC (K Del Valle et al.):      %6.3f   %10.3f   %2.3d    \n',nanmean(k2),nanmean(Il2),nanmean(qlstc2));
% fprintf('CERC (K King):                  %6.3f   %10.3f   %2.3d    \n', nanmean(k3),nanmean(Il3),nanmean(qlstc3));
% fprintf('CERC (K Swart):                 %6.3f   %10.3f   %2.3d    \n', nanmean(k4),nanmean(Il4),nanmean(qlstc4));
% fprintf('CERC (K Kamphuis):              %6.3f   %10.3f   %2.3d    \n', nanmean(k5),nanmean(Il5),nanmean(qlstc5));
fprintf('CERC (Recommend K=0.39):          %6.3f   %10.3f   %2.3d    \n', nanmean(k6),nanmean(Il6),nanmean(qlstc6));
fprintf('Bayram et al:                                           %2.3d    \n', nanmean(qlstb));
fprintf('Kamphuis:                                  %10.3f   %2.3d    \n', nanmean(Ilk),nanmean(qlstk));
fprintf('Kaczmarek:                                              %2.3d    \n', nanmean(qlstkz));
fprintf('--------------------------------------------------------------------\n');
fprintf('\n');
end
   
