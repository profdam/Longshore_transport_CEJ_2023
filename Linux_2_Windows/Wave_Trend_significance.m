% Historical
clc; clear all; close all;

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

clearvars -EXCEPT dm_of_hist_a tm_of_hist_a hs_of_hist_a...
    dm_of_hist_w tm_of_hist_w hs_of_hist_w...
    dm_of_hist_s tm_of_hist_s hs_of_hist_s

%% Trend and significance
T_hs_of_hist_a=[]; S_hs_of_hist_a=[]; T_tm_of_hist_a=[]; S_tm_of_hist_a=[]; T_dm_of_hist_a=[]; S_dm_of_hist_a=[];
T_hs_of_hist_w=[]; S_hs_of_hist_w=[]; T_tm_of_hist_w=[]; S_tm_of_hist_w=[]; T_dm_of_hist_w=[]; S_dm_of_hist_w=[];
T_hs_of_hist_s=[]; S_hs_of_hist_s=[]; T_tm_of_hist_s=[]; S_tm_of_hist_s=[]; T_dm_of_hist_s=[]; S_dm_of_hist_s=[];


for i=1:length(hs_of_hist_a)
z_hs_of_hist_a = hs_of_hist_a(i,:);
t_hs_of_hist_a=trend(z_hs_of_hist_a); %tr=tr*365.25;
s_hs_of_hist_a= mann_kendall(z_hs_of_hist_a);
T_hs_of_hist_a=[T_hs_of_hist_a t_hs_of_hist_a];
S_hs_of_hist_a=[S_hs_of_hist_a s_hs_of_hist_a];


z_tm_of_hist_a = tm_of_hist_a(i,:);
t_tm_of_hist_a=trend(z_tm_of_hist_a); %tr=tr*365.25;
s_tm_of_hist_a= mann_kendall(z_tm_of_hist_a);
T_tm_of_hist_a=[T_tm_of_hist_a t_tm_of_hist_a];
S_tm_of_hist_a=[S_tm_of_hist_a s_tm_of_hist_a];


z_dm_of_hist_a = dm_of_hist_a(i,:);
t_dm_of_hist_a=trend(z_dm_of_hist_a); %tr=tr*365.25;
s_dm_of_hist_a= mann_kendall(z_dm_of_hist_a);
T_dm_of_hist_a=[T_dm_of_hist_a t_dm_of_hist_a];
S_dm_of_hist_a=[S_dm_of_hist_a s_dm_of_hist_a];

%%
z_hs_of_hist_w = hs_of_hist_w(i,:);
t_hs_of_hist_w=trend(z_hs_of_hist_w); %tr=tr*365.25;
s_hs_of_hist_w= mann_kendall(z_hs_of_hist_w);
T_hs_of_hist_w=[T_hs_of_hist_w t_hs_of_hist_w];
S_hs_of_hist_w=[S_hs_of_hist_w s_hs_of_hist_w];


z_tm_of_hist_w = tm_of_hist_w(i,:);
t_tm_of_hist_w=trend(z_tm_of_hist_w); %tr=tr*365.25;
s_tm_of_hist_w= mann_kendall(z_tm_of_hist_w);
T_tm_of_hist_w=[T_tm_of_hist_w t_tm_of_hist_w];
S_tm_of_hist_w=[S_tm_of_hist_w s_tm_of_hist_w];


z_dm_of_hist_w = dm_of_hist_w(i,:);
t_dm_of_hist_w=trend(z_dm_of_hist_w); %tr=tr*365.25;
s_dm_of_hist_w= mann_kendall(z_dm_of_hist_w);
T_dm_of_hist_w=[T_dm_of_hist_w t_dm_of_hist_w];
S_dm_of_hist_w=[S_dm_of_hist_w s_dm_of_hist_w];


%%
z_hs_of_hist_s = hs_of_hist_s(i,:);
t_hs_of_hist_s=trend(z_hs_of_hist_s); %tr=tr*365.25;
s_hs_of_hist_s= mann_kendall(z_hs_of_hist_s);
T_hs_of_hist_s=[T_hs_of_hist_s t_hs_of_hist_s];
S_hs_of_hist_s=[S_hs_of_hist_s s_hs_of_hist_s];


z_tm_of_hist_s = tm_of_hist_s(i,:);
t_tm_of_hist_s=trend(z_tm_of_hist_s); %tr=tr*365.25;
s_tm_of_hist_s= mann_kendall(z_tm_of_hist_s);
T_tm_of_hist_s=[T_tm_of_hist_s t_tm_of_hist_s];
S_tm_of_hist_s=[S_tm_of_hist_s s_tm_of_hist_s];


z_dm_of_hist_s = dm_of_hist_s(i,:);
t_dm_of_hist_s=trend(z_dm_of_hist_s); %tr=tr*365.25;
s_dm_of_hist_s= mann_kendall(z_dm_of_hist_s);
T_dm_of_hist_s=[T_dm_of_hist_s t_dm_of_hist_s];
S_dm_of_hist_s=[S_dm_of_hist_s s_dm_of_hist_s];


end


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Historical
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Points label
points=["P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "P14",...
    "P15", "P16", "P17", "P18", "P19", "P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27", "P28"...
    "P29", "P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37", "P38", "P39", "P40", "P41", "P42"...
    "P43", "P44", "P45"];
P=points(1:2:45);
P1=1:45;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the line graph of all seasons
% Hs Average and trend

set(groot,'defaultAxesTickLabelInterpreter','latex');  
yyaxis left;
plot(nanmean(hs_of_hist_a,2),'-c','linewi',1.0); hold on 
plot(nanmean(hs_of_hist_s,2),'-b','linewi',1.0);hold on
plot(nanmean(hs_of_hist_w,2),'-m','linewi',1.0);hold on
ylabel('Hs Average (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([0.2 1.8])

yyaxis right;
plot(T_hs_of_hist_a,'o-r','linewi',1.0); hold on 
plot(T_hs_of_hist_s,'o-g','linewi',1.0);hold on
plot(T_hs_of_hist_w,'o-y','linewi',1.0);hold on
for i=1:45
if S_hs_of_hist_a(i)==1
       plot(P1(i),T_hs_of_hist_a(i),'*k','linewi',1.0); hold on
end
if S_hs_of_hist_w(i)==1
        plot(P1(i),T_hs_of_hist_w(i),'*k','linewi',1.0); hold on
end
if S_hs_of_hist_s(i)==1
        plot(P1(i),T_hs_of_hist_s(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
ylim([-2*10^-3 7*10^-3])

legend('Annual-Ave','Rainy-Ave','Dry-Ave','Annual-Trend','Rainy-Trend','Dry-Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Hs Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs Trend (m y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tm Average and trendset(groot,'defaultAxesTickLabelInterpreter','latex');  
yyaxis left;
plot(nanmean(tm_of_hist_a,2),'-c','linewi',1.0); hold on 
plot(nanmean(tm_of_hist_s,2),'-b','linewi',1.0);hold on
plot(nanmean(tm_of_hist_w,2),'-m','linewi',1.0);hold on
ylabel('Tm Average (s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([8 11.5])

yyaxis right;
plot(T_tm_of_hist_a,'o-r','linewi',1.0); hold on 
plot(T_tm_of_hist_s,'o-g','linewi',1.0);hold on
plot(T_tm_of_hist_w,'o-y','linewi',1.0);hold on
for i=1:45
if S_tm_of_hist_a(i)==1
       plot(P1(i),T_tm_of_hist_a(i),'*k','linewi',1.0); hold on
end
if S_tm_of_hist_w(i)==1
        plot(P1(i),T_tm_of_hist_w(i),'*k','linewi',1.0); hold on
end
if S_tm_of_hist_s(i)==1
        plot(P1(i),T_tm_of_hist_s(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
ylim([0*10^-2 2*10^-2])

legend('Annual-Ave','Rainy-Ave','Dry-Ave','Annual-Trend','Rainy-Trend','Dry-Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Tm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm Trend (s y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dm Average and trend
set(groot,'defaultAxesTickLabelInterpreter','latex');  
yyaxis left;
plot(nanmean(dm_of_hist_a,2),'-c','linewi',1.0); hold on 
plot(nanmean(dm_of_hist_s,2),'-b','linewi',1.0);hold on
plot(nanmean(dm_of_hist_w,2),'-m','linewi',1.0);hold on
ylabel('Dm Average (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%ylim([170 240])

yyaxis right;
plot(T_dm_of_hist_a,'o-r','linewi',1.0); hold on 
plot(T_dm_of_hist_s,'o-g','linewi',1.0);hold on
plot(T_dm_of_hist_w,'o-y','linewi',1.0);hold on
for i=1:45
if S_dm_of_hist_a(i)==1
       plot(P1(i),T_dm_of_hist_a(i),'*k','linewi',1.0); hold on
end
if S_dm_of_hist_w(i)==1
        plot(P1(i),T_dm_of_hist_w(i),'*k','linewi',1.0); hold on
end
if S_dm_of_hist_s(i)==1
        plot(P1(i),T_dm_of_hist_s(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
ylim([-4*10^-2 8*10^-2])

legend('Annual-Ave','Rainy-Ave','Dry-Ave','Annual-Trend','Rainy-Trend','Dry-Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Dm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm Trend (^o y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));
