%   Copyright 2017 Rafael Almar (IRD, France)- rafael.almar@ird.fr
clear
clear all
close all
clc
%% chargeons la matrice des donn�es mensuelle des param�tres hydrodynamiques
load('/home/profdam/Documents/PhD Project/Scripts/Adapted/ENSEMBLE_HS_DM_TM_selected0p25.mat');

%% passons � la transpos�e des diff�rents tableaux des param�tres hydrodynamiques.
H=hs; 
T=tm; 
theta=360-dm;

%%
runup=3;
% m est la pente de la zone de swash
m=0.08;%defaut 0.08;

%%%INPUTS%%%%%%%
% T=10;%WAve period
% H=1;%Wave height
% theta=10;% Wave incidence angle (degree �)
%%%OUTPUTS%%%%%%%%%%%
% Thetab=Wave incidence at breaking
% Hb= Wave height at breaking
% hb=water depth at breaking
% R= runup
% S= setup
% Vb= alongshore current in the surf
%%%%% Variables definition %%%%%
%    g = 9.81;
%    rho = 1025;
%    a =  H/2;
%    gamma=0.7;
%%%%% Getting the value of L %%%%%
% con = 1;
% 	l(con) = 0;
%         l(con+1) = 1.56 * T ^ 2;         
%         while abs( l(con+1) - l(con) )>0.0001, 
%                 l(con+2) = ( ( 9.81 * T ^ 2 ) / ( 2 * pi ) ) * tanh( ( 2 * pi * h ) / l(con+1) );
%                 r = l(con+1) - l(con);
%                 con = con + 1;
%         end
% L =  l(con);
%     k = ( 2 * pi ) / L;
%     
% if ( k * h ) < ( pi / 10 )       % Shallow water
%                 C = sqrt( g * h );
%                 Cg = C;
% % disp('Shallow water')
%     elseif ( ( k * h ) > ( pi / 10 ) ) && ( ( k * h ) <pi/2 )     % Transitional water
%                 C = ( ( g * T ) / ( 2 * pi ) ) * tanh( k * h );
%                 Cg = ( ( C / 2 ) * ( 1 + ( ( 2 * k * h ) / sinh( 2 * k * h ) ) ) );
% % disp('Intermediate water')
% 
% else       % Deep water
% %     disp('Deep water')
%                 C = ( ( g * T ) / ( 2 * pi ) );
%                 Cg = C/2; 
% end
% 
% alpha= (C/(sqrt(g*H)))^4*(C/Cg)*gamma^2;
% 
% Lambda=(cosd(theta)/alpha)^(2/5);
% epsilon=(sind (theta))^2*Lambda;
% delta=1+0.1649*epsilon+0.5948*epsilon^2-1.6787*epsilon^3+2.8573*epsilon^4;
% 
% Lambdac=delta*Lambda;
% 
% 
% %Theta at breaking
% Thetab=asind(sind(theta)*sqrt(Lambdac));
% 
% %Depth at breaking
% hb=Lambdac*C^2/g;
% 
% %Wave height at breaking
% Hb=hb*gamma;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%from http://lup.lub.lu.se/luur/download?func=downloadFile&recordOId=4630691&fileOId=4631443
% deepwater conditions
theta0=theta;
%theta0(cos(theta0*pi/180)<0)= NaN;  %replace all the cases where the waves
%are not moving toward the shore by NaN values
C = 1.56 * T;  %calculate the wave speed
L = 1.56 * T.^2;  %calculate the wave length
Cg = C / 2;  %calculate the group speed
gamma = 0.78;  %is arbitrary
alpha = (C./sqrt(9.81*H)).^4 .* (C ./ Cg) * gamma^2;
lambda_a = (cos(pi*theta0/180)./alpha).^(2/5); 
epsi = lambda_a .* sin(theta0*pi/180).^2;
epsi(epsi<=0)=0;epsi(epsi>=0.5)=0.5;
delta = 1 + 0.1649 * epsi + 0.5948 * epsi.^2  - 1.6787 * epsi.^3 + 2.8573 *epsi.^4;
lambda = delta .* lambda_a;
hb = lambda .* C.^2 / 9.81;  %compute water depth at breaking
Hb = gamma * hb;  %wave height at breaking
% Thetab = asin(sin(theta0*pi/180).* sqrt(lambda))*180/pi; %wave angle at%breaking
%theta_b= asin(sin(angle).*sqrt(lamda));
Thetab = asin(sin(theta0).* sqrt(lambda)); %wave angle at%breaking

%Thetab= asin(sqrt(2.*pi)*sind(theta)*sqrt(Hb/L))*180/pi;
%%
hb(isnan(hb))=0;  %replace all NaN values by 0
Hb(isnan(Hb))=0;  %replace all NaN values by 0

%alongshore current in the surf (m/s)
% V = (5./32).*(pi.*gamma.*sqrt(9.81))./cf.*A.^(1.5).*sin(Thetab);
kv=2.9;%Kaczmarek
V = .25 .* kv .* sqrt(gamma .* 9.81 .* Hb) .* sind(2.*Thetab);

%wave induced runup Hanson  and  Larson  (2008) /Hunts formula
Hop=abs(sqrt(cosd(theta0)).*H);%correction en fonction de l'angle d'incidence
beta=0.08;%beach slope
R=tan(beta)./sqrt(Hop/L);

% irrib=tan(beta)./sqrt(Hop.*L);
% Hop
% %Maximum runup
% Rx=2.32.*Hop.*irrib.^0.77;
% %Significant runup
% Rm=1.38.*Hop.*irrib.^0.70;

%wave-induced Stockdon et al 2006
S=0.016.*sqrt(Hop.*L);
% sediment{1,1}(:,18) = Hb(:);  %store results in a cell array
% sediment{1,2}(:,18) = hb(:);
% sediment{1,3}(:,18) = tetab(:);
% CERC formula for the transport
%calculate the potential sediment transport using the CERC formula
% sediment{1,4}=(sediment{1,1}.^(5/2)).*sin(2*sediment{1,3}*pi/180)*0.023/(s-1)*9.81^0.5;

%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Hs=1;
% % Periode du pic de vague
% T=8;
% Tide : hauteur de la mar�e
Tide = 0.;
%Kosc : Param�tre de swash
% Calibration multi-site du Kosc=1.37 (d'apres Aarninkhof.S,2003,p47)
Kosc=1.37;

% Patm : Pression atmospherique
Patm = 1015;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g : gravit�
g = 9.81;
% Longueur d'onde des vagues au large
Ls = (g*T.^2)/(2*pi);
%Rig hauteur de swash due aux ondes infragravitaires
%Eps : nombre d'Irribarren
Eps= tan(m)./sqrt(H./Ls);

if runup==1 % formulation Kolman 1998 for S, Holman and Sallenger 1985, Stockdon and Holman 2000 (used in Melet et al. 2016 and in the 1st submitted manuscript)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Etape 1 : Calcul de la hauteur de swash due aux Ondes
%%%%%%%% Infragravitaires%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rig=H.*0.65.*tanh(3.38.*Eps);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Etape 2 : Calcul de la hauteur de swash due aux vagues%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Rss : hauteur de swash due aux vagues

if (Eps >= 0.275)
Rss=H.*(0.69*Eps-0.19);
else
Rss=0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Etape 2 : Calcul de la hauteur totale de swash%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
etaosc=sqrt(Rig.^2+Rss.^2);

% Hauteur totale de swash
R= Kosc*etaosc/2;

ii=find(isnan(R)==1);R(ii)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Etape 3 : Calcul de l'effet du barometre inverse%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 0.1 m par baisse de 10hPa (Salmon,Coco,2007)
% eta_baro=(1/100.)*(1015-Patm)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Etape 4 : Calcul du set-up (Bowen et al.,1968;Salmon,Coco,2007)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Gamma=0.78; %defaut=0.4 Ruessink et al. 2003
% hb=Hb/Gamma;
S=(3./8)*Gamma.^2.*(hb+Tide)/(1+(3./8).*Gamma.^2)^2;

elseif runup==2 %Stockdon et al. 2006, wide range of conditions (used in Serafin et al. 2017, and as the reference formulation in our revised manuscript).
 R=0.5*1.37*(0.756*m.^2*Ls.*H-0.165*m.*H.*sqrt(Ls.*H)+0.0368).^0.5;
 S=0.45*m.*sqrt(Ls.*H);
 
elseif runup==3 %Stockdon et al. 2006, dissipative beaches (used in Vitousek et al. 2017)
R=0.5*1.1*(Ls.*H.*(0.5625*m.^2+0.004)).^0.5;
S=0.385*m*sqrt(Ls.*H);

elseif runup==4 %Stockdon et al. 2006
R=0.5*1.1*(Ls.*H.*(0.5625*m.^2+0.004)).^0.5;
S=0.385*m*sqrt(Ls.*H);

end
