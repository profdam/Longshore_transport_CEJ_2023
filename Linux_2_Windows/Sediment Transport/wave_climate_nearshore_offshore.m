%Load selected ensemble data: hist
clc;clear
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load uniform coastline direction
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction_uniform.mat', 'True_coastline_direction')
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f_hist=hs_a; tm_a_f_hist=tm_a; dm_a_f_hist=dm_a;
hs_s_f_hist=hs_s; tm_s_f_hist=tm_s; dm_s_f_hist=dm_s;
hs_w_f_hist=hs_w; tm_w_f_hist=tm_w; dm_w_f_hist=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:27
    
 aaa_da=dm_a_f_hist(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f_hist(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f_hist(:,i);
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f_a=[]; Hb_f_a=[]; hb_f_a=[]; R_f_a=[]; S_f_a=[]; V_f_a=[];
Thetab_f_s=[]; Hb_f_s=[]; hb_f_s=[]; R_f_s=[]; S_f_s=[]; V_f_s=[];
Thetab_f_w=[]; Hb_f_w=[]; hb_f_w=[]; R_f_w=[]; S_f_w=[]; V_f_w=[];

for j=1:27
    tm_f_a=tm_a_f_hist(:,j);
    hs_f_a=hs_a_f_hist(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f_hist(:,j);
    hs_f_s=hs_s_f_hist(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f_hist(:,j);
    hs_f_w=hs_w_f_hist(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
     %[Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));

Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
% R_a(i)=R;
% S_a(i)=S;
% V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a;Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
% R_f_a=[R_f_a;R_a];
% S_f_a=[S_f_a;S_a];
% V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
   % [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
% R_w(i)=R;
% S_w(i)=S;
% V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w;Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
% R_f_w=[R_f_w;R_w];
% S_f_w=[S_f_w;S_w];
% V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
%    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
% R_s(i)=R;
% S_s(i)=S;
% V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
% R_f_s=[R_f_s;R_s];
% S_f_s=[S_f_s;S_s];
% V_f_s=[V_f_s;V_s];
end


hs_of_hist_a=hs_a_f_hist;
hs_co_hist_a=Hb_f_a;
tm_of_hist_a=tm_a_f_hist;
tm_co_hist_a=tm_a_f_hist;
dm_of_hist_a=dm_a_f_hist;
dm_co_hist_a=Thetab_f_a;
dep_hist_a=hb_f_a;

hs_of_hist_w=hs_w_f_hist;
hs_co_hist_w=Hb_f_w;
tm_of_hist_w=tm_w_f_hist;
tm_co_hist_w=tm_w_f_hist;
dm_of_hist_w=dm_w_f_hist;
dm_co_hist_w=Thetab_f_w;
dep_hist_w=hb_f_w;

hs_of_hist_s=hs_s_f_hist;
hs_co_hist_s=Hb_f_s;
tm_of_hist_s=tm_s_f_hist;
tm_co_hist_s=tm_s_f_hist;
dm_of_hist_s=dm_s_f_hist;
dm_co_hist_s=Thetab_f_s;
dep_hist_s=hb_f_s;


clearvars -EXCEPT dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
lon_f lat_f angg

%%
%Load selected ensemble data: Mid_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Mid4p5_1.mat')

%Load selected ensemble data: Mid_4p5
%load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load uniform coastline direction
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction_uniform.mat', 'True_coastline_direction')
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
hs_a_f_m4p5=hs_a; tm_a_f_m4p5=tm_a; dm_a_f_m4p5=dm_a;
hs_s_f_m4p5=hs_s; tm_s_f_m4p5=tm_s; dm_s_f_m4p5=dm_s;
hs_w_f_m4p5=hs_w; tm_w_f_m4p5=tm_w; dm_w_f_m4p5=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f_m4p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f_m4p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f_m4p5(:,i);
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate Longshore Sediment Transport (ANNUAL AVERAGE)

Thetab_f_a=[]; Hb_f_a=[]; hb_f_a=[]; R_f_a=[]; S_f_a=[]; V_f_a=[];
Thetab_f_s=[]; Hb_f_s=[]; hb_f_s=[]; R_f_s=[]; S_f_s=[]; V_f_s=[];
Thetab_f_w=[]; Hb_f_w=[]; hb_f_w=[]; R_f_w=[]; S_f_w=[]; V_f_w=[];

for j=1:20
    tm_f_a=tm_a_f_m4p5(:,j);
    hs_f_a=hs_a_f_m4p5(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f_m4p5(:,j);
    hs_f_s=hs_s_f_m4p5(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f_m4p5(:,j);
    hs_f_w=hs_w_f_m4p5(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
     %[Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));

Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
% R_a(i)=R;
% S_a(i)=S;
% V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a;Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
% R_f_a=[R_f_a;R_a];
% S_f_a=[S_f_a;S_a];
% V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
   % [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
% R_w(i)=R;
% S_w(i)=S;
% V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w;Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
% R_f_w=[R_f_w;R_w];
% S_f_w=[S_f_w;S_w];
% V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
%    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
% R_s(i)=R;
% S_s(i)=S;
% V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
% R_f_s=[R_f_s;R_s];
% S_f_s=[S_f_s;S_s];
% V_f_s=[V_f_s;V_s];
end


hs_of_m4p5_a=hs_a_f_m4p5;
hs_co_m4p5_a=Hb_f_a;
tm_of_m4p5_a=tm_a_f_m4p5;
tm_co_m4p5_a=tm_a_f_m4p5;
dm_of_m4p5_a=dm_a_f_m4p5;
dm_co_m4p5_a=Thetab_f_a;
dep_m4p5_a=hb_f_a;

hs_of_m4p5_w=hs_w_f_m4p5;
hs_co_m4p5_w=Hb_f_w;
tm_of_m4p5_w=tm_w_f_m4p5;
tm_co_m4p5_w=tm_w_f_m4p5;
dm_of_m4p5_w=dm_w_f_m4p5;
dm_co_m4p5_w=Thetab_f_w;
dep_m4p5_w=hb_f_w;

hs_of_m4p5_s=hs_s_f_m4p5;
hs_co_m4p5_s=Hb_f_s;
tm_of_m4p5_s=tm_s_f_m4p5;
tm_co_m4p5_s=tm_s_f_m4p5;
dm_of_m4p5_s=dm_s_f_m4p5;
dm_co_m4p5_s=Thetab_f_s;
dep_m4p5_s=hb_f_s;


clearvars -EXCEPT dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
    dm_co_m4p5_a dm_of_m4p5_a tm_co_m4p5_a tm_of_m4p5_a...
    hs_co_m4p5_a hs_of_m4p5_a dep_m4p5_a...
dm_co_m4p5_w dm_of_m4p5_w tm_co_m4p5_w tm_of_m4p5_w...
    hs_co_m4p5_w hs_of_m4p5_w dep_m4p5_w...
dm_co_m4p5_s dm_of_m4p5_s tm_co_m4p5_s tm_of_m4p5_s...
    hs_co_m4p5_s hs_of_m4p5_s dep_m4p5_s...
lon_f lat_f angg

%%
%Load selected ensemble data: Mid_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Mid8p5_1.mat')

%Load selected ensemble data: hist

%load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')


%% Load uniform coastline direction
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction_uniform.mat', 'True_coastline_direction')
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
hs_a_f_m8p5=hs_a; tm_a_f_m8p5=tm_a; dm_a_f_m8p5=dm_a;
hs_s_f_m8p5=hs_s; tm_s_f_m8p5=tm_s; dm_s_f_m8p5=dm_s;
hs_w_f_m8p5=hs_w; tm_w_f_m8p5=tm_w; dm_w_f_m8p5=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f_m8p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f_m8p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f_m8p5(:,i);
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
    tm_f_a=tm_a_f_m8p5(:,j);
    hs_f_a=hs_a_f_m8p5(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f_m8p5(:,j);
    hs_f_s=hs_s_f_m8p5(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f_m8p5(:,j);
    hs_f_w=hs_w_f_m8p5(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
     %[Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));

Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
% R_a(i)=R;
% S_a(i)=S;
% V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a;Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
% R_f_a=[R_f_a;R_a];
% S_f_a=[S_f_a;S_a];
% V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
   % [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
% R_w(i)=R;
% S_w(i)=S;
% V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w;Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
% R_f_w=[R_f_w;R_w];
% S_f_w=[S_f_w;S_w];
% V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
%    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
% R_s(i)=R;
% S_s(i)=S;
% V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
% R_f_s=[R_f_s;R_s];
% S_f_s=[S_f_s;S_s];
% V_f_s=[V_f_s;V_s];
end


hs_of_m8p5_a=hs_a_f_m8p5;
hs_co_m8p5_a=Hb_f_a;
tm_of_m8p5_a=tm_a_f_m8p5;
tm_co_m8p5_a=tm_a_f_m8p5;
dm_of_m8p5_a=dm_a_f_m8p5;
dm_co_m8p5_a=Thetab_f_a;
dep_m8p5_a=hb_f_a;

hs_of_m8p5_w=hs_w_f_m8p5;
hs_co_m8p5_w=Hb_f_w;
tm_of_m8p5_w=tm_w_f_m8p5;
tm_co_m8p5_w=tm_w_f_m8p5;
dm_of_m8p5_w=dm_w_f_m8p5;
dm_co_m8p5_w=Thetab_f_w;
dep_m8p5_w=hb_f_w;

hs_of_m8p5_s=hs_s_f_m8p5;
hs_co_m8p5_s=Hb_f_s;
tm_of_m8p5_s=tm_s_f_m8p5;
tm_co_m8p5_s=tm_s_f_m8p5;
dm_of_m8p5_s=dm_s_f_m8p5;
dm_co_m8p5_s=Thetab_f_s;
dep_m8p5_s=hb_f_s;


clearvars -EXCEPT dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
    dm_co_m4p5_a dm_of_m4p5_a tm_co_m4p5_a tm_of_m4p5_a...
    hs_co_m4p5_a hs_of_m4p5_a dep_m4p5_a...
dm_co_m4p5_w dm_of_m4p5_w tm_co_m4p5_w tm_of_m4p5_w...
    hs_co_m4p5_w hs_of_m4p5_w dep_m4p5_w...
dm_co_m4p5_s dm_of_m4p5_s tm_co_m4p5_s tm_of_m4p5_s...
    hs_co_m4p5_s hs_of_m4p5_s dep_m4p5_s...
dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
    dm_co_m8p5_a dm_of_m8p5_a tm_co_m8p5_a tm_of_m8p5_a...
    hs_co_m8p5_a hs_of_m8p5_a dep_m8p5_a...
dm_co_m8p5_w dm_of_m8p5_w tm_co_m8p5_w tm_of_m8p5_w...
    hs_co_m8p5_w hs_of_m8p5_w dep_m8p5_w...
dm_co_m8p5_s dm_of_m8p5_s tm_co_m8p5_s tm_of_m8p5_s...
    hs_co_m8p5_s hs_of_m8p5_s dep_m8p5_s...
lon_f lat_f angg

%%
%Load selected ensemble data: Mid_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_End4p5_1.mat')

%Load selected ensemble data: hist

%load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')


%% Load uniform coastline direction
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction_uniform.mat', 'True_coastline_direction')
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
hs_a_f_e4p5=hs_a; tm_a_f_e4p5=tm_a; dm_a_f_e4p5=dm_a;
hs_s_f_e4p5=hs_s; tm_s_f_e4p5=tm_s; dm_s_f_e4p5=dm_s;
hs_w_f_e4p5=hs_w; tm_w_f_e4p5=tm_w; dm_w_f_e4p5=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f_e4p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f_e4p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f_e4p5(:,i);
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
    tm_f_a=tm_a_f_e4p5(:,j);
    hs_f_a=hs_a_f_e4p5(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f_e4p5(:,j);
    hs_f_s=hs_s_f_e4p5(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f_e4p5(:,j);
    hs_f_w=hs_w_f_e4p5(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
     %[Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));

Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
% R_a(i)=R;
% S_a(i)=S;
% V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a;Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
% R_f_a=[R_f_a;R_a];
% S_f_a=[S_f_a;S_a];
% V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
   % [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
% R_w(i)=R;
% S_w(i)=S;
% V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w;Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
% R_f_w=[R_f_w;R_w];
% S_f_w=[S_f_w;S_w];
% V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
%    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
% R_s(i)=R;
% S_s(i)=S;
% V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
% R_f_s=[R_f_s;R_s];
% S_f_s=[S_f_s;S_s];
% V_f_s=[V_f_s;V_s];
end


hs_of_e4p5_a=hs_a_f_e4p5;
hs_co_e4p5_a=Hb_f_a;
tm_of_e4p5_a=tm_a_f_e4p5;
tm_co_e4p5_a=tm_a_f_e4p5;
dm_of_e4p5_a=dm_a_f_e4p5;
dm_co_e4p5_a=Thetab_f_a;
dep_e4p5_a=hb_f_a;

hs_of_e4p5_w=hs_w_f_e4p5;
hs_co_e4p5_w=Hb_f_w;
tm_of_e4p5_w=tm_w_f_e4p5;
tm_co_e4p5_w=tm_w_f_e4p5;
dm_of_e4p5_w=dm_w_f_e4p5;
dm_co_e4p5_w=Thetab_f_w;
dep_e4p5_w=hb_f_w;

hs_of_e4p5_s=hs_s_f_e4p5;
hs_co_e4p5_s=Hb_f_s;
tm_of_e4p5_s=tm_s_f_e4p5;
tm_co_e4p5_s=tm_s_f_e4p5;
dm_of_e4p5_s=dm_s_f_e4p5;
dm_co_e4p5_s=Thetab_f_s;
dep_e4p5_s=hb_f_s;


clearvars -EXCEPT dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
    dm_co_m4p5_a dm_of_m4p5_a tm_co_m4p5_a tm_of_m4p5_a...
    hs_co_m4p5_a hs_of_m4p5_a dep_m4p5_a...
dm_co_m4p5_w dm_of_m4p5_w tm_co_m4p5_w tm_of_m4p5_w...
    hs_co_m4p5_w hs_of_m4p5_w dep_m4p5_w...
dm_co_m4p5_s dm_of_m4p5_s tm_co_m4p5_s tm_of_m4p5_s...
    hs_co_m4p5_s hs_of_m4p5_s dep_m4p5_s...
dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
    dm_co_m8p5_a dm_of_m8p5_a tm_co_m8p5_a tm_of_m8p5_a...
    hs_co_m8p5_a hs_of_m8p5_a dep_m8p5_a...
dm_co_m8p5_w dm_of_m8p5_w tm_co_m8p5_w tm_of_m8p5_w...
    hs_co_m8p5_w hs_of_m8p5_w dep_m8p5_w...
dm_co_m8p5_s dm_of_m8p5_s tm_co_m8p5_s tm_of_m8p5_s...
    hs_co_m8p5_s hs_of_m8p5_s dep_m8p5_s...
    dm_co_e4p5_a dm_of_e4p5_a tm_co_e4p5_a tm_of_e4p5_a...
    hs_co_e4p5_a hs_of_e4p5_a dep_e4p5_a...
dm_co_e4p5_w dm_of_e4p5_w tm_co_e4p5_w tm_of_e4p5_w...
    hs_co_e4p5_w hs_of_e4p5_w dep_e4p5_w...
dm_co_e4p5_s dm_of_e4p5_s tm_co_e4p5_s tm_of_e4p5_s...
    hs_co_e4p5_s hs_of_e4p5_s dep_e4p5_s...
lon_f lat_f angg

%%
%Load selected ensemble data: Mid_4p5

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_End8p5_1.mat')

%Load selected ensemble data: hist

%load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')


%% Load uniform coastline direction
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction_uniform.mat', 'True_coastline_direction')
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
hs_a_f_e8p5=hs_a; tm_a_f_e8p5=tm_a; dm_a_f_e8p5=dm_a;
hs_s_f_e8p5=hs_s; tm_s_f_e8p5=tm_s; dm_s_f_e8p5=dm_s;
hs_w_f_e8p5=hs_w; tm_w_f_e8p5=tm_w; dm_w_f_e8p5=dm_w;

abcc_a=[]; abcc_s=[]; abcc_w=[];


for i=1:20
    
 aaa_da=dm_a_f_e8p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_a(j)=abs(angg(j))-aaa_da(j);
else
   abb_a(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_w_f_e8p5(:,i);
   for j=1:length(aaa_da)
       if angg(j)<0
   abb_w(j)=abs(angg(j))-aaa_da(j);
else
   abb_w(j)=aaa_da(j)-angg(j);
       end
   end


aaa_da=dm_s_f_e8p5(:,i);
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
    tm_f_a=tm_a_f_e8p5(:,j);
    hs_f_a=hs_a_f_e8p5(:,j);
    abc_a=abcc_a(:,j);
    
    tm_f_s=tm_s_f_e8p5(:,j);
    hs_f_s=hs_s_f_e8p5(:,j);
    abc_s=abcc_s(:,j);
    
    tm_f_w=tm_w_f_e8p5(:,j);
    hs_f_w=hs_w_f_e8p5(:,j);
    abc_w=abcc_w(:,j);
    
for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));
     %[Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_a(i),hs_f_a(i),abc_a(i));

Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
% R_a(i)=R;
% S_a(i)=S;
% V_a(i)=V;
end
Thetab_f_a=[Thetab_f_a;Thetab_a];
Hb_f_a=[Hb_f_a;Hb_a];
hb_f_a=[hb_f_a;hb_a];
% R_f_a=[R_f_a;R_a];
% S_f_a=[S_f_a;S_a];
% V_f_a=[V_f_a;V_a];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
   % [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_w(i),hs_f_w(i),abc_w(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
% R_w(i)=R;
% S_w(i)=S;
% V_w(i)=V;
end
Thetab_f_w=[Thetab_f_w;Thetab_w];
Hb_f_w=[Hb_f_w;Hb_w];
hb_f_w=[hb_f_w;hb_w];
% R_f_w=[R_f_w;R_w];
% S_f_w=[S_f_w;S_w];
% V_f_w=[V_f_w;V_w];

for i=1:length(lon_f)
    [Thetab,Hb,hb]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
%    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f_s(i),hs_f_s(i),abc_s(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
% R_s(i)=R;
% S_s(i)=S;
% V_s(i)=V;
end
Thetab_f_s=[Thetab_f_s;Thetab_s];
Hb_f_s=[Hb_f_s;Hb_s];
hb_f_s=[hb_f_s;hb_s];
% R_f_s=[R_f_s;R_s];
% S_f_s=[S_f_s;S_s];
% V_f_s=[V_f_s;V_s];
end


hs_of_e8p5_a=hs_a_f_e8p5;
hs_co_e8p5_a=Hb_f_a;
tm_of_e8p5_a=tm_a_f_e8p5;
tm_co_e8p5_a=tm_a_f_e8p5;
dm_of_e8p5_a=dm_a_f_e8p5;
dm_co_e8p5_a=Thetab_f_a;
dep_e8p5_a=hb_f_a;

hs_of_e8p5_w=hs_w_f_e8p5;
hs_co_e8p5_w=Hb_f_w;
tm_of_e8p5_w=tm_w_f_e8p5;
tm_co_e8p5_w=tm_w_f_e8p5;
dm_of_e8p5_w=dm_w_f_e8p5;
dm_co_e8p5_w=Thetab_f_w;
dep_e8p5_w=hb_f_w;

hs_of_e8p5_s=hs_s_f_e8p5;
hs_co_e8p5_s=Hb_f_s;
tm_of_e8p5_s=tm_s_f_e8p5;
tm_co_e8p5_s=tm_s_f_e8p5;
dm_of_e8p5_s=dm_s_f_e8p5;
dm_co_e8p5_s=Thetab_f_s;
dep_e8p5_s=hb_f_s;


clearvars -EXCEPT dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
    dm_co_m4p5_a dm_of_m4p5_a tm_co_m4p5_a tm_of_m4p5_a...
    hs_co_m4p5_a hs_of_m4p5_a dep_m4p5_a...
dm_co_m4p5_w dm_of_m4p5_w tm_co_m4p5_w tm_of_m4p5_w...
    hs_co_m4p5_w hs_of_m4p5_w dep_m4p5_w...
dm_co_m4p5_s dm_of_m4p5_s tm_co_m4p5_s tm_of_m4p5_s...
    hs_co_m4p5_s hs_of_m4p5_s dep_m4p5_s...
dm_co_hist_a dm_of_hist_a tm_co_hist_a tm_of_hist_a...
    hs_co_hist_a hs_of_hist_a dep_hist_a...
dm_co_hist_w dm_of_hist_w tm_co_hist_w tm_of_hist_w...
    hs_co_hist_w hs_of_hist_w dep_hist_w...
dm_co_hist_s dm_of_hist_s tm_co_hist_s tm_of_hist_s...
    hs_co_hist_s hs_of_hist_s dep_hist_s...
    dm_co_m8p5_a dm_of_m8p5_a tm_co_m8p5_a tm_of_m8p5_a...
    hs_co_m8p5_a hs_of_m8p5_a dep_m8p5_a...
dm_co_m8p5_w dm_of_m8p5_w tm_co_m8p5_w tm_of_m8p5_w...
    hs_co_m8p5_w hs_of_m8p5_w dep_m8p5_w...
dm_co_m8p5_s dm_of_m8p5_s tm_co_m8p5_s tm_of_m8p5_s...
    hs_co_m8p5_s hs_of_m8p5_s dep_m8p5_s...
    dm_co_e4p5_a dm_of_e4p5_a tm_co_e4p5_a tm_of_e4p5_a...
    hs_co_e4p5_a hs_of_e4p5_a dep_e4p5_a...
dm_co_e4p5_w dm_of_e4p5_w tm_co_e4p5_w tm_of_e4p5_w...
    hs_co_e4p5_w hs_of_e4p5_w dep_e4p5_w...
dm_co_e4p5_s dm_of_e4p5_s tm_co_e4p5_s tm_of_e4p5_s...
    hs_co_e4p5_s hs_of_e4p5_s dep_e4p5_s...
    dm_co_e8p5_a dm_of_e8p5_a tm_co_e8p5_a tm_of_e8p5_a...
    hs_co_e8p5_a hs_of_e8p5_a dep_e8p5_a...
dm_co_e8p5_w dm_of_e8p5_w tm_co_e8p5_w tm_of_e8p5_w...
    hs_co_e8p5_w hs_of_e8p5_w dep_e8p5_w...
dm_co_e8p5_s dm_of_e8p5_s tm_co_e8p5_s tm_of_e8p5_s...
    hs_co_e8p5_s hs_of_e8p5_s dep_e8p5_s...
lon_f lat_f angg

