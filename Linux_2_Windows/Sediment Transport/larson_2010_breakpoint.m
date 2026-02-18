% Larson et al. 2010
% Détermination des caractéristiques des vagues au point de déferlement
% connaissant les caractéristiques des vagues en eaux profondes

% Les caractéristiques des vagues sont : la hauteur Hs, la période Tp et la
% direction angle

function [Hb,Tb,hb,angleb,Cb]=larson_2010_breakpoint(Hs,Tp,angle)

% Sorties : hb : Profondeur au point de déferlement
%           Hb : Hauteur des vagues au point de déferlement
%           Tb : Période des vagues au point de déferlement
%           angleb : Direction des vagues au point de déferlement (en
%           degrés)
%           Cb : Célérité des vagues au point de déferlement

% Entrées : Hs : Hauteur des vagues en eaux profondes ou peu profondes
%           Tp : Période des vagues en eaux profondes ou peu profondes
%           angle : Direction des vagues en eaux profondes ou peu profondes
%           (en degrés)

angle2=(pi.*angle)./180; % en radians
g=9.81; % N/Kg
gamab=0.78; % Breaker depth index

% 1- Calcul de la célérité des vagues en eaux profondes
Cp=((g/(2*pi)).*Tp); % Vitesse des vagues
Cgp=0.5.*Cp; % Vitesse de groupe des vagues

% 2- Calcul de lamda_a solution approchée
alpha=((Cp./sqrt(g.*Hs)).^4).*(Cp./Cgp).*(gamab^2);
lamda_a=((cos(angle2))./alpha).^(2/5);

% 3- Correction de la solution approchée lamda
epsilon=lamda_a.*((sin(angle2)).^2);
delta=1+ 0.1649.*epsilon + 0.5948.*(epsilon.^2)-1.6787.*(epsilon.^3)+ 2.8573.*(epsilon.^4);
lamda=delta.*lamda_a;

% 4- Détermination des caractéristiques des vagues au point de déferlement
hb=(lamda.*Cp.^2)./g;
Hb=gamab.*hb;
angle_b=asin(sqrt(lamda).*sin(angle2));
Cb=(Cp.*sin(angle_b))./sin(angle2);
% Tb=(Cb)./(1.56);
Tb=Tp; % La période ne change pas (selon moi)

% 5- Remove values corresponding to no solution of the approximation
ind=find(abs(sqrt(lamda).*sin(angle2))>1);
Hb(ind)=NaN;
angle_b(ind)=NaN;
Cb(ind)=NaN;

% 6- Remove wave not reaching shore (corresponding to complex values of Hb
% and angle_b)
clear ind
ind=find(abs(angle)>90);
angleb=(180.*angle_b)./pi; % en degrés
angleb(ind)=NaN;

end