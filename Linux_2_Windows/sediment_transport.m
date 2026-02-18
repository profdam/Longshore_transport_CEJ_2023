clear
clear all
close all
clc
%% chargeons la matrice des donn�es mensuelle des param�tres hydrodynamiques
load('/home/profdam/Downloads/DATASylvain/ENSEMBLE_HS_DM_TM_selected.mat');
%% passons � la transpos�e des diff�rents tableaux des param�tres hydrodynamiques.
Hs_m=ENSEMBLE_HS; 
Tm_m=ENSEMBLE_TM; 
Dir_m=ENSEMBLE_DM; %Dir_m

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%flux d'�nergie longshore et cross-shore%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% flux d'�nergie longshore mensuel
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



%% variations saisonni�res des param�tres hydrodynamiques 
%% chargement de variable saisonni�res
saison=[Hs Tm Dir Tc]; %% matrice saisonni�re
%% 1) calcul de la c�l�rit� mensuelle des vagues en eau profonde
g=9.81;
gama=0.78;
Cp_s=(Tm.*(g/(2*pi)));%% vitesse de phase saisonni�re
Cg_s=0.5.*Cp_s;% vitesse de groupe saisonni�re
angi=(Dir.*pi)./180;
angle_s=(angi.*pi)./180; % conversion degre en radian
kappa_s=cos(angle_s);
% a)calcul de phi
phi_s=((Cp_s./sqrt(g.*Hs)).^4).*(Cp_s./Cg_s).*(gama^2);
nu_s=(kappa_s./phi_s);
rho=1025;
%% cr�ation des tableaux du flux longshore(Pl)et cross-shore(Pc) saisonnier
% b) calcul de lamda_a saisonnier
lamda_a_s=(nu_s).^(2/5); 
% c)calcul de epsilon saisonnier
epsilon_s=lamda_a_s.*((sin(angle_s)).^2);
% d) calcul de delta
delta_s=1 + 0.1649.*epsilon_s + 0.5948.*(epsilon_s.^2)- 1.6787.*(epsilon_s.^3) + 2.8573.*(epsilon_s.^4);
% e) calcul de lamda saisonnier
lamda_s=delta_s.*lamda_a_s;
% f) calcul angle au d�ferlement
theta_b_s= asin(sin(angle_s).*sqrt(lamda_s));
%% caract�ristique des vagues
% 1) calcul de Hb(hauteur au d�ferlement)
Hb_s=(lamda_s.*Cp_s.^2)./g;
hb_s=Hb_s./gama;% profondeur au d�ferlement
%% flux d'�nergie longshore saisonnier
Pl_s=[(1/8*rho*g).*Hb_s.^2.*sqrt(g*hb_s)].*sin(theta_b_s);
%% flux d'�nergie cross-shore
Pc_s=[(1/8*rho*g).*Hb_s.^2.*sqrt(g*hb_s)].*cos(theta_b_s);



%%         %%%%%%%%%%%%%%%%Transport s�dimentaire longshore%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% transport sedimentaire longshore mensuel%%%%%
Kv=2.9;
V1=(0.25*Kv).*sqrt((gama*g).*Hb.^2).*sin(2.*theta_b);
omega=Hb.^2.*V1;
%% transport longshore 
if omega <0.15
    %transport = 0.023.*(omega);%% %% p�riodes calmes
    transport = 0.023.*(omega);%% %% p�riodes calmes

else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end
%% conversion en metre cube/mois 
%% on sait que 1 mois = 31 jours, 1 jour = 24h donc 1mois=744h, 1h=60min, 1 mois=44640 min
% 1min =60s, 1 mois = 2.678.400s
% conversion de seconde en mois 
% 1s=(1/2678400)mois
conversion=1/2678400;
Q=transport./conversion;


