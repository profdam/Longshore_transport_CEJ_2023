clc; clear;
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_2.mat')

%% Average by country

C1=1:4; %Gabon
C2=5:8; %Equatorial Guinea
C3=9:12; %Cameroon
C4=13:17; %Eastern Nigeria Niger Delta
C5=18:23; %WEstern Nigeria
C6=24:26; % Lagos-Benin
C7=27:29; %Togo -Ghana
C8=30:31; %Eastern Ghana
C9=32:34; %Central Ghana
C10=35:38; %Western Ghana Cote d'Ivoire
C11=39:45; %Cote d'Ivoire

%% Annual average
L=C1;
Q1_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];

L=C2;
Q2_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];

L=C3;
Q3_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];

L=C4;
Q4_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
L=C5;
Q5_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
L=C6;
Q6_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
L=C7;
Q7_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
L=C8;
Q8_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
L=C9;
Q9_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
L=C10;
Q10_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
L=C11;
Q11_a=[nanmean(nanmean(Q_hist_a(:,L))) nanmean(nanmean(Q_Mid_4p5_a(:,L))) nanmean(nanmean(Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(Q_End_4p5_a(:,L))) nanmean(nanmean(Q_End_8p5_a(:,L)))];
Q_a=[Q1_a;Q2_a;Q3_a;Q4_a;Q5_a;Q6_a;Q7_a;Q8_a;Q9_a;Q10_a;Q11_a];

%% Winter average
L=C1;
Q1_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];

L=C2;
Q2_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];

L=C3;
Q3_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];

L=C4;
Q4_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
L=C5;
Q5_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
L=C6;
Q6_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
L=C7;
Q7_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
L=C8;
Q8_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
L=C9;
Q9_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
L=C10;
Q10_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
L=C11;
Q11_w=[nanmean(nanmean(Q_hist_w(:,L))) nanmean(nanmean(Q_Mid_4p5_w(:,L))) nanmean(nanmean(Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(Q_End_4p5_w(:,L))) nanmean(nanmean(Q_End_8p5_w(:,L)))];
Q_w=[Q1_w;Q2_w;Q3_w;Q4_w;Q5_w;Q6_w;Q7_w;Q8_w;Q9_w;Q10_w;Q11_w];

%% Summer Average
L=C1;
Q1_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];

L=C2;
Q2_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];

L=C3;
Q3_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];

L=C4;
Q4_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
L=C5;
Q5_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
L=C6;
Q6_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
L=C7;
Q7_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
L=C8;
Q8_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
L=C9;
Q9_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
L=C10;
Q10_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
L=C11;
Q11_s=[nanmean(nanmean(Q_hist_s(:,L))) nanmean(nanmean(Q_Mid_4p5_s(:,L))) nanmean(nanmean(Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(Q_End_4p5_s(:,L))) nanmean(nanmean(Q_End_8p5_s(:,L)))];
Q_s=[Q1_s;Q2_s;Q3_s;Q4_s;Q5_s;Q6_s;Q7_s;Q8_s;Q9_s;Q10_s;Q11_s];

%% Bar graphs
y = [Q_a(1,1) Q_a(1,2) Q_a(1,3) Q_a(1,4) Q_a(1,5); ...
    Q_a(2,1) Q_a(2,2) Q_a(2,3) Q_a(2,4) Q_a(2,5);...
    Q_a(3,1) Q_a(3,2) Q_a(3,3) Q_a(3,4) Q_a(3,5);...
    Q_a(4,1) Q_a(4,2) Q_a(4,3) Q_a(4,4) Q_a(4,5);...
    Q_a(5,1) Q_a(5,2) Q_a(5,3) Q_a(5,4) Q_a(5,5);...
    Q_a(6,1) Q_a(6,2) Q_a(6,3) Q_a(6,4) Q_a(6,5);...
    Q_a(7,1) Q_a(7,2) Q_a(7,3) Q_a(7,4) Q_a(7,5);...
    Q_a(8,1) Q_a(8,2) Q_a(8,3) Q_a(8,4) Q_a(8,5);...
    Q_a(9,1) Q_a(9,2) Q_a(9,3) Q_a(9,4) Q_a(9,5);...
    Q_a(10,1) Q_a(10,2) Q_a(10,3) Q_a(10,4) Q_a(10,5);...
    Q_a(11,1) Q_a(11,2) Q_a(11,3) Q_a(11,4) Q_a(11,5)];

%%
%HS_a=[hs_a_hist hs_a_m4p5 hs_a_m8p5 hs_a_e4p5 hs_a_e8p5];
HS_a=[hs_a_m4p5 hs_a_m8p5 hs_a_e4p5 hs_a_e8p5];
HS_w=[hs_w_m4p5 hs_w_m8p5 hs_w_e4p5 hs_w_e8p5];
HS_s=[hs_s_m4p5 hs_s_m8p5 hs_s_e4p5 hs_s_e8p5];

[p,tbl,stats] = anova1(Q_a);
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
RCP=["Historical","Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Q_a, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:5)
%xlim([2 5]) 
title('Annual')
ylabel('Time slices')
xlabel('Q (m^3y-^1^)')
%% Winter
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Historical","Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Q_w, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:5)
%xlim([2 5]) 
title('Winter')
ylabel('Time slices')
xlabel('Q (m^3y-^1^)')

%% Summer
%RCP=["Hist", "Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
RCP=["Historical","Mid 4.5", "Mid 8.5", "End 4.5", "End 8.5"];
h=boxplot(Q_s, 'Colors','br','MedianStyle','target','Notch','marker','Symbol','','Orientation','horizontal')
set(h,{'linew'},{2})
set(gca,'yticklabel',RCP.','FontWeight','Bold');
yticks(1:5)
%xlim([2 5]) 
title('Summer')
ylabel('Time slices')
xlabel('Q (m^3y-^1^)')

%%
plot(hs_a_hist); hold on
plot(hs_a_m4p5); hold on
plot(hs_a_m8p5); hold on
plot(hs_a_e4p5); hold on
plot(hs_a_e8p5); hold on

