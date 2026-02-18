%% HS
load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_hist.mat')

hs_a_hist=nanmean(hs_a,2); 
hs_w_hist=nanmean(hs_w,2); 
hs_s_hist=nanmean(hs_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_mid4p5.mat')
hs_a_m4p5=nanmean(hs_a,2); 
hs_w_m4p5=nanmean(hs_w,2); 
hs_s_m4p5=nanmean(hs_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_mid8p5.mat')
hs_a_m8p5=nanmean(hs_a,2); 
hs_w_m8p5=nanmean(hs_w,2); 
hs_s_m8p5=nanmean(hs_s,2);


load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_end4p5.mat')
hs_a_e4p5=nanmean(hs_a,2); 
hs_w_e4p5=nanmean(hs_w,2); 
hs_s_e4p5=nanmean(hs_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_end8p5.mat')
hs_a_e8p5=nanmean(hs_a,2); 
hs_w_e8p5=nanmean(hs_w,2); 
hs_s_e8p5=nanmean(hs_s,2);
%%
%HS_a=[hs_a_hist hs_a_m4p5 hs_a_m8p5 hs_a_e4p5 hs_a_e8p5];
HS_a=[hs_a_m4p5 hs_a_m8p5 hs_a_e4p5 hs_a_e8p5];
HS_w=[hs_w_m4p5 hs_w_m8p5 hs_w_e4p5 hs_w_e8p5];
HS_s=[hs_s_m4p5 hs_s_m8p5 hs_s_e4p5 hs_s_e8p5];

[p,tbl,stats] = anova1(HS_a);
Hs_a=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(HS_w);
Hs_w=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(HS_s);
Hs_s=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

aaa=[Hs_a;Hs_w;Hs_s];

%% Annual
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(HS_a, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Annual')
ylabel('RCP Scenarios')
xlabel('Hs (m)')
%% Winter
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(HS_w, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Winter')
ylabel('RCP Scenarios')
xlabel('Hs (m)')

%% Summer
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(HS_s, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Summer')
ylabel('RCP Scenarios')
xlabel('Hs (m)')

%%
plot(hs_a_hist); hold on
plot(hs_a_m4p5); hold on
plot(hs_a_m8p5); hold on
plot(hs_a_e4p5); hold on
plot(hs_a_e8p5); hold on


%% TM
load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_hist.mat')

tm_a_hist=nanmean(tm_a,2); 
tm_w_hist=nanmean(tm_w,2); 
tm_s_hist=nanmean(tm_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_mid4p5.mat')
tm_a_m4p5=nanmean(tm_a,2); 
tm_w_m4p5=nanmean(tm_w,2); 
tm_s_m4p5=nanmean(tm_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_mid8p5.mat')
tm_a_m8p5=nanmean(tm_a,2); 
tm_w_m8p5=nanmean(tm_w,2); 
tm_s_m8p5=nanmean(tm_s,2);


load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_end4p5.mat')
tm_a_e4p5=nanmean(tm_a,2); 
tm_w_e4p5=nanmean(tm_w,2); 
tm_s_e4p5=nanmean(tm_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_end8p5.mat')
tm_a_e8p5=nanmean(tm_a,2); 
tm_w_e8p5=nanmean(tm_w,2); 
tm_s_e8p5=nanmean(tm_s,2);

%%
% TM_a=[tm_a_hist tm_a_m4p5 tm_a_m8p5 tm_a_e4p5 tm_a_e8p5];
% [p,tbl,stats] = anova1(TM_a);
% results = multcompare(stats);
%%
%Tm_a=[Tm_a_hist Tm_a_m4p5 Tm_a_m8p5 Tm_a_e4p5 Tm_a_e8p5];
Tm_a=[tm_a_m4p5 tm_a_m8p5 tm_a_e4p5 tm_a_e8p5];
Tm_w=[tm_w_m4p5 tm_w_m8p5 tm_w_e4p5 tm_w_e8p5];
Tm_s=[tm_s_m4p5 tm_s_m8p5 tm_s_e4p5 tm_s_e8p5];


[p,tbl,stats] = anova1(Tm_a);
Tm_a=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(Tm_w);
Tm_w=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(Tm_s);
Tm_s=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

aaa=[Tm_a;Tm_w;Tm_s];


%% Annual
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Tm_a, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Annual')
ylabel('RCP Scenarios')
xlabel('Tm (s)')
%% Winter
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Tm_w, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Winter')
ylabel('RCP Scenarios')
xlabel('Tm (s)')

%% Summer
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Tm_s, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Summer')
ylabel('RCP Scenarios')
xlabel('Tm (s)')


%%
plot(tm_a_hist); hold on
plot(tm_a_m4p5); hold on
plot(tm_a_m8p5); hold on
plot(tm_a_e4p5); hold on
plot(tm_a_e8p5); hold on



%% DM
load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_hist.mat')

dm_a_hist=nanmean(dm_a,2); 
dm_w_hist=nanmean(dm_w,2); 
dm_s_hist=nanmean(dm_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_mid4p5.mat')
dm_a_m4p5=nanmean(dm_a,2); 
dm_w_m4p5=nanmean(dm_w,2); 
dm_s_m4p5=nanmean(dm_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_mid8p5.mat')
dm_a_m8p5=nanmean(dm_a,2); 
dm_w_m8p5=nanmean(dm_w,2); 
dm_s_m8p5=nanmean(dm_s,2);


load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_end4p5.mat')
dm_a_e4p5=nanmean(dm_a,2); 
dm_w_e4p5=nanmean(dm_w,2); 
dm_s_e4p5=nanmean(dm_s,2);

load('D:\Review Papers\Extreme Waves\Extreme\Select_points_all_timeseries_yearly_end8p5.mat')
dm_a_e8p5=nanmean(dm_a,2); 
dm_w_e8p5=nanmean(dm_w,2); 
dm_s_e8p5=nanmean(dm_s,2);

%%
% DM_a=[dm_a_hist dm_a_m4p5 dm_a_m8p5 dm_a_e4p5 dm_a_e8p5];
% [p,tbl,stats] = anova1(DM_a);
% results = multcompare(stats);
% %%
%Dm_a=[Dm_a_hist Dm_a_m4p5 Dm_a_m8p5 Dm_a_e4p5 Dm_a_e8p5];
Dm_a=[dm_a_m4p5 dm_a_m8p5 dm_a_e4p5 dm_a_e8p5];
Dm_w=[dm_w_m4p5 dm_w_m8p5 dm_w_e4p5 dm_w_e8p5];
Dm_s=[dm_s_m4p5 dm_s_m8p5 dm_s_e4p5 dm_s_e8p5];


[p,tbl,stats] = anova1(Dm_a);
Dm_a=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(Dm_w);
Dm_w=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(Dm_s);
Dm_s=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

aaa=[Dm_a;Dm_w;Dm_s];


%% Annual
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Dm_a, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Annual')
ylabel('RCP Scenarios')
xlabel('Dm (^o)')
%% Winter
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Dm_w, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Winter')
ylabel('RCP Scenarios')
xlabel('Dm (^o)')

%% Summer
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Dm_s, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:4)
%xlim([2 5]) 
title('Summer')
ylabel('RCP Scenarios')
xlabel('Dm (^o)')


%%
plot(dm_a_hist); hold on
plot(dm_a_m4p5); hold on
plot(dm_a_m8p5); hold on
plot(dm_a_e4p5); hold on
plot(dm_a_e8p5); hold on




