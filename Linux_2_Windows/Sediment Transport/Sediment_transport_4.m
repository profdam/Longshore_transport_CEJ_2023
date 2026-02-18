%Load selected ensemble data: hist
clc;clear;
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')


%% Load uniform coastline direction
load('D:/Review Papers/Sediment Transport/Linux_2_Windows/Sediment Transport/Scripts_data/coastline_direction_uniform.mat', 'True_coastline_direction')
angg=True_coastline_direction;

%Estimation of Normal to coastline
for i=1:45
if i==1 | i<=3
    abb_a(i)=angg(i)-90;
elseif i==4
    abb_a(i)=angg(i)-90;
elseif i==5 | i<=8
    abb_a(i)=angg(i)-90;
elseif i==9 | i<=12
    abb_a(i)=angg(i)-90;
elseif i==13 | i<=17
    %abb_a(i)=angg(i)+90;
    abb_a(i)=(90-angg(i))+90;
elseif i==18 | i<=23
    abb_a(i)=angg(i)-90;
elseif i==24 | i<=34
    abb_a(i)=(90-angg(i))+90;
elseif i==35 | i<=38
    abb_a(i)=angg(i)-90;
else
    abb_a(i)=(90-angg(i))+90;
end
end

angg=abb_a; clear abb_a
%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=hs_a; tm_a_f=tm_a; dm_a_f=dm_a;
hs_s_f=hs_s; tm_s_f=tm_s; dm_s_f=dm_s;
hs_w_f=hs_w; tm_w_f=tm_w; dm_w_f=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:27
    
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_s(j)=abs(angg(j))-aaa_da(j);
else
   abb_s(j)=aaa_da(j)-angg(j);
       end
   end

abcc_a=[abcc_a; abb_a];

abcc_w=[abcc_w; abb_w];

abcc_s=[abcc_s; abb_s];
end

abcc_a=abcc_a'; abcc_s=abcc_s'; abcc_w=abcc_w';

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
Thetab_f_a=[Thetab_f_a;Thetab_a];
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
Thetab_f_w=[Thetab_f_w;Thetab_w];
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
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%% % transport longshore 

%Calculate omega and transport
OMEGA_a=[]; OMEGA_w=[]; OMEGA_s=[];
for j=1:27
    Hb_a=Hb_f_a(j,:);
    V_a=V_f_a(j,:);

   Hb_w=Hb_f_w(j,:);
    V_w=V_f_w(j,:);

    Hb_s=Hb_f_s(j,:);
    V_s=V_f_s(j,:);

    
for i=1:length(lon_f)
omega_a(i)=Hb_a(i).^2.*V_a(i);
omega_w(i)=Hb_w(i).^2.*V_w(i);
omega_s(i)=Hb_s(i).^2.*V_s(i);
end
OMEGA_a=[OMEGA_a;omega_a];
OMEGA_w=[OMEGA_w;omega_w];
OMEGA_s=[OMEGA_s;omega_s];
end

%%
TRANSPORT_a=[]; TRANSPORT_w=[]; TRANSPORT_s=[];
for j=1:27
    omega_a=OMEGA_a(j,:);
    omega_w=OMEGA_w(j,:);
    omega_s=OMEGA_s(j,:);
    
for i=1:length(lon_f)
if omega_a(i) <0.15
    transport_a(i) = 0.023.*(omega_a(i));%% %% p�riodes calmes
else 
    transport_a(i) = 0.00225 + (0.008.*(omega_a(i))); %% p�riodes de tempete
end

for i=1:length(lon_f)
if omega_w(i) <0.15
    transport_w(i) = 0.023.*(omega_w(i));%% %% p�riodes calmes
else 
    transport_w(i) = 0.00225 + (0.008.*(omega_w(i))); %% p�riodes de tempete
end
end

for i=1:length(lon_f)
if omega_s(i) <0.15
    transport_s(i) = 0.023.*(omega_s(i));%% %% p�riodes calmes
else 
    transport_s(i) = 0.00225 + (0.008.*(omega_s(i))); %% p�riodes de tempete
end
end

end
TRANSPORT_a=[TRANSPORT_a;transport_a];
TRANSPORT_w=[TRANSPORT_w;transport_w];
TRANSPORT_s=[TRANSPORT_s;transport_s];

end

%% Convert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_hist_a=TRANSPORT_a./conversion;
Q_hist_s=TRANSPORT_s./conversion;
Q_hist_w=TRANSPORT_w./conversion;
V_hist_a=V_f_a;
V_hist_s=V_f_s;
V_hist_w=V_f_w;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f angg...
    V_hist_a V_hist_s V_hist_w

%%
%Load selected ensemble data: Mid_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Mid4p5_1.mat')
%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=hs_a; tm_a_f=tm_a; dm_a_f=dm_a;
hs_s_f=hs_s; tm_s_f=tm_s; dm_s_f=dm_s;
hs_w_f=hs_w; tm_w_f=tm_w; dm_w_f=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_s(j)=abs(angg(j))-aaa_da(j);
else
   abb_s(j)=aaa_da(j)-angg(j);
       end
   end

abcc_a=[abcc_a; abb_a];

abcc_w=[abcc_w; abb_w];

abcc_s=[abcc_s; abb_s];
end

abcc_a=abcc_a'; abcc_s=abcc_s'; abcc_w=abcc_w';

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
Thetab_f_a=[Thetab_f_a;Thetab_a];
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
Thetab_f_w=[Thetab_f_w;Thetab_w];
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
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%% % transport longshore 

%Calculate omega and transport
OMEGA_a=[]; OMEGA_w=[]; OMEGA_s=[];
for j=1:20
    Hb_a=Hb_f_a(j,:);
    V_a=V_f_a(j,:);

   Hb_w=Hb_f_w(j,:);
    V_w=V_f_w(j,:);

    Hb_s=Hb_f_s(j,:);
    V_s=V_f_s(j,:);

    
for i=1:length(lon_f)
omega_a(i)=Hb_a(i).^2.*V_a(i);
omega_w(i)=Hb_w(i).^2.*V_w(i);
omega_s(i)=Hb_s(i).^2.*V_s(i);
end
OMEGA_a=[OMEGA_a;omega_a];
OMEGA_w=[OMEGA_w;omega_w];
OMEGA_s=[OMEGA_s;omega_s];
end

%%
TRANSPORT_a=[]; TRANSPORT_w=[]; TRANSPORT_s=[];
for j=1:20
    omega_a=OMEGA_a(j,:);
    omega_w=OMEGA_w(j,:);
    omega_s=OMEGA_s(j,:);
    
for i=1:length(lon_f)
if omega_a(i) <0.15
    transport_a(i) = 0.023.*(omega_a(i));%% %% p�riodes calmes
else 
    transport_a(i) = 0.00225 + (0.008.*(omega_a(i))); %% p�riodes de tempete
end

for i=1:length(lon_f)
if omega_w(i) <0.15
    transport_w(i) = 0.023.*(omega_w(i));%% %% p�riodes calmes
else 
    transport_w(i) = 0.00225 + (0.008.*(omega_w(i))); %% p�riodes de tempete
end
end

for i=1:length(lon_f)
if omega_s(i) <0.15
    transport_s(i) = 0.023.*(omega_s(i));%% %% p�riodes calmes
else 
    transport_s(i) = 0.00225 + (0.008.*(omega_s(i))); %% p�riodes de tempete
end
end

end
TRANSPORT_a=[TRANSPORT_a;transport_a];
TRANSPORT_w=[TRANSPORT_w;transport_w];
TRANSPORT_s=[TRANSPORT_s;transport_s];

end
% Convert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_Mid_4p5_a=TRANSPORT_a./conversion;
Q_Mid_4p5_s=TRANSPORT_s./conversion;
Q_Mid_4p5_w=TRANSPORT_w./conversion;
V_Mid_4p5_a=V_f_a;
V_Mid_4p5_s=V_f_s;
V_Mid_4p5_w=V_f_w;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f angg...
V_hist_a V_hist_s V_hist_w V_Mid_4p5_a V_Mid_4p5_s V_Mid_4p5_w

%%
plot(nanmean(Q_Mid_4p5_a,1),'o-r'); hold on; plot(nanmean(Q_Mid_4p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_Mid_4p5_w,1),'o-k');

%%
%Load selected ensemble data: Mid_8p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Mid8p5_1.mat')

%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=hs_a; tm_a_f=tm_a; dm_a_f=dm_a;
hs_s_f=hs_s; tm_s_f=tm_s; dm_s_f=dm_s;
hs_w_f=hs_w; tm_w_f=tm_w; dm_w_f=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_s(j)=abs(angg(j))-aaa_da(j);
else
   abb_s(j)=aaa_da(j)-angg(j);
       end
   end

abcc_a=[abcc_a; abb_a];

abcc_w=[abcc_w; abb_w];

abcc_s=[abcc_s; abb_s];
end

abcc_a=abcc_a'; abcc_s=abcc_s'; abcc_w=abcc_w';

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
Thetab_f_a=[Thetab_f_a;Thetab_a];
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
Thetab_f_w=[Thetab_f_w;Thetab_w];
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
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%% % transport longshore 

%Calculate omega and transport
OMEGA_a=[]; OMEGA_w=[]; OMEGA_s=[];
for j=1:20
    Hb_a=Hb_f_a(j,:);
    V_a=V_f_a(j,:);

   Hb_w=Hb_f_w(j,:);
    V_w=V_f_w(j,:);

    Hb_s=Hb_f_s(j,:);
    V_s=V_f_s(j,:);

    
for i=1:length(lon_f)
omega_a(i)=Hb_a(i).^2.*V_a(i);
omega_w(i)=Hb_w(i).^2.*V_w(i);
omega_s(i)=Hb_s(i).^2.*V_s(i);
end
OMEGA_a=[OMEGA_a;omega_a];
OMEGA_w=[OMEGA_w;omega_w];
OMEGA_s=[OMEGA_s;omega_s];
end

%%
TRANSPORT_a=[]; TRANSPORT_w=[]; TRANSPORT_s=[];
for j=1:20
    omega_a=OMEGA_a(j,:);
    omega_w=OMEGA_w(j,:);
    omega_s=OMEGA_s(j,:);
    
for i=1:length(lon_f)
if omega_a(i) <0.15
    transport_a(i) = 0.023.*(omega_a(i));%% %% p�riodes calmes
else 
    transport_a(i) = 0.00225 + (0.008.*(omega_a(i))); %% p�riodes de tempete
end

for i=1:length(lon_f)
if omega_w(i) <0.15
    transport_w(i) = 0.023.*(omega_w(i));%% %% p�riodes calmes
else 
    transport_w(i) = 0.00225 + (0.008.*(omega_w(i))); %% p�riodes de tempete
end
end

for i=1:length(lon_f)
if omega_s(i) <0.15
    transport_s(i) = 0.023.*(omega_s(i));%% %% p�riodes calmes
else 
    transport_s(i) = 0.00225 + (0.008.*(omega_s(i))); %% p�riodes de tempete
end
end

end
TRANSPORT_a=[TRANSPORT_a;transport_a];
TRANSPORT_w=[TRANSPORT_w;transport_w];
TRANSPORT_s=[TRANSPORT_s;transport_s];

end

% Convert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_Mid_8p5_a=TRANSPORT_a./conversion;
Q_Mid_8p5_s=TRANSPORT_s./conversion;
Q_Mid_8p5_w=TRANSPORT_w./conversion;
V_Mid_8p5_a=V_f_a;
V_Mid_8p5_s=V_f_s;
V_Mid_8p5_w=V_f_w;
clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
    Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f...
    Q_Mid_8p5_a Q_Mid_8p5_s Q_Mid_8p5_w lon_f lat_f angg...
    V_hist_a V_hist_s V_hist_w V_Mid_4p5_a V_Mid_4p5_s V_Mid_4p5_w...
    V_Mid_8p5_a V_Mid_8p5_s V_Mid_8p5_w

%%
plot(nanmean(Q_Mid_8p5_a,1),'o-r'); hold on; plot(nanmean(Q_Mid_8p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_Mid_8p5_w,1),'o-k');

%%
%Load selected ensemble data: End_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_End4p5_1.mat')

%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=hs_a; tm_a_f=tm_a; dm_a_f=dm_a;
hs_s_f=hs_s; tm_s_f=tm_s; dm_s_f=dm_s;
hs_w_f=hs_w; tm_w_f=tm_w; dm_w_f=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_s(j)=abs(angg(j))-aaa_da(j);
else
   abb_s(j)=aaa_da(j)-angg(j);
       end
   end

abcc_a=[abcc_a; abb_a];

abcc_w=[abcc_w; abb_w];

abcc_s=[abcc_s; abb_s];
end

abcc_a=abcc_a'; abcc_s=abcc_s'; abcc_w=abcc_w';

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
Thetab_f_a=[Thetab_f_a;Thetab_a];
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
Thetab_f_w=[Thetab_f_w;Thetab_w];
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
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%% % transport longshore 

%Calculate omega and transport
OMEGA_a=[]; OMEGA_w=[]; OMEGA_s=[];
for j=1:20
    Hb_a=Hb_f_a(j,:);
    V_a=V_f_a(j,:);

   Hb_w=Hb_f_w(j,:);
    V_w=V_f_w(j,:);

    Hb_s=Hb_f_s(j,:);
    V_s=V_f_s(j,:);

    
for i=1:length(lon_f)
omega_a(i)=Hb_a(i).^2.*V_a(i);
omega_w(i)=Hb_w(i).^2.*V_w(i);
omega_s(i)=Hb_s(i).^2.*V_s(i);
end
OMEGA_a=[OMEGA_a;omega_a];
OMEGA_w=[OMEGA_w;omega_w];
OMEGA_s=[OMEGA_s;omega_s];
end

%%
TRANSPORT_a=[]; TRANSPORT_w=[]; TRANSPORT_s=[];
for j=1:20
    omega_a=OMEGA_a(j,:);
    omega_w=OMEGA_w(j,:);
    omega_s=OMEGA_s(j,:);
    
for i=1:length(lon_f)
if omega_a(i) <0.15
    transport_a(i) = 0.023.*(omega_a(i));%% %% p�riodes calmes
else 
    transport_a(i) = 0.00225 + (0.008.*(omega_a(i))); %% p�riodes de tempete
end

for i=1:length(lon_f)
if omega_w(i) <0.15
    transport_w(i) = 0.023.*(omega_w(i));%% %% p�riodes calmes
else 
    transport_w(i) = 0.00225 + (0.008.*(omega_w(i))); %% p�riodes de tempete
end
end

for i=1:length(lon_f)
if omega_s(i) <0.15
    transport_s(i) = 0.023.*(omega_s(i));%% %% p�riodes calmes
else 
    transport_s(i) = 0.00225 + (0.008.*(omega_s(i))); %% p�riodes de tempete
end
end

end
TRANSPORT_a=[TRANSPORT_a;transport_a];
TRANSPORT_w=[TRANSPORT_w;transport_w];
TRANSPORT_s=[TRANSPORT_s;transport_s];

end

% Convert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_End_4p5_a=TRANSPORT_a./conversion;
Q_End_4p5_s=TRANSPORT_s./conversion;
Q_End_4p5_w=TRANSPORT_w./conversion;
V_End_4p5_a=V_f_a;
V_End_4p5_s=V_f_s;
V_End_4p5_w=V_f_w;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
    Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f...
    Q_Mid_8p5_a Q_Mid_8p5_s Q_Mid_8p5_w lon_f lat_f...
    Q_End_4p5_a Q_End_4p5_s Q_End_4p5_w lon_f lat_f angg...
    V_hist_a V_hist_s V_hist_w V_Mid_4p5_a V_Mid_4p5_s V_Mid_4p5_w...
    V_Mid_8p5_a V_Mid_8p5_s V_Mid_8p5_w V_End_4p5_a V_End_4p5_s V_End_4p5_w

%%
plot(nanmean(Q_End_4p5_a,1),'o-r'); hold on; plot(nanmean(Q_End_4p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_End_4p5_w,1),'o-k');

%%
%Load selected ensemble data: End_8p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_End8p5_1.mat')

%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f=hs_a; tm_a_f=tm_a; dm_a_f=dm_a;
hs_s_f=hs_s; tm_s_f=tm_s; dm_s_f=dm_s;
hs_w_f=hs_w; tm_w_f=tm_w; dm_w_f=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_s(j)=abs(angg(j))-aaa_da(j);
else
   abb_s(j)=aaa_da(j)-angg(j);
       end
   end

abcc_a=[abcc_a; abb_a];

abcc_w=[abcc_w; abb_w];

abcc_s=[abcc_s; abb_s];
end

abcc_a=abcc_a'; abcc_s=abcc_s'; abcc_w=abcc_w';

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
Thetab_f_a=[Thetab_f_a;Thetab_a];
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
Thetab_f_w=[Thetab_f_w;Thetab_w];
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
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
R_f_s=[R_f_s;R_s];
S_f_s=[S_f_s;S_s];
V_f_s=[V_f_s;V_s];
end
%% % transport longshore 

%Calculate omega and transport
OMEGA_a=[]; OMEGA_w=[]; OMEGA_s=[];
for j=1:20
    Hb_a=Hb_f_a(j,:);
    V_a=V_f_a(j,:);

   Hb_w=Hb_f_w(j,:);
    V_w=V_f_w(j,:);

    Hb_s=Hb_f_s(j,:);
    V_s=V_f_s(j,:);

    
for i=1:length(lon_f)
omega_a(i)=Hb_a(i).^2.*V_a(i);
omega_w(i)=Hb_w(i).^2.*V_w(i);
omega_s(i)=Hb_s(i).^2.*V_s(i);
end
OMEGA_a=[OMEGA_a;omega_a];
OMEGA_w=[OMEGA_w;omega_w];
OMEGA_s=[OMEGA_s;omega_s];
end

%%
TRANSPORT_a=[]; TRANSPORT_w=[]; TRANSPORT_s=[];
for j=1:20
    omega_a=OMEGA_a(j,:);
    omega_w=OMEGA_w(j,:);
    omega_s=OMEGA_s(j,:);
    
for i=1:length(lon_f)
if omega_a(i) <0.15
    transport_a(i) = 0.023.*(omega_a(i));%% %% p�riodes calmes
else 
    transport_a(i) = 0.00225 + (0.008.*(omega_a(i))); %% p�riodes de tempete
end

for i=1:length(lon_f)
if omega_w(i) <0.15
    transport_w(i) = 0.023.*(omega_w(i));%% %% p�riodes calmes
else 
    transport_w(i) = 0.00225 + (0.008.*(omega_w(i))); %% p�riodes de tempete
end
end

for i=1:length(lon_f)
if omega_s(i) <0.15
    transport_s(i) = 0.023.*(omega_s(i));%% %% p�riodes calmes
else 
    transport_s(i) = 0.00225 + (0.008.*(omega_s(i))); %% p�riodes de tempete
end
end

end
TRANSPORT_a=[TRANSPORT_a;transport_a];
TRANSPORT_w=[TRANSPORT_w;transport_w];
TRANSPORT_s=[TRANSPORT_s;transport_s];

end

% Convert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_End_8p5_a=TRANSPORT_a./conversion;
Q_End_8p5_s=TRANSPORT_s./conversion;
Q_End_8p5_w=TRANSPORT_w./conversion;
V_End_8p5_a=V_f_a;
V_End_8p5_s=V_f_s;
V_End_8p5_w=V_f_w;

clearvars -EXCEPT Q_hist_a Q_hist_s Q_hist_w lon_f lat_f...
    Q_Mid_4p5_a Q_Mid_4p5_s Q_Mid_4p5_w lon_f lat_f...
    Q_Mid_8p5_a Q_Mid_8p5_s Q_Mid_8p5_w lon_f lat_f...
    Q_End_4p5_a Q_End_4p5_s Q_End_4p5_w lon_f lat_f...
    Q_End_8p5_a Q_End_8p5_s Q_End_8p5_w lon_f lat_f angg...
    V_hist_a V_hist_s V_hist_w V_Mid_4p5_a V_Mid_4p5_s V_Mid_4p5_w...
    V_Mid_8p5_a V_Mid_8p5_s V_Mid_8p5_w V_End_4p5_a V_End_4p5_s V_End_4p5_w...
    V_End_8p5_a V_End_8p5_s V_End_8p5_w

%%
plot(nanmean(Q_End_8p5_a,1),'o-r'); hold on; plot(nanmean(Q_End_8p5_s,1),'*-r');hold on;...
    plot(nanmean(Q_End_8p5_w,1),'o-k');


