%% HS
clc; clear

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

hs_a_hist=nanmean(hs_of_hist_a,2); 
hs_w_hist=nanmean(hs_of_hist_w,2); 
hs_s_hist=nanmean(hs_of_hist_s,2);
% hs_a_hist=hs_of_hist_a(:); 
% hs_w_hist=hs_of_hist_w(:); 
% hs_s_hist=hs_of_hist_s(:);

hs_a_m4p5=nanmean(hs_of_m4p5_a,2); 
hs_w_m4p5=nanmean(hs_of_m4p5_w,2); 
hs_s_m4p5=nanmean(hs_of_m4p5_s,2);
% hs_a_m4p5=hs_of_m4p5_a(:); 
% hs_w_m4p5=hs_of_m4p5_w(:); 
% hs_s_m4p5=hs_of_m4p5_s(:);

hs_a_m8p5=nanmean(hs_of_m8p5_a,2); 
hs_w_m8p5=nanmean(hs_of_m8p5_w,2); 
hs_s_m8p5=nanmean(hs_of_m8p5_s,2);
% hs_a_m8p5=hs_of_m8p5_a(:); 
% hs_w_m8p5=hs_of_m8p5_w(:); 
% hs_s_m8p5=hs_of_m8p5_s(:);

hs_a_e4p5=nanmean(hs_of_e4p5_a,2); 
hs_w_e4p5=nanmean(hs_of_e4p5_w,2); 
hs_s_e4p5=nanmean(hs_of_e4p5_s,2);
% hs_a_e4p5=hs_of_e4p5_a(:); 
% hs_w_e4p5=hs_of_e4p5_w(:); 
% hs_s_e4p5=hs_of_e4p5_s(:);


hs_a_e8p5=nanmean(hs_of_e8p5_a,2); 
hs_w_e8p5=nanmean(hs_of_e8p5_w,2); 
hs_s_e8p5=nanmean(hs_of_e8p5_s,2);
% hs_a_e8p5=hs_of_e8p5_a(:); 
% hs_w_e8p5=hs_of_e8p5_w(:); 
% hs_s_e8p5=hs_of_e8p5_s(:);

%%
%HS_a=[hs_a_hist hs_a_m4p5 hs_a_m8p5 hs_a_e4p5 hs_a_e8p5];
HS_a=[hs_a_hist hs_a_m4p5 hs_a_m8p5 hs_a_e4p5 hs_a_e8p5];
HS_w=[hs_w_hist hs_w_m4p5 hs_w_m8p5 hs_w_e4p5 hs_w_e8p5];
HS_s=[hs_s_hist hs_s_m4p5 hs_s_m8p5 hs_s_e4p5 hs_s_e8p5];

%%
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


%%
%% tm
clc; clear

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

tm_a_hist=nanmean(tm_of_hist_a,2); 
tm_w_hist=nanmean(tm_of_hist_w,2); 
tm_s_hist=nanmean(tm_of_hist_s,2);
% tm_a_hist=tm_of_hist_a(:); 
% tm_w_hist=tm_of_hist_w(:); 
% tm_s_hist=tm_of_hist_s(:);

tm_a_m4p5=nanmean(tm_of_m4p5_a,2); 
tm_w_m4p5=nanmean(tm_of_m4p5_w,2); 
tm_s_m4p5=nanmean(tm_of_m4p5_s,2);
% tm_a_m4p5=tm_of_m4p5_a(:); 
% tm_w_m4p5=tm_of_m4p5_w(:); 
% tm_s_m4p5=tm_of_m4p5_s(:);

tm_a_m8p5=nanmean(tm_of_m8p5_a,2); 
tm_w_m8p5=nanmean(tm_of_m8p5_w,2); 
tm_s_m8p5=nanmean(tm_of_m8p5_s,2);
% tm_a_m8p5=tm_of_m8p5_a(:); 
% tm_w_m8p5=tm_of_m8p5_w(:); 
% tm_s_m8p5=tm_of_m8p5_s(:);

tm_a_e4p5=nanmean(tm_of_e4p5_a,2); 
tm_w_e4p5=nanmean(tm_of_e4p5_w,2); 
tm_s_e4p5=nanmean(tm_of_e4p5_s,2);
% tm_a_e4p5=tm_of_e4p5_a(:); 
% tm_w_e4p5=tm_of_e4p5_w(:); 
% tm_s_e4p5=tm_of_e4p5_s(:);


tm_a_e8p5=nanmean(tm_of_e8p5_a,2); 
tm_w_e8p5=nanmean(tm_of_e8p5_w,2); 
tm_s_e8p5=nanmean(tm_of_e8p5_s,2);
% tm_a_e8p5=tm_of_e8p5_a(:); 
% tm_w_e8p5=tm_of_e8p5_w(:); 
% tm_s_e8p5=tm_of_e8p5_s(:);

%%
%tm_a=[tm_a_hist tm_a_m4p5 tm_a_m8p5 tm_a_e4p5 tm_a_e8p5];
tm_a=[tm_a_hist tm_a_m4p5 tm_a_m8p5 tm_a_e4p5 tm_a_e8p5];
tm_w=[tm_w_hist tm_w_m4p5 tm_w_m8p5 tm_w_e4p5 tm_w_e8p5];
tm_s=[tm_s_hist tm_s_m4p5 tm_s_m8p5 tm_s_e4p5 tm_s_e8p5];

%%
[p,tbl,stats] = anova1(tm_a);
tm_a=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(tm_w);
tm_w=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(tm_s);
tm_s=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);


%%
%% dm
clc; clear

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

dm_a_hist=nanmean(dm_of_hist_a,2); 
dm_w_hist=nanmean(dm_of_hist_w,2); 
dm_s_hist=nanmean(dm_of_hist_s,2);
% dm_a_hist=dm_of_hist_a(:); 
% dm_w_hist=dm_of_hist_w(:); 
% dm_s_hist=dm_of_hist_s(:);

dm_a_m4p5=nanmean(dm_of_m4p5_a,2); 
dm_w_m4p5=nanmean(dm_of_m4p5_w,2); 
dm_s_m4p5=nanmean(dm_of_m4p5_s,2);
% dm_a_m4p5=dm_of_m4p5_a(:); 
% dm_w_m4p5=dm_of_m4p5_w(:); 
% dm_s_m4p5=dm_of_m4p5_s(:);

dm_a_m8p5=nanmean(dm_of_m8p5_a,2); 
dm_w_m8p5=nanmean(dm_of_m8p5_w,2); 
dm_s_m8p5=nanmean(dm_of_m8p5_s,2);
% dm_a_m8p5=dm_of_m8p5_a(:); 
% dm_w_m8p5=dm_of_m8p5_w(:); 
% dm_s_m8p5=dm_of_m8p5_s(:);

dm_a_e4p5=nanmean(dm_of_e4p5_a,2); 
dm_w_e4p5=nanmean(dm_of_e4p5_w,2); 
dm_s_e4p5=nanmean(dm_of_e4p5_s,2);
% dm_a_e4p5=dm_of_e4p5_a(:); 
% dm_w_e4p5=dm_of_e4p5_w(:); 
% dm_s_e4p5=dm_of_e4p5_s(:);


dm_a_e8p5=nanmean(dm_of_e8p5_a,2); 
dm_w_e8p5=nanmean(dm_of_e8p5_w,2); 
dm_s_e8p5=nanmean(dm_of_e8p5_s,2);
% dm_a_e8p5=dm_of_e8p5_a(:); 
% dm_w_e8p5=dm_of_e8p5_w(:); 
% dm_s_e8p5=dm_of_e8p5_s(:);

%%
%dm_a=[dm_a_hist dm_a_m4p5 dm_a_m8p5 dm_a_e4p5 dm_a_e8p5];
dm_a=[dm_a_hist dm_a_m4p5 dm_a_m8p5 dm_a_e4p5 dm_a_e8p5];
dm_w=[dm_w_hist dm_w_m4p5 dm_w_m8p5 dm_w_e4p5 dm_w_e8p5];
dm_s=[dm_s_hist dm_s_m4p5 dm_s_m8p5 dm_s_e4p5 dm_s_e8p5];

%%
[p,tbl,stats] = anova1(dm_a);
dm_a=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(dm_w);
dm_w=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

[p,tbl,stats] = anova1(dm_s);
dm_s=[tbl{2,5} tbl{2,6}]
results = multcompare(stats);

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