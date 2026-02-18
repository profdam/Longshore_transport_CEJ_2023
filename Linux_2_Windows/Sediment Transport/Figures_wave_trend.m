% Historical
%Load selected ensemble data: hist
clc;clear;
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')

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
plot(nanmean(hs_a,2),'o-r','linewi',1.5); hold on 
plot(nanmean(hs_s,2),'>-b','linewi',1.5);hold on
plot(nanmean(hs_w,2),'x-c','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Annual','Summer','Winter','Location','north','NumColumns',2,'FontWeight','Bold');
title('Hs for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Temporal Timeseries historical
T=1979:2:2005;
plot(nanmean(hs_a,2),'o-r','linewi',1.5); hold on 
plot(nanmean(hs_s,2),'>-b','linewi',1.5);hold on
plot(nanmean(hs_w,2),'x-c','linewi',1.5);hold on
%plot(end8p5_a,'<-k','linewi',1.5);hold on
set(gca,'xticklabel',T.','FontWeight','Bold');
xticks(1:2:27)
ax = gca; ax.FontSize = 12; ax.FontWeight='bold';  
xlim([1 27])
legend('Annual','Summer','Winter','Location','south','NumColumns',2,'FontWeight','Bold');
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% Spatial line graph Mid Centrury 4.5
plot(nanmean(Q_Mid_4p5_a,2),'+-r','linewi',1.5); hold on 
plot(nanmean(Q_Mid_4p5_s,2),'>-b','linewi',1.5);hold on
plot(nanmean(Q_Mid_4p5_w,2),'x-c','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('4.5 Annual','4.5 Summer','4.5 Winter',...
    'Location','north','NumColumns',2,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Spatial line graph Mid Centrury 8.5
plot(nanmean(Q_Mid_8p5_a,2),'*-k','linewi',1.5); hold on 
plot(nanmean(Q_Mid_8p5_s,2),'p-m','linewi',1.5);hold on
plot(nanmean(Q_Mid_8p5_w,2),'s-g','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('8.5 Annual','8.5 Summer','8.5 Winter',...
    'Location','south','NumColumns',2,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% Spatial line graph End Centrury 4.5
plot(nanmean(Q_End_4p5_a,2),'+-r','linewi',1.5); hold on 
plot(nanmean(Q_End_4p5_s,2),'>-b','linewi',1.5);hold on
plot(nanmean(Q_End_4p5_w,2),'x-c','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('4.5 Annual','4.5 Summer','4.5 Winter',...
    'Location','south','NumColumns',2,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Spatial line graph End Centrury 8.5
plot(nanmean(Q_End_8p5_a,2),'*-k','linewi',1.5); hold on 
plot(nanmean(Q_End_8p5_s,2),'p-m','linewi',1.5);hold on
plot(nanmean(Q_End_8p5_w,2),'s-g','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('8.5 Annual','8.5 Summer','8.5 Winter',...
    'Location','south','NumColumns',2,'FontWeight','Bold');
% h = get(gca,'Children');
% set(gca,'Children',[h(1) h(2) h(3) h(4) h(5) h(6)])
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
