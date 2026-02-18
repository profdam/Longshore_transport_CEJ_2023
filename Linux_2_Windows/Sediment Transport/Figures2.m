% Historical
clc; clear all; close all;


load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_2.mat')


%% Create holders for Trend and significance of LST
T_Q_hist_a=[]; S_Q_hist_a=[]; 
T_Q_hist_w=[]; S_Q_hist_w=[]; 
T_Q_hist_s=[]; S_Q_hist_s=[]; 

T_Q_Mid_4p5_a=[]; S_Q_Mid_4p5_a=[]; 
T_Q_Mid_4p5_w=[]; S_Q_Mid_4p5_w=[];
T_Q_Mid_4p5_s=[]; S_Q_Mid_4p5_s=[]; 

T_Q_Mid_8p5_a=[]; S_Q_Mid_8p5_a=[]; 
T_Q_Mid_8p5_w=[]; S_Q_Mid_8p5_w=[];
T_Q_Mid_8p5_s=[]; S_Q_Mid_8p5_s=[];

T_Q_End_4p5_a=[]; S_Q_End_4p5_a=[]; 
T_Q_End_4p5_w=[]; S_Q_End_4p5_w=[];
T_Q_End_4p5_s=[]; S_Q_End_4p5_s=[]; 

T_Q_End_8p5_a=[]; S_Q_End_8p5_a=[]; 
T_Q_End_8p5_w=[]; S_Q_End_8p5_w=[];
T_Q_End_8p5_s=[]; S_Q_End_8p5_s=[]; 
%% Trend and significance of LST

for i=1:45 %length(hs_a)
%% Historical
z_Q_hist_a= Q_hist_a(:,i);
t_Q_hist_a=trend(z_Q_hist_a); %tr=tr*365.25;
s_Q_hist_a= mann_kendall(z_Q_hist_a);
T_Q_hist_a=[T_Q_hist_a t_Q_hist_a];
S_Q_hist_a=[S_Q_hist_a s_Q_hist_a];


z_Q_hist_s= Q_hist_s(:,i);
t_Q_hist_s=trend(z_Q_hist_s); %tr=tr*365.25;
s_Q_hist_s= mann_kendall(z_Q_hist_s);
T_Q_hist_s=[T_Q_hist_s t_Q_hist_s];
S_Q_hist_s=[S_Q_hist_s s_Q_hist_s];


z_Q_hist_w= Q_hist_w(:,i);
t_Q_hist_w=trend(z_Q_hist_w); %tr=tr*365.25;
s_Q_hist_w= mann_kendall(z_Q_hist_w);
T_Q_hist_w=[T_Q_hist_w t_Q_hist_w];
S_Q_hist_w=[S_Q_hist_w s_Q_hist_w];

%% Mid 4.5
z_Q_Mid_4p5_a= Q_Mid_4p5_a(:,i);
t_Q_Mid_4p5_a=trend(z_Q_Mid_4p5_a); %tr=tr*365.25;
s_Q_Mid_4p5_a= mann_kendall(z_Q_Mid_4p5_a);
T_Q_Mid_4p5_a=[T_Q_Mid_4p5_a t_Q_Mid_4p5_a];
S_Q_Mid_4p5_a=[S_Q_Mid_4p5_a s_Q_Mid_4p5_a];


z_Q_Mid_4p5_s= Q_Mid_4p5_s(:,i);
t_Q_Mid_4p5_s=trend(z_Q_Mid_4p5_s); %tr=tr*365.25;
s_Q_Mid_4p5_s= mann_kendall(z_Q_Mid_4p5_s);
T_Q_Mid_4p5_s=[T_Q_Mid_4p5_s t_Q_Mid_4p5_s];
S_Q_Mid_4p5_s=[S_Q_Mid_4p5_s s_Q_Mid_4p5_s];


z_Q_Mid_4p5_w= Q_Mid_4p5_w(:,i);
t_Q_Mid_4p5_w=trend(z_Q_Mid_4p5_w); %tr=tr*365.25;
s_Q_Mid_4p5_w= mann_kendall(z_Q_Mid_4p5_w);
T_Q_Mid_4p5_w=[T_Q_Mid_4p5_w t_Q_Mid_4p5_w];
S_Q_Mid_4p5_w=[S_Q_Mid_4p5_w s_Q_Mid_4p5_w];

%% Mid 8.5
z_Q_Mid_8p5_a= Q_Mid_8p5_a(:,i);
t_Q_Mid_8p5_a=trend(z_Q_Mid_8p5_a); %tr=tr*365.25;
s_Q_Mid_8p5_a= mann_kendall(z_Q_Mid_8p5_a);
T_Q_Mid_8p5_a=[T_Q_Mid_8p5_a t_Q_Mid_8p5_a];
S_Q_Mid_8p5_a=[S_Q_Mid_8p5_a s_Q_Mid_8p5_a];


z_Q_Mid_8p5_s= Q_Mid_8p5_s(:,i);
t_Q_Mid_8p5_s=trend(z_Q_Mid_8p5_s); %tr=tr*365.25;
s_Q_Mid_8p5_s= mann_kendall(z_Q_Mid_8p5_s);
T_Q_Mid_8p5_s=[T_Q_Mid_8p5_s t_Q_Mid_8p5_s];
S_Q_Mid_8p5_s=[S_Q_Mid_8p5_s s_Q_Mid_8p5_s];


z_Q_Mid_8p5_w= Q_Mid_8p5_w(:,i);
t_Q_Mid_8p5_w=trend(z_Q_Mid_8p5_w); %tr=tr*365.25;
s_Q_Mid_8p5_w= mann_kendall(z_Q_Mid_8p5_w);
T_Q_Mid_8p5_w=[T_Q_Mid_8p5_w t_Q_Mid_8p5_w];
S_Q_Mid_8p5_w=[S_Q_Mid_8p5_w s_Q_Mid_8p5_w];

%% End 4.5
z_Q_End_4p5_a= Q_End_4p5_a(:,i);
t_Q_End_4p5_a=trend(z_Q_End_4p5_a); %tr=tr*365.25;
s_Q_End_4p5_a= mann_kendall(z_Q_End_4p5_a);
T_Q_End_4p5_a=[T_Q_End_4p5_a t_Q_End_4p5_a];
S_Q_End_4p5_a=[S_Q_End_4p5_a s_Q_End_4p5_a];


z_Q_End_4p5_s= Q_End_4p5_s(:,i);
t_Q_End_4p5_s=trend(z_Q_End_4p5_s); %tr=tr*365.25;
s_Q_End_4p5_s= mann_kendall(z_Q_End_4p5_s);
T_Q_End_4p5_s=[T_Q_End_4p5_s t_Q_End_4p5_s];
S_Q_End_4p5_s=[S_Q_End_4p5_s s_Q_End_4p5_s];


z_Q_End_4p5_w= Q_End_4p5_w(:,i);
t_Q_End_4p5_w=trend(z_Q_End_4p5_w); %tr=tr*365.25;
s_Q_End_4p5_w= mann_kendall(z_Q_End_4p5_w);
T_Q_End_4p5_w=[T_Q_End_4p5_w t_Q_End_4p5_w];
S_Q_End_4p5_w=[S_Q_End_4p5_w s_Q_End_4p5_w];

%% End 8.5
z_Q_End_8p5_a= Q_End_8p5_a(:,i);
t_Q_End_8p5_a=trend(z_Q_End_8p5_a); %tr=tr*365.25;
s_Q_End_8p5_a= mann_kendall(z_Q_End_8p5_a);
T_Q_End_8p5_a=[T_Q_End_8p5_a t_Q_End_8p5_a];
S_Q_End_8p5_a=[S_Q_End_8p5_a s_Q_End_8p5_a];


z_Q_End_8p5_s= Q_End_8p5_s(:,i);
t_Q_End_8p5_s=trend(z_Q_End_8p5_s); %tr=tr*365.25;
s_Q_End_8p5_s= mann_kendall(z_Q_End_8p5_s);
T_Q_End_8p5_s=[T_Q_End_8p5_s t_Q_End_8p5_s];
S_Q_End_8p5_s=[S_Q_End_8p5_s s_Q_End_8p5_s];


z_Q_End_8p5_w= Q_End_8p5_w(:,i);
t_Q_End_8p5_w=trend(z_Q_End_8p5_w); %tr=tr*365.25;
s_Q_End_8p5_w= mann_kendall(z_Q_End_8p5_w);
T_Q_End_8p5_w=[T_Q_End_8p5_w t_Q_End_8p5_w];
S_Q_End_8p5_w=[S_Q_End_8p5_w s_Q_End_8p5_w];


end

%% Generate labels
% Points label
points=["P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "P14",...
    "P15", "P16", "P17", "P18", "P19", "P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27", "P28"...
    "P29", "P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37", "P38", "P39", "P40", "P41", "P42"...
    "P43", "P44", "P45"];
P=points(1:3:45);


%% Spatial line graph historical
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the line graph of all seasons
% Historical
%hist
plot(nanmean(Q_hist_a,1),'o-r','linewi',1.5); hold on 
plot(nanmean(Q_hist_s,1),'>-b','linewi',1.5);hold on
plot(nanmean(Q_hist_w,1),'x-c','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Annual','Summer','Winter','Location','north','NumColumns',3,'FontWeight','Bold');
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Temporal Timeseries historical
P=1979:2:2005;
plot(nanmean(Q_hist_a,2),'o-r','linewi',1.5); hold on 
plot(nanmean(Q_hist_s,2),'>-b','linewi',1.5);hold on
plot(nanmean(Q_hist_w,2),'x-c','linewi',1.5);hold on
%plot(end8p5_a,'<-k','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:27)
ax = gca; ax.FontSize = 12; ax.FontWeight='bold';  
xlim([1 27])
legend('Annual','Summer','Winter','Location','south','NumColumns',3,'FontWeight','Bold');
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% Spatial line graph Mid Centrury 4.5
plot(nanmean(Q_Mid_4p5_a,1),'+-r','linewi',1.5); hold on 
plot(nanmean(Q_Mid_4p5_s,1),'>-b','linewi',1.5);hold on
plot(nanmean(Q_Mid_4p5_w,1),'x-c','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('4.5 Annual','4.5 Summer','4.5 Winter',...
    'Location','north','NumColumns',3,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Spatial line graph Mid Centrury 8.5
plot(nanmean(Q_Mid_8p5_a,1),'*-k','linewi',1.5); hold on 
plot(nanmean(Q_Mid_8p5_s,1),'p-m','linewi',1.5);hold on
plot(nanmean(Q_Mid_8p5_w,1),'s-g','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('8.5 Annual','8.5 Summer','8.5 Winter',...
    'Location','south','NumColumns',3,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% Spatial line graph End Centrury 4.5
plot(nanmean(Q_End_4p5_a,1),'+-r','linewi',1.5); hold on 
plot(nanmean(Q_End_4p5_s,1),'>-b','linewi',1.5);hold on
plot(nanmean(Q_End_4p5_w,1),'x-c','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('4.5 Annual','4.5 Summer','4.5 Winter',...
    'Location','south','NumColumns',3,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Spatial line graph End Centrury 8.5
plot(nanmean(Q_End_8p5_a,1),'*-k','linewi',1.5); hold on 
plot(nanmean(Q_End_8p5_s,1),'p-m','linewi',1.5);hold on
plot(nanmean(Q_End_8p5_w,1),'s-g','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('8.5 Annual','8.5 Summer','8.5 Winter',...
    'Location','south','NumColumns',3,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% LST Trend plots
% Plot the line graph of all seasons
% Annual
plot(T_Q_hist_a,'o-r','linewi',1.5); hold on 
plot(T_Q_Mid_4p5_a,'>-b','linewi',1.5);hold on
plot(T_Q_Mid_8p5_a,'x-c','linewi',1.5);hold on
plot(T_Q_End_4p5_a,'*-k','linewi',1.5); hold on 
plot(T_Q_End_8p5_a,'p-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',3,'FontWeight','Bold');
title('Annual LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Trend (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%%
% Winter
plot(T_Q_hist_w,'o-r','linewi',1.5); hold on 
plot(T_Q_Mid_4p5_w,'>-b','linewi',1.5);hold on
plot(T_Q_Mid_8p5_w,'x-c','linewi',1.5);hold on
plot(T_Q_End_4p5_w,'*-k','linewi',1.5); hold on 
plot(T_Q_End_8p5_w,'p-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',3,'FontWeight','Bold');
title('Winter LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Trend (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
% Summer
plot(T_Q_hist_s,'o-r','linewi',1.5); hold on 
plot(T_Q_Mid_4p5_s,'>-b','linewi',1.5);hold on
plot(T_Q_Mid_8p5_s,'x-c','linewi',1.5);hold on
plot(T_Q_End_4p5_s,'*-k','linewi',1.5); hold on 
plot(T_Q_End_8p5_s,'p-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',3,'FontWeight','Bold');
title('Summer LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Trend (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% LST Change plots
% Plot the line graph of all seasons
% Annual
plot(abs(nanmean(Q_Mid_4p5_a,1))-abs(nanmean(Q_hist_a,1)),'>-b','linewi',1.5);hold on
plot(abs(nanmean(Q_Mid_8p5_a,1))-abs(nanmean(Q_hist_a,1)),'x-c','linewi',1.5);hold on
plot(abs(nanmean(Q_End_4p5_a,1))-abs(nanmean(Q_hist_a,1)),'*-k','linewi',1.5); hold on 
plot(abs(nanmean(Q_End_8p5_a,1))-abs(nanmean(Q_hist_a,1)),'p-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',3,'FontWeight','Bold');
title('Annual LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Change(m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
% Winter
plot(abs(nanmean(Q_Mid_4p5_w,1))-abs(nanmean(Q_hist_w,1)),'>-b','linewi',1.5);hold on
plot(abs(nanmean(Q_Mid_8p5_w,1))-abs(nanmean(Q_hist_w,1)),'x-c','linewi',1.5);hold on
plot(abs(nanmean(Q_End_4p5_w,1))-abs(nanmean(Q_hist_w,1)),'*-k','linewi',1.5); hold on 
plot(abs(nanmean(Q_End_8p5_w,1))-abs(nanmean(Q_hist_w,1)),'p-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',3,'FontWeight','Bold');
title('Winter LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Change(m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
% Summer
plot(abs(nanmean(Q_Mid_4p5_s,1))-abs(nanmean(Q_hist_s,1)),'>-b','linewi',1.5);hold on
plot(abs(nanmean(Q_Mid_8p5_s,1))-abs(nanmean(Q_hist_s,1)),'x-c','linewi',1.5);hold on
plot(abs(nanmean(Q_End_4p5_s,1))-abs(nanmean(Q_hist_s,1)),'*-k','linewi',1.5); hold on 
plot(abs(nanmean(Q_End_8p5_s,1))-abs(nanmean(Q_hist_s,1)),'p-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',3,'FontWeight','Bold');
title('Summer LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Change(m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Calculate the direction of the coastline
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat')

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
clearvars -EXCEPT angg lon_f lat_f
%% Calculate the eastward and northward components of the transport
%aaa=nanmean(Q_hist_a,1);aaa=aaa*10^-5;
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction.mat')

U = sind(angg);
V = cosd(angg);

% U1 = (U.*aaa)/abs(aaa);
% V1 = (V.*aaa)/abs(aaa);

% U = sind(abcc_a(:,1));
% V = cosd(abcc_a(:,1));

%% Generate locations to plot the arrows
for i=1:45
    if i==1 | i<=8
        lon_f1(i)=lon_f(i)-0.5; lat_f1(i)=lat_f(i);
    elseif i==9 | i<=11
        lon_f1(i)=lon_f(i)-0.1; lat_f1(i)=lat_f(i)-0.4;
    elseif i==12
        lon_f1(i)=lon_f(i)+0.25; lat_f1(i)=lat_f(i)-0.65;
    elseif i==23
        lon_f1(i)=lon_f(i)+0.15; lat_f1(i)=lat_f(i)-0.5;
    elseif i==38
        lon_f1(i)=lon_f(i)+0.25; lat_f1(i)=lat_f(i)-0.5;
    elseif lon_f(i)<=0 & lat_f(i)>=0
        lon_f1(i)=lon_f(i); lat_f1(i)=lat_f(i)-0.5;
    elseif lon_f(i)>=0 & lat_f(i)>=0 | lon_f(i)<=5 | lat_f(i)>=0
        lon_f1(i)=lon_f(i); lat_f1(i)=lat_f(i)-0.5;
    else
        lon_f1(i)=lon_f(i); lat_f1(i)=lat_f(i);
    end
end


%% Load Sediment transport data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_1.mat')
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\arrow_points.mat')


%% Orientation of the coastline
% Plot hs map of Annual
%lon_f1=lon_f-0.3; lat_f1=lat_f-0.5;
% cmin=-0.005; cmax=0.005; int=0.0005; n= round((cmax-cmin)/int);
cmin=0; cmax=360; int=10; n= round((cmax-cmin)/int);
figure
z=angg;
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z10,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
m_scatter(lon_f,lat_f,70,z,'filled'); %shading flat;
%m_quiver(lon_f1,lat_f1,U,V,.09,'linewidth',4, 'color',[0.5 0.6 0.7]); 
m_vec(15,lon_f1,lat_f1,U,V,'m','headlength',3,'headangle',50);
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',1.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))
%m_text(lon_f1,lat_f1,points,'Rotation', 75,'color','k','fontw','bold','FontSize',9)


m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
% m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
%m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
%m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
% m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
% m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
% m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

% m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
% m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
%m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
% m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'C\^ote d''Ivoire','interpreter','latex','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',90,'color','k','fontw','bold')
% m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
% m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
%m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
% m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 
%m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
%m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
%m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 
m_text(0,2.5,'Gulf of Guinea','FontSize',10,'Rotation', 0,'color','b','fontw','bold') 
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
cb=colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Coastline Orientation (^oN)');
%title('Annaual average of Longshore Sediment Transport between 1979-2004 in the GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%title('Annaual LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot annual LST average

% Historical
% Plot hs map of Annual
%lon_f1=lon_f-0.3; lat_f1=lat_f-0.5;
% cmin=-0.005; cmax=0.005; int=0.0005; n= round((cmax-cmin)/int);
cmin=-7*10^5; cmax=7*10^5; int=0.5*10^5; n= round((cmax-cmin)/int);
figure
z=nanmean(Q_hist_a,1);
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z10,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_scatter(lon_f,lat_f,70,z,'filled'); %shading flat;
m_vec(15,lon_f1,lat_f1,U,V,z,'headlength',3,'headangle',50);
%m_quiver(lon_f1,lat_f1,U,V,.09,'linewidth',4, 'color',[0.5 0.6 0.7]); 
%m_vec(15,lon_f1,lat_f1,U,V,'m','headlength',3,'headangle',50);
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',1.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))
%m_text(lon_f1,lat_f1,points,'Rotation', 75,'color','k','fontw','bold','FontSize',9)


m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
% m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
%m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
%m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
% m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
% m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
% m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

% m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
% m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
%m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
% m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'C\^ote d''Ivoire','interpreter','latex','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',90,'color','k','fontw','bold')
% m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
% m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
%m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
% m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 
%m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
%m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
%m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 
m_text(0,2.5,'Gulf of Guinea','FontSize',10,'Rotation', 0,'color','b','fontw','bold') 
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
cb=colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%title('Annaual average of Longshore Sediment Transport between 1979-2004 in the GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
title('Annaual LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot map of Winter
z=nanmean(Q_hist_w,1);
%subplot(222)
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z10,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(lon_f,lat_f,70,z,'filled'); %shading flat;
%m_quiver(lon_f1,lat_f1,U,V,.09,'linewidth',4, 'color',[0.5 0.6 0.7]); 
m_vec(15,lon_f1,lat_f1,U,V,'m','headlength',3,'headangle',50);
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',1.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))
%m_text(lon_f1,lat_f1,points,'Rotation', 75,'color','k','fontw','bold','FontSize',9)


m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
% m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
%m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
%m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
% m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
% m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
% m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

% m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
% m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
%m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
% m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'C\^ote d''Ivoire','interpreter','latex','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',90,'color','k','fontw','bold')
% m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
% m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
%m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
% m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 
%m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
%m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
%m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 
m_text(0,2.5,'Gulf of Guinea','FontSize',10,'Rotation', 0,'color','b','fontw','bold') 
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
% set(get(cb,'label'),'string','Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
title('Winter LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot map of summer
z=nanmean(Q_hist_s,1);
%subplot(222)
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z10,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(lon_f,lat_f,70,z,'filled'); %shading flat;
%m_quiver(lon_f1,lat_f1,U,V,.09,'linewidth',4, 'color',[0.5 0.6 0.7]); 
m_vec(15,lon_f1,lat_f1,U,V,'m','headlength',3,'headangle',50);
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',1.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))
%m_text(lon_f1,lat_f1,points,'Rotation', 75,'color','k','fontw','bold','FontSize',9)


m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
% m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
%m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
%m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
% m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
% m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
% m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

% m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
% m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
%m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
% m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'C\^ote d''Ivoire','interpreter','latex','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',90,'color','k','fontw','bold')
% m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
% m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
%m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
% m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 
%m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
%m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
%m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 
m_text(0,2.5,'Gulf of Guinea','FontSize',10,'Rotation', 0,'color','b','fontw','bold') 
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
% set(get(cb,'label'),'string','Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
title('Summer LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

