%load wave data
clc;clear;
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_monthly_Hist.mat')

%% passons � la transpos�e d00es diff�rents tableaux des param�tres hydrodynamiques.
Hs_m=HS_hist'; 
Tm_m=TM_hist'; 
Dir_m=DM_hist';

%%%
%%       variation mensuelle moyenne du flux d'�nergie
%% 1) calcul de la c�l�rit� mensuelle des vagues en eau profonde
g=9.81;
gama=0.78;
Cp=(Tm_m.*(g/(2*pi)));% vitesse de phase des vagues
Cg=0.5.*Cp;% vitesse de groupe
angi=(Dir_m.*pi)./180;%% conversion degre en radian
angle=(pi.*angi)./180;
% calcule de l'angle
kappa=cos(angle);
phi=((Cp./sqrt(g.*Hs_m)).^4).*(Cp./Cg).*(gama^2);
nu=(kappa./phi);
rho=1025;
% b) calcul de lamda_a
lamda_a=(nu).^(2/5); 
% c)calcul de epsilon
epsilon=lamda_a.*((sin(angle)).^2);
% d) calcul de delta
delta=1 + 0.1649.*epsilon + 0.5948.*(epsilon.^2)- 1.6787.*(epsilon.^3) + 2.8573.*(epsilon.^4);
% e) calcul de lamda
lamda=delta.*lamda_a;
% f) calcul angle au d�ferlement
theta_b= asin(sin(angle).*sqrt(lamda));
%% caract�ristique des vagues
% 1) calcul de Hb(hauteur au d�ferlement)
Hb=(lamda.*Cp.^2)./g;
hb=Hb./gama;% profondeur au d�ferlement
%% flux d'�nergie longshore
Pl=[(1/8*rho*g).*Hb.^2.*sqrt(g*hb)].*sin(theta_b);
%% flux d'�nergie cross-shore
Pc=[(1/8*rho*g).*Hb.^2.*sqrt(g*hb)].*cos(theta_b); 

%%         %%%%%%%%%%%%%%%%Transport s�dimentaire longshore%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% transport sedimentaire longshore mensuel%%%%%
Kv=2.9;
V1=(0.25*Kv).*sqrt((gama*g).*Hb.^2).*sin(2.*theta_b);
omega=Hb.^2.*V1;
%% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end
%% conversion en metre cube/mois 
%% on sait que 1 mois = 31 jours, 1 jour = 24h donc 1mois=744h, 1h=60min, 1 mois=44640 min
% 1min =60s, 1 mois = 2.678.400s
% conversion de seconde en mois 
% 1s=(1/2678400)mois
% conversion=1/2678400;
conversion=1/31536000; %2678400;
Q=transport./conversion;
