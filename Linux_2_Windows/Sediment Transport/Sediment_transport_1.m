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


for i=1:27
    
% aaaa_da=aaa_da(:)-angg(:);
% abcc_a=[abcc_a abs(aaaa_da)];
% end
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_a=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_a=(aaa_da-180);
else
    abb_a=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_w=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_w=(aaa_da-180);
else
    abb_w=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_s=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_s=(aaa_da-180);
else
    abb_s=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
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

Thetab_f_a=[]; Hb_f_a=[]; hb_f_a=[]; R_f_a=[]; S_f_a=[]; V_f_a=[];
Thetab_f_s=[]; Hb_f_s=[]; hb_f_s=[]; R_f_s=[]; S_f_s=[]; V_f_s=[];
Thetab_f_w=[]; Hb_f_w=[]; hb_f_w=[]; R_f_w=[]; S_f_w=[]; V_f_w=[];

for j=1:27
    tm_f_a=tm_a_f(:,j);
    hs_f_a=hs_a_f(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f(:,j);
    hs_f_s=hs_s_f(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f(:,j);
    hs_f_w=hs_w_f(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
R_f_a=[R_f_a;R_a];
S_f_a=[S_f_a;S_a];
V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
R_w(i)=R;
S_w(i)=S;
V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
R_f_w=[R_f_w;R_w];
S_f_w=[S_f_w;S_w];
V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
R_s(i)=R;
S_s(i)=S;
V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%%
%Calculate omega and transport
omega_a=Hb_f_a.^2.*V_f_a;

omega_s=Hb_f_s.^2.*V_f_s;

omega_w=Hb_f_w.^2.*V_f_w;

% transport longshore 
if omega_a <0.15
    transport_a = 0.023.*(omega_a);%% %% p�riodes calmes
else 
    transport_a = 0.00225 + (0.008.*(omega_a)); %% p�riodes de tempete
end


if omega_s <0.15
    transport_s = 0.023.*(omega_s);%% %% p�riodes calmes
else 
    transport_s = 0.00225 + (0.008.*(omega_s)); %% p�riodes de tempete
end

if omega_w <0.15
    transport_w = 0.023.*(omega_w);%% %% p�riodes calmes
else 
    transport_w = 0.00225 + (0.008.*(omega_w)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_hist_a=transport_a./conversion;
Q_hist_s=transport_s./conversion;
Q_hist_w=transport_w./conversion;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f

%%
% Q_hist_w(isnan(Q_hist_w))=0;
% Q_hist_a(isnan(Q_hist_a))=0;
% Q_hist_s(isnan(Q_hist_s))=0;
% plot(nanmean(Q_hist_a,2),'o-r'); hold on; plot(nanmean(Q_hist_s,2),'*-c');hold on;...
%     plot(nanmean(Q_hist_w,2),'o-b');
%%
% plot(Q_hist_s(:,27)),'o-r'); hold on; plot(nanmean(Q_hist_s,2),'*-c');hold on;...
%     plot(nanmean(Q_hist_w,2),'o-b');

%%
%Load selected ensemble data: Mid_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Mid4p5_1.mat')

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


for i=1:20
    
% aaaa_da=aaa_da(:)-angg(:);
% abcc_a=[abcc_a abs(aaaa_da)];
% end
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_a=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_a=(aaa_da-180);
else
    abb_a=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_w=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_w=(aaa_da-180);
else
    abb_w=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_s=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_s=(aaa_da-180);
else
    abb_s=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
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

Thetab_f_a=[]; Hb_f_a=[]; hb_f_a=[]; R_f_a=[]; S_f_a=[]; V_f_a=[];
Thetab_f_s=[]; Hb_f_s=[]; hb_f_s=[]; R_f_s=[]; S_f_s=[]; V_f_s=[];
Thetab_f_w=[]; Hb_f_w=[]; hb_f_w=[]; R_f_w=[]; S_f_w=[]; V_f_w=[];

for j=1:20
    tm_f_a=tm_a_f(:,j);
    hs_f_a=hs_a_f(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f(:,j);
    hs_f_s=hs_s_f(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f(:,j);
    hs_f_w=hs_w_f(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
R_f_a=[R_f_a;R_a];
S_f_a=[S_f_a;S_a];
V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
R_w(i)=R;
S_w(i)=S;
V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
R_f_w=[R_f_w;R_w];
S_f_w=[S_f_w;S_w];
V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
R_s(i)=R;
S_s(i)=S;
V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%%
%Calculate omega and transport
omega_a=Hb_f_a.^2.*V_f_a;

omega_s=Hb_f_s.^2.*V_f_s;

omega_w=Hb_f_w.^2.*V_f_w;

% transport longshore 
if omega_a <0.15
    transport_a = 0.023.*(omega_a);%% %% p�riodes calmes
else 
    transport_a = 0.00225 + (0.008.*(omega_a)); %% p�riodes de tempete
end


if omega_s <0.15
    transport_s = 0.023.*(omega_s);%% %% p�riodes calmes
else 
    transport_s = 0.00225 + (0.008.*(omega_s)); %% p�riodes de tempete
end

if omega_w <0.15
    transport_w = 0.023.*(omega_w);%% %% p�riodes calmes
else 
    transport_w = 0.00225 + (0.008.*(omega_w)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_Mid_4p5_a=transport_a./conversion;
Q_Mid_4p5_s=transport_s./conversion;
Q_Mid_4p5_w=transport_w./conversion;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f

%%
plot(nanmean(Q_Mid_4p5_a,1),'o-r'); hold on; plot(nanmean(Q_Mid_4p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_Mid_4p5_w,1),'o-k');

%%
%Load selected ensemble data: Mid_8p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Mid8p5_1.mat')

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


for i=1:20
    
% aaaa_da=aaa_da(:)-angg(:);
% abcc_a=[abcc_a abs(aaaa_da)];
% end
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_a=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_a=(aaa_da-180);
else
    abb_a=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_w=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_w=(aaa_da-180);
else
    abb_w=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_s=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_s=(aaa_da-180);
else
    abb_s=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
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

Thetab_f_a=[]; Hb_f_a=[]; hb_f_a=[]; R_f_a=[]; S_f_a=[]; V_f_a=[];
Thetab_f_s=[]; Hb_f_s=[]; hb_f_s=[]; R_f_s=[]; S_f_s=[]; V_f_s=[];
Thetab_f_w=[]; Hb_f_w=[]; hb_f_w=[]; R_f_w=[]; S_f_w=[]; V_f_w=[];

for j=1:20
    tm_f_a=tm_a_f(:,j);
    hs_f_a=hs_a_f(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f(:,j);
    hs_f_s=hs_s_f(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f(:,j);
    hs_f_w=hs_w_f(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
R_f_a=[R_f_a;R_a];
S_f_a=[S_f_a;S_a];
V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
R_w(i)=R;
S_w(i)=S;
V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
R_f_w=[R_f_w;R_w];
S_f_w=[S_f_w;S_w];
V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
R_s(i)=R;
S_s(i)=S;
V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%%
%Calculate omega and transport
omega_a=Hb_f_a.^2.*V_f_a;

omega_s=Hb_f_s.^2.*V_f_s;

omega_w=Hb_f_w.^2.*V_f_w;

% transport longshore 
if omega_a <0.15
    transport_a = 0.023.*(omega_a);%% %% p�riodes calmes
else 
    transport_a = 0.00225 + (0.008.*(omega_a)); %% p�riodes de tempete
end


if omega_s <0.15
    transport_s = 0.023.*(omega_s);%% %% p�riodes calmes
else 
    transport_s = 0.00225 + (0.008.*(omega_s)); %% p�riodes de tempete
end

if omega_w <0.15
    transport_w = 0.023.*(omega_w);%% %% p�riodes calmes
else 
    transport_w = 0.00225 + (0.008.*(omega_w)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_Mid_8p5_a=transport_a./conversion;
Q_Mid_8p5_s=transport_s./conversion;
Q_Mid_8p5_w=transport_w./conversion;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
    Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f...
    Q_Mid_8p5_a Q_Mid_8p5_s Q_Mid_8p5_w lon_f lat_f

%%
plot(nanmean(Q_Mid_8p5_a,1),'o-r'); hold on; plot(nanmean(Q_Mid_8p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_Mid_8p5_w,1),'o-k');

%%
%Load selected ensemble data: End_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_End4p5_1.mat')

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


for i=1:20
    
% aaaa_da=aaa_da(:)-angg(:);
% abcc_a=[abcc_a abs(aaaa_da)];
% end
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_a=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_a=(aaa_da-180);
else
    abb_a=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_w=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_w=(aaa_da-180);
else
    abb_w=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_s=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_s=(aaa_da-180);
else
    abb_s=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
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

Thetab_f_a=[]; Hb_f_a=[]; hb_f_a=[]; R_f_a=[]; S_f_a=[]; V_f_a=[];
Thetab_f_s=[]; Hb_f_s=[]; hb_f_s=[]; R_f_s=[]; S_f_s=[]; V_f_s=[];
Thetab_f_w=[]; Hb_f_w=[]; hb_f_w=[]; R_f_w=[]; S_f_w=[]; V_f_w=[];

for j=1:20
    tm_f_a=tm_a_f(:,j);
    hs_f_a=hs_a_f(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f(:,j);
    hs_f_s=hs_s_f(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f(:,j);
    hs_f_w=hs_w_f(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
R_f_a=[R_f_a;R_a];
S_f_a=[S_f_a;S_a];
V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
R_w(i)=R;
S_w(i)=S;
V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
R_f_w=[R_f_w;R_w];
S_f_w=[S_f_w;S_w];
V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
R_s(i)=R;
S_s(i)=S;
V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%%
%Calculate omega and transport
omega_a=Hb_f_a.^2.*V_f_a;

omega_s=Hb_f_s.^2.*V_f_s;

omega_w=Hb_f_w.^2.*V_f_w;

% transport longshore 
if omega_a <0.15
    transport_a = 0.023.*(omega_a);%% %% p�riodes calmes
else 
    transport_a = 0.00225 + (0.008.*(omega_a)); %% p�riodes de tempete
end


if omega_s <0.15
    transport_s = 0.023.*(omega_s);%% %% p�riodes calmes
else 
    transport_s = 0.00225 + (0.008.*(omega_s)); %% p�riodes de tempete
end

if omega_w <0.15
    transport_w = 0.023.*(omega_w);%% %% p�riodes calmes
else 
    transport_w = 0.00225 + (0.008.*(omega_w)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_End_4p5_a=transport_a./conversion;
Q_End_4p5_s=transport_s./conversion;
Q_End_4p5_w=transport_w./conversion;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
    Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f...
    Q_Mid_8p5_a Q_Mid_8p5_s Q_Mid_8p5_w lon_f lat_f...
    Q_End_4p5_a Q_End_4p5_s Q_End_4p5_w lon_f lat_f

%%
plot(nanmean(Q_End_4p5_a,1),'o-r'); hold on; plot(nanmean(Q_End_4p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_End_4p5_w,1),'o-k');

%%
%Load selected ensemble data: End_8p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_End8p5_1.mat')

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


for i=1:20
    
% aaaa_da=aaa_da(:)-angg(:);
% abcc_a=[abcc_a abs(aaaa_da)];
% end
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_a=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_a=(aaa_da-180);
else
    abb_a=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_w=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_w=(aaa_da-180);
else
    abb_w=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
   end


 aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
if aaa_da(j)<180 & aaa_da(j)>90
    abb_s=aaa_da(j)+180;
%abb=abs((dm_f-90))+270;
elseif aaa_da(j)>180 & aaa_da(j)<270
    abb_s=(aaa_da-180);
else
    abb_s=(aaa_da(j)-180);
    %abb=abs((dm_f-270))+90;
end
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

Thetab_f_a=[]; Hb_f_a=[]; hb_f_a=[]; R_f_a=[]; S_f_a=[]; V_f_a=[];
Thetab_f_s=[]; Hb_f_s=[]; hb_f_s=[]; R_f_s=[]; S_f_s=[]; V_f_s=[];
Thetab_f_w=[]; Hb_f_w=[]; hb_f_w=[]; R_f_w=[]; S_f_w=[]; V_f_w=[];

for j=1:20
    tm_f_a=tm_a_f(:,j);
    hs_f_a=hs_a_f(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f(:,j);
    hs_f_s=hs_s_f(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f(:,j);
    hs_f_w=hs_w_f(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
R_f_a=[R_f_a;R_a];
S_f_a=[S_f_a;S_a];
V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
R_w(i)=R;
S_w(i)=S;
V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
R_f_w=[R_f_w;R_w];
S_f_w=[S_f_w;S_w];
V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
R_s(i)=R;
S_s(i)=S;
V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%%
%Calculate omega and transport
omega_a=Hb_f_a.^2.*V_f_a;

omega_s=Hb_f_s.^2.*V_f_s;

omega_w=Hb_f_w.^2.*V_f_w;

% transport longshore 
if omega_a <0.15
    transport_a = 0.023.*(omega_a);%% %% p�riodes calmes
else 
    transport_a = 0.00225 + (0.008.*(omega_a)); %% p�riodes de tempete
end


if omega_s <0.15
    transport_s = 0.023.*(omega_s);%% %% p�riodes calmes
else 
    transport_s = 0.00225 + (0.008.*(omega_s)); %% p�riodes de tempete
end

if omega_w <0.15
    transport_w = 0.023.*(omega_w);%% %% p�riodes calmes
else 
    transport_w = 0.00225 + (0.008.*(omega_w)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_End_8p5_a=transport_a./conversion;
Q_End_8p5_s=transport_s./conversion;
Q_End_8p5_w=transport_w./conversion;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
    Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f...
    Q_Mid_8p5_a Q_Mid_8p5_s Q_Mid_8p5_w lon_f lat_f...
    Q_End_4p5_a Q_End_4p5_s Q_End_4p5_w lon_f lat_f...
    Q_End_8p5_a Q_End_8p5_s Q_End_8p5_w lon_f lat_f

%%
plot(nanmean(Q_End_8p5_a,1),'o-r'); hold on; plot(nanmean(Q_End_8p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_End_8p5_w,1),'o-k');



%% Replace NANs with zero
Q_hist_w(isnan(Q_hist_w))=0;
Q_hist_a(isnan(Q_hist_a))=0;
Q_hist_s(isnan(Q_hist_s))=0;


Q_Mid_4p5_a(isnan(Q_Mid_4p5_a))=0;
Q_Mid_4p5_s(isnan(Q_Mid_4p5_s))=0;
Q_Mid_4p5_w(isnan(Q_Mid_4p5_w))=0;

Q_Mid_8p5_a(isnan(Q_Mid_8p5_a))=0;
Q_Mid_8p5_s(isnan(Q_Mid_8p5_s))=0;
Q_Mid_8p5_w(isnan(Q_Mid_8p5_w))=0;


Q_End_4p5_a(isnan(Q_End_4p5_a))=0;
Q_End_4p5_s(isnan(Q_End_4p5_s))=0;
Q_End_4p5_w(isnan(Q_End_4p5_w))=0;

Q_End_8p5_a(isnan(Q_End_8p5_a))=0;
Q_End_8p5_s(isnan(Q_End_8p5_s))=0;
Q_End_8p5_w(isnan(Q_End_8p5_w))=0;

%% Plot annual LST average
z=nanmean(Q_hist_s,1);
% cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
cmin=-4*10^5; cmax=7*10^5; int=0.5*10^5; n= round((cmax-cmin)/int);

%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
m_proj('mercator','longitude',[-9 16],'latitude',[-3 16]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(lon_f,lat_f,70,z,'filled'); %shading flat;
m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
%cb =colorbar;
cb=colorbar('ytick',cmin:1*int:cmax); %,'Location','west'
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


%%
%% Plot annual LST average
z=nanmean(Q_hist_s,1);
% cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
cmin=-4*10^5; cmax=7*10^5; int=0.5*10^5; n= round((cmax-cmin)/int);
figure
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
m_proj('mercator','longitude',[-9 16],'latitude',[-3 16]);
%m_gshhs_h('patch',[0.9 0.9 0.9],'linewidth',1);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
m_coast('line','color',[0.5 0.5 0.5],'linewidth',2,'color','k');
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
hold on
%m_names
m_scatter(lon_f,lat_f,70,z,'filled'); %shading flat;
%m_quiver(lon_f1,lat_f1,U,V,.09,'linewidth',4, 'color',[0.5 0.6 0.7]); 
m_vec(15,lon_f1,lat_f1,U,V,'m','headlength',3,'headangle',50);

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
%cb =colorbar;
cb=colorbar('ytick',cmin:1*int:cmax); %,'Location','west'
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


