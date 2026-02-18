%Load selected ensemble data: hist
clc;clear;
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')

%% Calculate directions relative to the north for coast

%global loop to compute hs gradients
%ANGLE=[]; ANGG=[]; 
angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=1; %Radius of the circle (in Â°) to select the coastline which direction will be estimated

shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<Mr);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
%ANGG=[ANGG ang_coast];

if ang_coast<0
%ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    %ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end


%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=hs_a; tm_a_f=tm_a; dm_a_f=dm_a;
hs_s_f=hs_s; tm_s_f=tm_s; dm_s_f=dm_s;
hs_w_f=hs_w; tm_w_f=tm_w; dm_w_f=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:2
    
if dm_a_f(:,i)<180 & dm_a_f(:,i)>90
    abb_a=dm_a_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_a_f(:,i)>180 & dm_a_f(:,i)<270
    abb_a=(dm_a_f-180);
else
    abb_a=(dm_a_f-180);
    %abb=abs((dm_f-270))+90;
end



if dm_w_f(:,i)<180 & dm_w_f(:,i)>90
    abb_w=dm_w_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_w_f(:,i)>180 & dm_w_f(:,i)<270
    abb_w=(dm_w_f-180);
else
    abb_w=(dm_w_f-180);
    %abb=abs((dm_f-270))+90;
end

if dm_s_f(:,i)<180 & dm_s_f(:,i)>90
    abb_s=dm_s_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_s_f(:,i)>180 & dm_s_f(:,i)<270
    abb_s=(dm_s_f-180);
else
    abb_s=(dm_s_f-180);
    %abb=abs((dm_f-270))+90;
end

abb_a=abs(abb_a);
abc_a=abs(angg'-abb_a);
abcc_a=[abcc_a abc_a];

abb_w=abs(abb_w);
abc_w=abs(angg'-abb_w);
abcc_w=[abcc_w abc_w];

abb_s=abs(abb_s);
abc_s=abs(angg'-abb_s);
abcc_s=[abcc_s abc_s];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:27
    tm_f=tm_a_f(:,j);
    hs_f=hs_a_f(:,j);
    abc=abcc_a(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f=[Thetab_f Thetab_a];
Hb_f=[Hb_f;Hb_a];
hb_f=[hb_f;hb_a];
R_f=[R_f;R_a];
S_f=[S_f;S_a];
V_f=[V_f;V_a];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_hist=transport./conversion;

clearvars -EXCEPT Q_hist lon_f lat_f


%%
%Load selected ensemble data: Mid_4p5
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Mid4p5_1.mat')

%% Calculate directions relative to the north for coast

%global loop to compute hs gradients
%ANGLE=[]; ANGG=[]; 
angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=2; %Radius of the circle (in Â°) to select the coastline which direction will be estimated


shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<1);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
%ANGG=[ANGG ang_coast];

if ang_coast<0
%ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    %ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end


%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=hs_a; tm_a_f=tm_a; dm_a_f=dm_a;
abcc=[];
for i=1:20
if dm_a_f(:,i)<180 & dm_a_f(:,i)>90
    abb=dm_a_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_a_f(:,i)>180 & dm_a_f(:,i)<270
    abb=(dm_a_f-180);
else
    abb=(dm_a_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:20
    tm_f=tm_a_f(:,j);
    hs_f=hs_a_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f=[Thetab_f Thetab_a];
Hb_f=[Hb_f;Hb_a];
hb_f=[hb_f;hb_a];
R_f=[R_f;R_a];
S_f=[S_f;S_a];
V_f=[V_f;V_a];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_Mid_4p5=transport./conversion;

clearvars -EXCEPT Q_hist Q_Mid_4p5 lat_f lon_f

%%
%Load selected ensemble data: Mid_8p5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE_yearly.mat', 'DM_Mid_8p5_', 'HS_Mid_8p5_', 'TM_Mid_8p5_', 'lat_f', 'lon_f')

%% Calculate directions relative to the north for coast

%global loop to compute hs gradients
%ANGLE=[]; ANGG=[]; 
angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=2; %Radius of the circle (in Â°) to select the coastline which direction will be estimated


shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<1);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
%ANGG=[ANGG ang_coast];

if ang_coast<0
%ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    %ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end


%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=HS_Mid_8p5_; tm_a_f=TM_Mid_8p5_; dm_a_f=DM_Mid_8p5_;
abcc=[];
for i=1:20
if dm_a_f(:,i)<180 & dm_a_f(:,i)>90
    abb=dm_a_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_a_f(:,i)>180 & dm_a_f(:,i)<270
    abb=(dm_a_f-180);
else
    abb=(dm_a_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:20
    tm_f=tm_a_f(:,j);
    hs_f=hs_a_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f=[Thetab_f Thetab_a];
Hb_f=[Hb_f;Hb_a];
hb_f=[hb_f;hb_a];
R_f=[R_f;R_a];
S_f=[S_f;S_a];
V_f=[V_f;V_a];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_Mid_8p5=transport./conversion;


clearvars -EXCEPT Q_hist Q_Mid_4p5 Q_Mid_8p5



%%
%Load selected ensemble data: End_4p5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE_yearly.mat', 'DM_End_4p5_', 'HS_End_4p5_', 'TM_End_4p5_', 'lat_f', 'lon_f')

%% Calculate directions relative to the north for coast

%global loop to compute hs gradients
%ANGLE=[]; ANGG=[]; 
angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=2; %Radius of the circle (in Â°) to select the coastline which direction will be estimated


shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<1);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
%ANGG=[ANGG ang_coast];

if ang_coast<0
%ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    %ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end


%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=HS_End_4p5_; tm_a_f=TM_End_4p5_; dm_a_f=DM_End_4p5_;
abcc=[];
for i=1:20
if dm_a_f(:,i)<180 & dm_a_f(:,i)>90
    abb=dm_a_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_a_f(:,i)>180 & dm_a_f(:,i)<270
    abb=(dm_a_f-180);
else
    abb=(dm_a_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:20
    tm_f=tm_a_f(:,j);
    hs_f=hs_a_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f=[Thetab_f Thetab_a];
Hb_f=[Hb_f;Hb_a];
hb_f=[hb_f;hb_a];
R_f=[R_f;R_a];
S_f=[S_f;S_a];
V_f=[V_f;V_a];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_End_4p5=transport./conversion;


clearvars -EXCEPT Q_hist Q_Mid_4p5 Q_Mid_8p5 Q_End_4p5 



%%
%Load selected ensemble data: End_8p5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE_yearly.mat', 'DM_End_8p5_', 'HS_End_8p5_', 'TM_End_8p5_', 'lat_f', 'lon_f')

%% Calculate directions relative to the north for coast

%global loop to compute hs gradients
%ANGLE=[]; ANGG=[]; 
angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=2; %Radius of the circle (in Â°) to select the coastline which direction will be estimated


shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<1);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
%ANGG=[ANGG ang_coast];

if ang_coast<0
%ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    %ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end


%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=HS_End_8p5_; tm_a_f=TM_End_8p5_; dm_a_f=DM_End_8p5_;
abcc=[];
for i=1:20
if dm_a_f(:,i)<180 & dm_a_f(:,i)>90
    abb=dm_a_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_a_f(:,i)>180 & dm_a_f(:,i)<270
    abb=(dm_a_f-180);
else
    abb=(dm_a_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:20
    tm_f=tm_a_f(:,j);
    hs_f=hs_a_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f=[Thetab_f Thetab_a];
Hb_f=[Hb_f;Hb_a];
hb_f=[hb_f;hb_a];
R_f=[R_f;R_a];
S_f=[S_f;S_a];
V_f=[V_f;V_a];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_End_8p5=transport./conversion;


clearvars -EXCEPT Q_hist Q_Mid_4p5 Q_Mid_8p5 Q_End_4p5 Q_End_8p5 lon_f lat_f


%%
%Load selected ensemble data: ERA5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE_ERA5_yearly.mat', 'DM_ERA5_', 'HS_ERA5_', 'TM_ERA5_', 'lat_f', 'lon_f')

%% Calculate directions relative to the north for coast

%global loop to compute hs gradients
%ANGLE=[]; ANGG=[]; 
angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=2; %Radius of the circle (in Â°) to select the coastline which direction will be estimated


shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<1);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
%ANGG=[ANGG ang_coast];

if ang_coast<0
%ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    %ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end


%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=HS_ERA5_; tm_a_f=TM_ERA5_; dm_a_f=DM_ERA5_;
abcc=[];
for i=1:43
if dm_a_f(:,i)<180 & dm_a_f(:,i)>90
    abb=dm_a_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_a_f(:,i)>180 & dm_a_f(:,i)<270
    abb=(dm_a_f-180);
else
    abb=(dm_a_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:43
    tm_f=tm_a_f(:,j);
    hs_f=hs_a_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f=[Thetab_f Thetab_a];
Hb_f=[Hb_f;Hb_a];
hb_f=[hb_f;hb_a];
R_f=[R_f;R_a];
S_f=[S_f;S_a];
V_f=[V_f;V_a];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_ERA5=transport./conversion;


clearvars -EXCEPT Q_hist Q_Mid_4p5 Q_Mid_8p5 Q_End_4p5 Q_End_8p5 Q_ERA5 lon_f lat_f



%% Plot annual LST average
z=nanmean(Q_Mid_8p5,1);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
m_proj('mercator','longitude',[-21 21],'latitude',[-21 21]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(lon_f,lat_f,60,z,'filled'); %shading flat;
m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Annaual average of Longshore Sediment Transport between 1979-2004 in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0

