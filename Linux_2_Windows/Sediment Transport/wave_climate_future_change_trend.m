    
clc; clear

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

%% Trend and significance
T_hs_of_m4p5_a=[]; S_hs_of_m4p5_a=[]; T_tm_of_m4p5_a=[]; S_tm_of_m4p5_a=[]; T_dm_of_m4p5_a=[]; S_dm_of_m4p5_a=[];
T_hs_of_m4p5_w=[]; S_hs_of_m4p5_w=[]; T_tm_of_m4p5_w=[]; S_tm_of_m4p5_w=[]; T_dm_of_m4p5_w=[]; S_dm_of_m4p5_w=[];
T_hs_of_m4p5_s=[]; S_hs_of_m4p5_s=[]; T_tm_of_m4p5_s=[]; S_tm_of_m4p5_s=[]; T_dm_of_m4p5_s=[]; S_dm_of_m4p5_s=[];


for i=1:length(hs_of_m4p5_a)
z_hs_of_m4p5_a = hs_of_m4p5_a(i,:);
t_hs_of_m4p5_a=trend(z_hs_of_m4p5_a); %tr=tr*365.25;
s_hs_of_m4p5_a= mann_kendall(z_hs_of_m4p5_a);
T_hs_of_m4p5_a=[T_hs_of_m4p5_a t_hs_of_m4p5_a];
S_hs_of_m4p5_a=[S_hs_of_m4p5_a s_hs_of_m4p5_a];


z_tm_of_m4p5_a = tm_of_m4p5_a(i,:);
t_tm_of_m4p5_a=trend(z_tm_of_m4p5_a); %tr=tr*365.25;
s_tm_of_m4p5_a= mann_kendall(z_tm_of_m4p5_a);
T_tm_of_m4p5_a=[T_tm_of_m4p5_a t_tm_of_m4p5_a];
S_tm_of_m4p5_a=[S_tm_of_m4p5_a s_tm_of_m4p5_a];


z_dm_of_m4p5_a = dm_of_m4p5_a(i,:);
t_dm_of_m4p5_a=trend(z_dm_of_m4p5_a); %tr=tr*365.25;
s_dm_of_m4p5_a= mann_kendall(z_dm_of_m4p5_a);
T_dm_of_m4p5_a=[T_dm_of_m4p5_a t_dm_of_m4p5_a];
S_dm_of_m4p5_a=[S_dm_of_m4p5_a s_dm_of_m4p5_a];

%%
z_hs_of_m4p5_w = hs_of_m4p5_w(i,:);
t_hs_of_m4p5_w=trend(z_hs_of_m4p5_w); %tr=tr*365.25;
s_hs_of_m4p5_w= mann_kendall(z_hs_of_m4p5_w);
T_hs_of_m4p5_w=[T_hs_of_m4p5_w t_hs_of_m4p5_w];
S_hs_of_m4p5_w=[S_hs_of_m4p5_w s_hs_of_m4p5_w];


z_tm_of_m4p5_w = tm_of_m4p5_w(i,:);
t_tm_of_m4p5_w=trend(z_tm_of_m4p5_w); %tr=tr*365.25;
s_tm_of_m4p5_w= mann_kendall(z_tm_of_m4p5_w);
T_tm_of_m4p5_w=[T_tm_of_m4p5_w t_tm_of_m4p5_w];
S_tm_of_m4p5_w=[S_tm_of_m4p5_w s_tm_of_m4p5_w];


z_dm_of_m4p5_w = dm_of_m4p5_w(i,:);
t_dm_of_m4p5_w=trend(z_dm_of_m4p5_w); %tr=tr*365.25;
s_dm_of_m4p5_w= mann_kendall(z_dm_of_m4p5_w);
T_dm_of_m4p5_w=[T_dm_of_m4p5_w t_dm_of_m4p5_w];
S_dm_of_m4p5_w=[S_dm_of_m4p5_w s_dm_of_m4p5_w];


%%
z_hs_of_m4p5_s = hs_of_m4p5_s(i,:);
t_hs_of_m4p5_s=trend(z_hs_of_m4p5_s); %tr=tr*365.25;
s_hs_of_m4p5_s= mann_kendall(z_hs_of_m4p5_s);
T_hs_of_m4p5_s=[T_hs_of_m4p5_s t_hs_of_m4p5_s];
S_hs_of_m4p5_s=[S_hs_of_m4p5_s s_hs_of_m4p5_s];


z_tm_of_m4p5_s = tm_of_m4p5_s(i,:);
t_tm_of_m4p5_s=trend(z_tm_of_m4p5_s); %tr=tr*365.25;
s_tm_of_m4p5_s= mann_kendall(z_tm_of_m4p5_s);
T_tm_of_m4p5_s=[T_tm_of_m4p5_s t_tm_of_m4p5_s];
S_tm_of_m4p5_s=[S_tm_of_m4p5_s s_tm_of_m4p5_s];


z_dm_of_m4p5_s = dm_of_m4p5_s(i,:);
t_dm_of_m4p5_s=trend(z_dm_of_m4p5_s); %tr=tr*365.25;
s_dm_of_m4p5_s= mann_kendall(z_dm_of_m4p5_s);
T_dm_of_m4p5_s=[T_dm_of_m4p5_s t_dm_of_m4p5_s];
S_dm_of_m4p5_s=[S_dm_of_m4p5_s s_dm_of_m4p5_s];


end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Trend and significance
T_hs_of_m8p5_a=[]; S_hs_of_m8p5_a=[]; T_tm_of_m8p5_a=[]; S_tm_of_m8p5_a=[]; T_dm_of_m8p5_a=[]; S_dm_of_m8p5_a=[];
T_hs_of_m8p5_w=[]; S_hs_of_m8p5_w=[]; T_tm_of_m8p5_w=[]; S_tm_of_m8p5_w=[]; T_dm_of_m8p5_w=[]; S_dm_of_m8p5_w=[];
T_hs_of_m8p5_s=[]; S_hs_of_m8p5_s=[]; T_tm_of_m8p5_s=[]; S_tm_of_m8p5_s=[]; T_dm_of_m8p5_s=[]; S_dm_of_m8p5_s=[];


for i=1:length(hs_of_m8p5_a)
z_hs_of_m8p5_a = hs_of_m8p5_a(i,:);
t_hs_of_m8p5_a=trend(z_hs_of_m8p5_a); %tr=tr*365.25;
s_hs_of_m8p5_a= mann_kendall(z_hs_of_m8p5_a);
T_hs_of_m8p5_a=[T_hs_of_m8p5_a t_hs_of_m8p5_a];
S_hs_of_m8p5_a=[S_hs_of_m8p5_a s_hs_of_m8p5_a];


z_tm_of_m8p5_a = tm_of_m8p5_a(i,:);
t_tm_of_m8p5_a=trend(z_tm_of_m8p5_a); %tr=tr*365.25;
s_tm_of_m8p5_a= mann_kendall(z_tm_of_m8p5_a);
T_tm_of_m8p5_a=[T_tm_of_m8p5_a t_tm_of_m8p5_a];
S_tm_of_m8p5_a=[S_tm_of_m8p5_a s_tm_of_m8p5_a];


z_dm_of_m8p5_a = dm_of_m8p5_a(i,:);
t_dm_of_m8p5_a=trend(z_dm_of_m8p5_a); %tr=tr*365.25;
s_dm_of_m8p5_a= mann_kendall(z_dm_of_m8p5_a);
T_dm_of_m8p5_a=[T_dm_of_m8p5_a t_dm_of_m8p5_a];
S_dm_of_m8p5_a=[S_dm_of_m8p5_a s_dm_of_m8p5_a];

%%
z_hs_of_m8p5_w = hs_of_m8p5_w(i,:);
t_hs_of_m8p5_w=trend(z_hs_of_m8p5_w); %tr=tr*365.25;
s_hs_of_m8p5_w= mann_kendall(z_hs_of_m8p5_w);
T_hs_of_m8p5_w=[T_hs_of_m8p5_w t_hs_of_m8p5_w];
S_hs_of_m8p5_w=[S_hs_of_m8p5_w s_hs_of_m8p5_w];


z_tm_of_m8p5_w = tm_of_m8p5_w(i,:);
t_tm_of_m8p5_w=trend(z_tm_of_m8p5_w); %tr=tr*365.25;
s_tm_of_m8p5_w= mann_kendall(z_tm_of_m8p5_w);
T_tm_of_m8p5_w=[T_tm_of_m8p5_w t_tm_of_m8p5_w];
S_tm_of_m8p5_w=[S_tm_of_m8p5_w s_tm_of_m8p5_w];


z_dm_of_m8p5_w = dm_of_m8p5_w(i,:);
t_dm_of_m8p5_w=trend(z_dm_of_m8p5_w); %tr=tr*365.25;
s_dm_of_m8p5_w= mann_kendall(z_dm_of_m8p5_w);
T_dm_of_m8p5_w=[T_dm_of_m8p5_w t_dm_of_m8p5_w];
S_dm_of_m8p5_w=[S_dm_of_m8p5_w s_dm_of_m8p5_w];


%%
z_hs_of_m8p5_s = hs_of_m8p5_s(i,:);
t_hs_of_m8p5_s=trend(z_hs_of_m8p5_s); %tr=tr*365.25;
s_hs_of_m8p5_s= mann_kendall(z_hs_of_m8p5_s);
T_hs_of_m8p5_s=[T_hs_of_m8p5_s t_hs_of_m8p5_s];
S_hs_of_m8p5_s=[S_hs_of_m8p5_s s_hs_of_m8p5_s];


z_tm_of_m8p5_s = tm_of_m8p5_s(i,:);
t_tm_of_m8p5_s=trend(z_tm_of_m8p5_s); %tr=tr*365.25;
s_tm_of_m8p5_s= mann_kendall(z_tm_of_m8p5_s);
T_tm_of_m8p5_s=[T_tm_of_m8p5_s t_tm_of_m8p5_s];
S_tm_of_m8p5_s=[S_tm_of_m8p5_s s_tm_of_m8p5_s];


z_dm_of_m8p5_s = dm_of_m8p5_s(i,:);
t_dm_of_m8p5_s=trend(z_dm_of_m8p5_s); %tr=tr*365.25;
s_dm_of_m8p5_s= mann_kendall(z_dm_of_m8p5_s);
T_dm_of_m8p5_s=[T_dm_of_m8p5_s t_dm_of_m8p5_s];
S_dm_of_m8p5_s=[S_dm_of_m8p5_s s_dm_of_m8p5_s];


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Trend and significance
T_hs_of_e4p5_a=[]; S_hs_of_e4p5_a=[]; T_tm_of_e4p5_a=[]; S_tm_of_e4p5_a=[]; T_dm_of_e4p5_a=[]; S_dm_of_e4p5_a=[];
T_hs_of_e4p5_w=[]; S_hs_of_e4p5_w=[]; T_tm_of_e4p5_w=[]; S_tm_of_e4p5_w=[]; T_dm_of_e4p5_w=[]; S_dm_of_e4p5_w=[];
T_hs_of_e4p5_s=[]; S_hs_of_e4p5_s=[]; T_tm_of_e4p5_s=[]; S_tm_of_e4p5_s=[]; T_dm_of_e4p5_s=[]; S_dm_of_e4p5_s=[];


for i=1:length(hs_of_e4p5_a)
z_hs_of_e4p5_a = hs_of_e4p5_a(i,:);
t_hs_of_e4p5_a=trend(z_hs_of_e4p5_a); %tr=tr*365.25;
s_hs_of_e4p5_a= mann_kendall(z_hs_of_e4p5_a);
T_hs_of_e4p5_a=[T_hs_of_e4p5_a t_hs_of_e4p5_a];
S_hs_of_e4p5_a=[S_hs_of_e4p5_a s_hs_of_e4p5_a];


z_tm_of_e4p5_a = tm_of_e4p5_a(i,:);
t_tm_of_e4p5_a=trend(z_tm_of_e4p5_a); %tr=tr*365.25;
s_tm_of_e4p5_a= mann_kendall(z_tm_of_e4p5_a);
T_tm_of_e4p5_a=[T_tm_of_e4p5_a t_tm_of_e4p5_a];
S_tm_of_e4p5_a=[S_tm_of_e4p5_a s_tm_of_e4p5_a];


z_dm_of_e4p5_a = dm_of_e4p5_a(i,:);
t_dm_of_e4p5_a=trend(z_dm_of_e4p5_a); %tr=tr*365.25;
s_dm_of_e4p5_a= mann_kendall(z_dm_of_e4p5_a);
T_dm_of_e4p5_a=[T_dm_of_e4p5_a t_dm_of_e4p5_a];
S_dm_of_e4p5_a=[S_dm_of_e4p5_a s_dm_of_e4p5_a];

%%
z_hs_of_e4p5_w = hs_of_e4p5_w(i,:);
t_hs_of_e4p5_w=trend(z_hs_of_e4p5_w); %tr=tr*365.25;
s_hs_of_e4p5_w= mann_kendall(z_hs_of_e4p5_w);
T_hs_of_e4p5_w=[T_hs_of_e4p5_w t_hs_of_e4p5_w];
S_hs_of_e4p5_w=[S_hs_of_e4p5_w s_hs_of_e4p5_w];


z_tm_of_e4p5_w = tm_of_e4p5_w(i,:);
t_tm_of_e4p5_w=trend(z_tm_of_e4p5_w); %tr=tr*365.25;
s_tm_of_e4p5_w= mann_kendall(z_tm_of_e4p5_w);
T_tm_of_e4p5_w=[T_tm_of_e4p5_w t_tm_of_e4p5_w];
S_tm_of_e4p5_w=[S_tm_of_e4p5_w s_tm_of_e4p5_w];


z_dm_of_e4p5_w = dm_of_e4p5_w(i,:);
t_dm_of_e4p5_w=trend(z_dm_of_e4p5_w); %tr=tr*365.25;
s_dm_of_e4p5_w= mann_kendall(z_dm_of_e4p5_w);
T_dm_of_e4p5_w=[T_dm_of_e4p5_w t_dm_of_e4p5_w];
S_dm_of_e4p5_w=[S_dm_of_e4p5_w s_dm_of_e4p5_w];


%%
z_hs_of_e4p5_s = hs_of_e4p5_s(i,:);
t_hs_of_e4p5_s=trend(z_hs_of_e4p5_s); %tr=tr*365.25;
s_hs_of_e4p5_s= mann_kendall(z_hs_of_e4p5_s);
T_hs_of_e4p5_s=[T_hs_of_e4p5_s t_hs_of_e4p5_s];
S_hs_of_e4p5_s=[S_hs_of_e4p5_s s_hs_of_e4p5_s];


z_tm_of_e4p5_s = tm_of_e4p5_s(i,:);
t_tm_of_e4p5_s=trend(z_tm_of_e4p5_s); %tr=tr*365.25;
s_tm_of_e4p5_s= mann_kendall(z_tm_of_e4p5_s);
T_tm_of_e4p5_s=[T_tm_of_e4p5_s t_tm_of_e4p5_s];
S_tm_of_e4p5_s=[S_tm_of_e4p5_s s_tm_of_e4p5_s];


z_dm_of_e4p5_s = dm_of_e4p5_s(i,:);
t_dm_of_e4p5_s=trend(z_dm_of_e4p5_s); %tr=tr*365.25;
s_dm_of_e4p5_s= mann_kendall(z_dm_of_e4p5_s);
T_dm_of_e4p5_s=[T_dm_of_e4p5_s t_dm_of_e4p5_s];
S_dm_of_e4p5_s=[S_dm_of_e4p5_s s_dm_of_e4p5_s];


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Trend and significance
T_hs_of_e8p5_a=[]; S_hs_of_e8p5_a=[]; T_tm_of_e8p5_a=[]; S_tm_of_e8p5_a=[]; T_dm_of_e8p5_a=[]; S_dm_of_e8p5_a=[];
T_hs_of_e8p5_w=[]; S_hs_of_e8p5_w=[]; T_tm_of_e8p5_w=[]; S_tm_of_e8p5_w=[]; T_dm_of_e8p5_w=[]; S_dm_of_e8p5_w=[];
T_hs_of_e8p5_s=[]; S_hs_of_e8p5_s=[]; T_tm_of_e8p5_s=[]; S_tm_of_e8p5_s=[]; T_dm_of_e8p5_s=[]; S_dm_of_e8p5_s=[];


for i=1:length(hs_of_e8p5_a)
z_hs_of_e8p5_a = hs_of_e8p5_a(i,:);
t_hs_of_e8p5_a=trend(z_hs_of_e8p5_a); %tr=tr*365.25;
s_hs_of_e8p5_a= mann_kendall(z_hs_of_e8p5_a);
T_hs_of_e8p5_a=[T_hs_of_e8p5_a t_hs_of_e8p5_a];
S_hs_of_e8p5_a=[S_hs_of_e8p5_a s_hs_of_e8p5_a];


z_tm_of_e8p5_a = tm_of_e8p5_a(i,:);
t_tm_of_e8p5_a=trend(z_tm_of_e8p5_a); %tr=tr*365.25;
s_tm_of_e8p5_a= mann_kendall(z_tm_of_e8p5_a);
T_tm_of_e8p5_a=[T_tm_of_e8p5_a t_tm_of_e8p5_a];
S_tm_of_e8p5_a=[S_tm_of_e8p5_a s_tm_of_e8p5_a];


z_dm_of_e8p5_a = dm_of_e8p5_a(i,:);
t_dm_of_e8p5_a=trend(z_dm_of_e8p5_a); %tr=tr*365.25;
s_dm_of_e8p5_a= mann_kendall(z_dm_of_e8p5_a);
T_dm_of_e8p5_a=[T_dm_of_e8p5_a t_dm_of_e8p5_a];
S_dm_of_e8p5_a=[S_dm_of_e8p5_a s_dm_of_e8p5_a];

%%
z_hs_of_e8p5_w = hs_of_e8p5_w(i,:);
t_hs_of_e8p5_w=trend(z_hs_of_e8p5_w); %tr=tr*365.25;
s_hs_of_e8p5_w= mann_kendall(z_hs_of_e8p5_w);
T_hs_of_e8p5_w=[T_hs_of_e8p5_w t_hs_of_e8p5_w];
S_hs_of_e8p5_w=[S_hs_of_e8p5_w s_hs_of_e8p5_w];


z_tm_of_e8p5_w = tm_of_e8p5_w(i,:);
t_tm_of_e8p5_w=trend(z_tm_of_e8p5_w); %tr=tr*365.25;
s_tm_of_e8p5_w= mann_kendall(z_tm_of_e8p5_w);
T_tm_of_e8p5_w=[T_tm_of_e8p5_w t_tm_of_e8p5_w];
S_tm_of_e8p5_w=[S_tm_of_e8p5_w s_tm_of_e8p5_w];


z_dm_of_e8p5_w = dm_of_e8p5_w(i,:);
t_dm_of_e8p5_w=trend(z_dm_of_e8p5_w); %tr=tr*365.25;
s_dm_of_e8p5_w= mann_kendall(z_dm_of_e8p5_w);
T_dm_of_e8p5_w=[T_dm_of_e8p5_w t_dm_of_e8p5_w];
S_dm_of_e8p5_w=[S_dm_of_e8p5_w s_dm_of_e8p5_w];


%%
z_hs_of_e8p5_s = hs_of_e8p5_s(i,:);
t_hs_of_e8p5_s=trend(z_hs_of_e8p5_s); %tr=tr*365.25;
s_hs_of_e8p5_s= mann_kendall(z_hs_of_e8p5_s);
T_hs_of_e8p5_s=[T_hs_of_e8p5_s t_hs_of_e8p5_s];
S_hs_of_e8p5_s=[S_hs_of_e8p5_s s_hs_of_e8p5_s];


z_tm_of_e8p5_s = tm_of_e8p5_s(i,:);
t_tm_of_e8p5_s=trend(z_tm_of_e8p5_s); %tr=tr*365.25;
s_tm_of_e8p5_s= mann_kendall(z_tm_of_e8p5_s);
T_tm_of_e8p5_s=[T_tm_of_e8p5_s t_tm_of_e8p5_s];
S_tm_of_e8p5_s=[S_tm_of_e8p5_s s_tm_of_e8p5_s];


z_dm_of_e8p5_s = dm_of_e8p5_s(i,:);
t_dm_of_e8p5_s=trend(z_dm_of_e8p5_s); %tr=tr*365.25;
s_dm_of_e8p5_s= mann_kendall(z_dm_of_e8p5_s);
T_dm_of_e8p5_s=[T_dm_of_e8p5_s t_dm_of_e8p5_s];
S_dm_of_e8p5_s=[S_dm_of_e8p5_s s_dm_of_e8p5_s];


end


%%
points=["P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "P14",...
    "P15", "P16", "P17", "P18", "P19", "P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27", "P28"...
    "P29", "P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37", "P38", "P39", "P40", "P41", "P42"...
    "P43", "P44", "P45"];
P=points(1:2:45);
P1=1:45;

set(groot,'defaultAxesTickLabelInterpreter','latex');  
yyaxis left;
plot(nanmean(hs_of_m4p5_a,2)-nanmean(hs_of_hist_a,2),'-r','linewi',1.5); hold on 
plot(nanmean(hs_of_m8p5_a,2)-nanmean(hs_of_hist_a,2),'-b','linewi',1.5);hold on
plot(nanmean(hs_of_e4p5_a,2)-nanmean(hs_of_hist_a,2),'-c','linewi',1.5);hold on
plot(nanmean(hs_of_e8p5_a,2)-nanmean(hs_of_hist_a,2),'-k','linewi',1.5);hold on
ylabel('Hs Change(m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([-0.5 0.4])

yyaxis right;
plot(T_hs_of_m4p5_a,'o-m','linewi',1.0); hold on 
plot(T_hs_of_m8p5_a,'o-g','linewi',1.0);hold on
plot(T_hs_of_e4p5_a,'o-y','linewi',1.0);hold on
plot(T_hs_of_e8p5_a,'o-b','linewi',1.0);hold on

for i=1:45
if S_hs_of_m4p5_a(i)==1
       plot(P1(i),T_hs_of_m4p5_a(i),'*k','linewi',1.0); hold on
end
if S_hs_of_m8p5_a(i)==1
        plot(P1(i),T_hs_of_m8p5_a(i),'*k','linewi',1.0); hold on
end
if S_hs_of_e4p5_a(i)==1
        plot(P1(i),T_hs_of_e4p5_a(i),'*k','linewi',1.0); hold on
end
if S_hs_of_e8p5_a(i)==1
        plot(P1(i),T_hs_of_e8p5_a(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
%ylim([-8*10^-4 7*10^-4])
ylim([-8*10^-4 18*10^-4])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Hs Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs Trend (m y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));

%%
yyaxis left;
plot(nanmean(tm_of_m4p5_a,2)-nanmean(tm_of_hist_a,2),'-r','linewi',1.5); hold on 
plot(nanmean(tm_of_m8p5_a,2)-nanmean(tm_of_hist_a,2),'-b','linewi',1.5);hold on
plot(nanmean(tm_of_e4p5_a,2)-nanmean(tm_of_hist_a,2),'-c','linewi',1.5);hold on
plot(nanmean(tm_of_e8p5_a,2)-nanmean(tm_of_hist_a,2),'-k','linewi',1.5);hold on
ylabel('Tm Change(s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%ylim([-1.2 0.5])
ylim([-1.2 0.7])

yyaxis right;
plot(T_tm_of_m4p5_a,'o-m','linewi',1.0); hold on 
plot(T_tm_of_m8p5_a,'o-g','linewi',1.0);hold on
plot(T_tm_of_e4p5_a,'o-y','linewi',1.0);hold on
plot(T_tm_of_e8p5_a,'o-b','linewi',1.0);hold on

for i=1:45
if S_tm_of_m4p5_a(i)==1
       plot(P1(i),T_tm_of_m4p5_a(i),'*k','linewi',1.0); hold on
end
if S_tm_of_m8p5_a(i)==1
        plot(P1(i),T_tm_of_m8p5_a(i),'*k','linewi',1.0); hold on
end
if S_tm_of_e4p5_a(i)==1
        plot(P1(i),T_tm_of_e4p5_a(i),'*k','linewi',1.0); hold on
end
if S_tm_of_e8p5_a(i)==1
        plot(P1(i),T_tm_of_e8p5_a(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
%ylim([0*10^-3 7*10^-3])
ylim([0*10^-3 1.3*10^-2])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Tm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm Trend (s y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));


%%
yyaxis left;
plot(nanmean(dm_of_m4p5_a,2)-nanmean(dm_of_hist_a,2),'-r','linewi',1.5); hold on 
plot(nanmean(dm_of_m8p5_a,2)-nanmean(dm_of_hist_a,2),'-b','linewi',1.5);hold on
plot(nanmean(dm_of_e4p5_a,2)-nanmean(dm_of_hist_a,2),'-c','linewi',1.5);hold on
plot(nanmean(dm_of_e8p5_a,2)-nanmean(dm_of_hist_a,2),'-k','linewi',1.5);hold on
ylabel('Dm Change (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([-8 8])

yyaxis right;
plot(T_dm_of_m4p5_a,'o-m','linewi',1.0); hold on 
plot(T_dm_of_m8p5_a,'o-g','linewi',1.0);hold on
plot(T_dm_of_e4p5_a,'o-y','linewi',1.0);hold on
plot(T_dm_of_e8p5_a,'o-b','linewi',1.0);hold on

for i=1:45
if S_dm_of_m4p5_a(i)==1
       plot(P1(i),T_dm_of_m4p5_a(i),'*k','linewi',1.0); hold on
end
if S_dm_of_m8p5_a(i)==1
        plot(P1(i),T_dm_of_m8p5_a(i),'*k','linewi',1.0); hold on
end
if S_dm_of_e4p5_a(i)==1
        plot(P1(i),T_dm_of_e4p5_a(i),'*k','linewi',1.0); hold on
end
if S_dm_of_e8p5_a(i)==1
        plot(P1(i),T_dm_of_e8p5_a(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
%ylim([-8*10^-2 5*10^-2])
ylim([-8*10^-2 8*10^-2])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Dm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm Trend (^o y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Winter
yyaxis left;
plot(nanmean(hs_of_m4p5_w,2)-nanmean(hs_of_hist_w,2),'-r','linewi',1.5); hold on 
plot(nanmean(hs_of_m8p5_w,2)-nanmean(hs_of_hist_w,2),'-b','linewi',1.5);hold on
plot(nanmean(hs_of_e4p5_w,2)-nanmean(hs_of_hist_w,2),'-c','linewi',1.5);hold on
plot(nanmean(hs_of_e8p5_w,2)-nanmean(hs_of_hist_w,2),'-k','linewi',1.5);hold on
ylabel('Hs Change(m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([-0.5 0.4])

yyaxis right;
plot(T_hs_of_m4p5_w,'o-m','linewi',1.0); hold on 
plot(T_hs_of_m8p5_w,'o-g','linewi',1.0);hold on
plot(T_hs_of_e4p5_w,'o-y','linewi',1.0);hold on
plot(T_hs_of_e8p5_w,'o-b','linewi',1.0);hold on

for i=1:45
if S_hs_of_m4p5_w(i)==1
       plot(P1(i),T_hs_of_m4p5_w(i),'*k','linewi',1.0); hold on
end
if S_hs_of_m8p5_w(i)==1
        plot(P1(i),T_hs_of_m8p5_w(i),'*k','linewi',1.0); hold on
end
if S_hs_of_e4p5_w(i)==1
        plot(P1(i),T_hs_of_e4p5_w(i),'*k','linewi',1.0); hold on
end
if S_hs_of_e8p5_w(i)==1
        plot(P1(i),T_hs_of_e8p5_w(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
%ylim([-8*10^-4 7*10^-4])
ylim([-8*10^-4 18*10^-4])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Hs Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs Trend (m y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));

%%
yyaxis left;
plot(nanmean(tm_of_m4p5_w,2)-nanmean(tm_of_hist_w,2),'-r','linewi',1.5); hold on 
plot(nanmean(tm_of_m8p5_w,2)-nanmean(tm_of_hist_w,2),'-b','linewi',1.5);hold on
plot(nanmean(tm_of_e4p5_w,2)-nanmean(tm_of_hist_w,2),'-c','linewi',1.5);hold on
plot(nanmean(tm_of_e8p5_w,2)-nanmean(tm_of_hist_w,2),'-k','linewi',1.5);hold on
ylabel('Tm Change(s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%ylim([-1.2 0.5])
ylim([-1.2 0.7])

yyaxis right;
plot(T_tm_of_m4p5_w,'o-m','linewi',1.0); hold on 
plot(T_tm_of_m8p5_w,'o-g','linewi',1.0);hold on
plot(T_tm_of_e4p5_w,'o-y','linewi',1.0);hold on
plot(T_tm_of_e8p5_w,'o-b','linewi',1.0);hold on

for i=1:45
if S_tm_of_m4p5_w(i)==1
       plot(P1(i),T_tm_of_m4p5_w(i),'*k','linewi',1.0); hold on
end
if S_tm_of_m8p5_w(i)==1
        plot(P1(i),T_tm_of_m8p5_w(i),'*k','linewi',1.0); hold on
end
if S_tm_of_e4p5_w(i)==1
        plot(P1(i),T_tm_of_e4p5_w(i),'*k','linewi',1.0); hold on
end
if S_tm_of_e8p5_w(i)==1
        plot(P1(i),T_tm_of_e8p5_w(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
%ylim([0*10^-3 7*10^-3])
ylim([0*10^-3 1.3*10^-2])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Tm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm Trend (s y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));


%%
yyaxis left;
plot(nanmean(dm_of_m4p5_w,2)-nanmean(dm_of_hist_w,2),'-r','linewi',1.5); hold on 
plot(nanmean(dm_of_m8p5_w,2)-nanmean(dm_of_hist_w,2),'-b','linewi',1.5);hold on
plot(nanmean(dm_of_e4p5_w,2)-nanmean(dm_of_hist_w,2),'-c','linewi',1.5);hold on
plot(nanmean(dm_of_e8p5_w,2)-nanmean(dm_of_hist_w,2),'-k','linewi',1.5);hold on
ylabel('Dm Change (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([-8 8])

yyaxis right;
plot(T_dm_of_m4p5_w,'o-m','linewi',1.0); hold on 
plot(T_dm_of_m8p5_w,'o-g','linewi',1.0);hold on
plot(T_dm_of_e4p5_w,'o-y','linewi',1.0);hold on
plot(T_dm_of_e8p5_w,'o-b','linewi',1.0);hold on

for i=1:45
if S_dm_of_m4p5_w(i)==1
       plot(P1(i),T_dm_of_m4p5_w(i),'*k','linewi',1.0); hold on
end
if S_dm_of_m8p5_w(i)==1
        plot(P1(i),T_dm_of_m8p5_w(i),'*k','linewi',1.0); hold on
end
if S_dm_of_e4p5_w(i)==1
        plot(P1(i),T_dm_of_e4p5_w(i),'*k','linewi',1.0); hold on
end
if S_dm_of_e8p5_w(i)==1
        plot(P1(i),T_dm_of_e8p5_w(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
%ylim([-8*10^-2 5*10^-2])
ylim([-8*10^-2 8*10^-2])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Dm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm Trend (^o y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summer
yyaxis left;
plot(nanmean(hs_of_m4p5_s,2)-nanmean(hs_of_hist_s,2),'-r','linewi',1.5); hold on 
plot(nanmean(hs_of_m8p5_s,2)-nanmean(hs_of_hist_s,2),'-b','linewi',1.5);hold on
plot(nanmean(hs_of_e4p5_s,2)-nanmean(hs_of_hist_s,2),'-c','linewi',1.5);hold on
plot(nanmean(hs_of_e8p5_s,2)-nanmean(hs_of_hist_s,2),'-k','linewi',1.5);hold on
ylabel('Hs Change(m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([-0.5 0.4])

yyaxis right;
plot(T_hs_of_m4p5_s,'o-m','linewi',1.0); hold on 
plot(T_hs_of_m8p5_s,'o-g','linewi',1.0);hold on
plot(T_hs_of_e4p5_s,'o-y','linewi',1.0);hold on
plot(T_hs_of_e8p5_s,'o-b','linewi',1.0);hold on

for i=1:45
if S_hs_of_m4p5_s(i)==1
       plot(P1(i),T_hs_of_m4p5_s(i),'*k','linewi',1.0); hold on
end
if S_hs_of_m8p5_s(i)==1
        plot(P1(i),T_hs_of_m8p5_s(i),'*k','linewi',1.0); hold on
end
if S_hs_of_e4p5_s(i)==1
        plot(P1(i),T_hs_of_e4p5_s(i),'*k','linewi',1.0); hold on
end
if S_hs_of_e8p5_s(i)==1
        plot(P1(i),T_hs_of_e8p5_s(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
ylim([-8*10^-4 18*10^-4])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Hs Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs Trend (m y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));

%%
yyaxis left;
plot(nanmean(tm_of_m4p5_s,2)-nanmean(tm_of_hist_s,2),'-r','linewi',1.5); hold on 
plot(nanmean(tm_of_m8p5_s,2)-nanmean(tm_of_hist_s,2),'-b','linewi',1.5);hold on
plot(nanmean(tm_of_e4p5_s,2)-nanmean(tm_of_hist_s,2),'-c','linewi',1.5);hold on
plot(nanmean(tm_of_e8p5_s,2)-nanmean(tm_of_hist_s,2),'-k','linewi',1.5);hold on
ylabel('Tm Change(s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([-1.2 0.7])

yyaxis right;
plot(T_tm_of_m4p5_s,'o-m','linewi',1.0); hold on 
plot(T_tm_of_m8p5_s,'o-g','linewi',1.0);hold on
plot(T_tm_of_e4p5_s,'o-y','linewi',1.0);hold on
plot(T_tm_of_e8p5_s,'o-b','linewi',1.0);hold on

for i=1:45
if S_tm_of_m4p5_s(i)==1
       plot(P1(i),T_tm_of_m4p5_s(i),'*k','linewi',1.0); hold on
end
if S_tm_of_m8p5_s(i)==1
        plot(P1(i),T_tm_of_m8p5_s(i),'*k','linewi',1.0); hold on
end
if S_tm_of_e4p5_s(i)==1
        plot(P1(i),T_tm_of_e4p5_s(i),'*k','linewi',1.0); hold on
end
if S_tm_of_e8p5_s(i)==1
        plot(P1(i),T_tm_of_e8p5_s(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
ylim([0*10^-3 1.3*10^-2])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Tm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm Trend (s y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));


%%
yyaxis left;
plot(nanmean(dm_of_m4p5_s,2)-nanmean(dm_of_hist_s,2),'-r','linewi',1.5); hold on 
plot(nanmean(dm_of_m8p5_s,2)-nanmean(dm_of_hist_s,2),'-b','linewi',1.5);hold on
plot(nanmean(dm_of_e4p5_s,2)-nanmean(dm_of_hist_s,2),'-c','linewi',1.5);hold on
plot(nanmean(dm_of_e8p5_s,2)-nanmean(dm_of_hist_s,2),'-k','linewi',1.5);hold on
ylabel('Dm Change (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylim([-8 8])

yyaxis right;
plot(T_dm_of_m4p5_s,'o-m','linewi',1.0); hold on 
plot(T_dm_of_m8p5_s,'o-g','linewi',1.0);hold on
plot(T_dm_of_e4p5_s,'o-y','linewi',1.0);hold on
plot(T_dm_of_e8p5_s,'o-b','linewi',1.0);hold on

for i=1:45
if S_dm_of_m4p5_s(i)==1
       plot(P1(i),T_dm_of_m4p5_s(i),'*k','linewi',1.0); hold on
end
if S_dm_of_m8p5_s(i)==1
        plot(P1(i),T_dm_of_m8p5_s(i),'*k','linewi',1.0); hold on
end
if S_dm_of_e4p5_s(i)==1
        plot(P1(i),T_dm_of_e4p5_s(i),'*k','linewi',1.0); hold on
end
if S_dm_of_e8p5_s(i)==1
        plot(P1(i),T_dm_of_e8p5_s(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
ylim([-8*10^-2 8*10^-2])

legend('M4.5 Change','M8.5 Change','E4.5 Change','E8.5 Change','M4.5 Trend','M8.5 Trend','E4.5 Trend','E8.5 Trend','Location','south','NumColumns',2,'FontWeight','Bold');
title('Dm Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm Trend (^o y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));


%%
    
clc; clear

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

m4p5=nanmean(hs_of_m4p5_a,2)-nanmean(hs_of_hist_a,2);
m8p5=nanmean(hs_of_m8p5_a,2)-nanmean(hs_of_hist_a,2);
e4p5=nanmean(hs_of_e4p5_a,2)-nanmean(hs_of_hist_a,2);
e8p5=nanmean(hs_of_e8p5_a,2)-nanmean(hs_of_hist_a,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(hs_of_m4p5_w,2)-nanmean(hs_of_hist_w,2);
m8p5=nanmean(hs_of_m8p5_w,2)-nanmean(hs_of_hist_w,2);
e4p5=nanmean(hs_of_e4p5_w,2)-nanmean(hs_of_hist_w,2);
e8p5=nanmean(hs_of_e8p5_w,2)-nanmean(hs_of_hist_w,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(hs_of_m4p5_s,2)-nanmean(hs_of_hist_s,2);
m8p5=nanmean(hs_of_m8p5_s,2)-nanmean(hs_of_hist_s,2);
e4p5=nanmean(hs_of_e4p5_s,2)-nanmean(hs_of_hist_s,2);
e8p5=nanmean(hs_of_e8p5_s,2)-nanmean(hs_of_hist_s,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]


m4p5=nanmean(tm_of_m4p5_a,2)-nanmean(tm_of_hist_a,2);
m8p5=nanmean(tm_of_m8p5_a,2)-nanmean(tm_of_hist_a,2);
e4p5=nanmean(tm_of_e4p5_a,2)-nanmean(tm_of_hist_a,2);
e8p5=nanmean(tm_of_e8p5_a,2)-nanmean(tm_of_hist_a,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(tm_of_m4p5_w,2)-nanmean(tm_of_hist_w,2);
m8p5=nanmean(tm_of_m8p5_w,2)-nanmean(tm_of_hist_w,2);
e4p5=nanmean(tm_of_e4p5_w,2)-nanmean(tm_of_hist_w,2);
e8p5=nanmean(tm_of_e8p5_w,2)-nanmean(tm_of_hist_w,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(tm_of_m4p5_s,2)-nanmean(tm_of_hist_s,2);
m8p5=nanmean(tm_of_m8p5_s,2)-nanmean(tm_of_hist_s,2);
e4p5=nanmean(tm_of_e4p5_s,2)-nanmean(tm_of_hist_s,2);
e8p5=nanmean(tm_of_e8p5_s,2)-nanmean(tm_of_hist_s,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(dm_of_m4p5_a,2)-nanmean(dm_of_hist_a,2);
m8p5=nanmean(dm_of_m8p5_a,2)-nanmean(dm_of_hist_a,2);
e4p5=nanmean(dm_of_e4p5_a,2)-nanmean(dm_of_hist_a,2);
e8p5=nanmean(dm_of_e8p5_a,2)-nanmean(dm_of_hist_a,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(dm_of_m4p5_w,2)-nanmean(dm_of_hist_w,2);
m8p5=nanmean(dm_of_m8p5_w,2)-nanmean(dm_of_hist_w,2);
e4p5=nanmean(dm_of_e4p5_w,2)-nanmean(dm_of_hist_w,2);
e8p5=nanmean(dm_of_e8p5_w,2)-nanmean(dm_of_hist_w,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(dm_of_m4p5_s,2)-nanmean(dm_of_hist_s,2);
m8p5=nanmean(dm_of_m8p5_s,2)-nanmean(dm_of_hist_s,2);
e4p5=nanmean(dm_of_e4p5_s,2)-nanmean(dm_of_hist_s,2);
e8p5=nanmean(dm_of_e8p5_s,2)-nanmean(dm_of_hist_s,2);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m4p5=nanmean(T_hs_of_m4p5_a);
m8p5=nanmean(T_hs_of_m8p5_a);
e4p5=nanmean(T_hs_of_e4p5_a);
e8p5=nanmean(T_hs_of_e8p5_a);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(T_hs_of_m4p5_w);
m8p5=nanmean(T_hs_of_m8p5_w);
e4p5=nanmean(T_hs_of_e4p5_w);
e8p5=nanmean(T_hs_of_e8p5_w);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(T_hs_of_m4p5_s);
m8p5=nanmean(T_hs_of_m8p5_s);
e4p5=nanmean(T_hs_of_e4p5_s);
e8p5=nanmean(T_hs_of_e8p5_s);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]


m4p5=nanmean(T_tm_of_m4p5_a);
m8p5=nanmean(T_tm_of_m8p5_a);
e4p5=nanmean(T_tm_of_e4p5_a);
e8p5=nanmean(T_tm_of_e8p5_a);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(T_tm_of_m4p5_w);
m8p5=nanmean(T_tm_of_m8p5_w);
e4p5=nanmean(T_tm_of_e4p5_w);
e8p5=nanmean(T_tm_of_e8p5_w);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(T_tm_of_m4p5_s);
m8p5=nanmean(T_tm_of_m8p5_s);
e4p5=nanmean(T_tm_of_e4p5_s);
e8p5=nanmean(T_tm_of_e8p5_s);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(T_dm_of_m4p5_a);
m8p5=nanmean(T_dm_of_m8p5_a);
e4p5=nanmean(T_dm_of_e4p5_a);
e8p5=nanmean(T_dm_of_e8p5_a);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(T_dm_of_m4p5_w);
m8p5=nanmean(T_dm_of_m8p5_w);
e4p5=nanmean(T_dm_of_e4p5_w);
e8p5=nanmean(T_dm_of_e8p5_w);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]

m4p5=nanmean(T_dm_of_m4p5_s);
m8p5=nanmean(T_dm_of_m8p5_s);
e4p5=nanmean(T_dm_of_e4p5_s);
e8p5=nanmean(T_dm_of_e8p5_s);
[min(m4p5) max(m4p5) nanmean(m4p5)]
[min(m8p5) max(m8p5) nanmean(m8p5)]
[min(e4p5) max(e4p5) nanmean(e4p5)]
[min(e8p5) max(e8p5) nanmean(e8p5)]
[nanmean(m4p5);nanmean(m8p5);nanmean(e4p5); nanmean(e8p5)]
