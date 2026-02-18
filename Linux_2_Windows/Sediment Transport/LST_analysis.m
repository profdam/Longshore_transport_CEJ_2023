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

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Annual LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%bar(y,'stacked')
%% Bar graphs
y = [Q_w(1,1) Q_w(1,2) Q_w(1,3) Q_w(1,4) Q_w(1,5); ...
    Q_w(2,1) Q_w(2,2) Q_w(2,3) Q_w(2,4) Q_w(2,5);...
    Q_w(3,1) Q_w(3,2) Q_w(3,3) Q_w(3,4) Q_w(3,5);...
    Q_w(4,1) Q_w(4,2) Q_w(4,3) Q_w(4,4) Q_w(4,5);...
    Q_w(5,1) Q_w(5,2) Q_w(5,3) Q_w(5,4) Q_w(5,5);...
    Q_w(6,1) Q_w(6,2) Q_w(6,3) Q_w(6,4) Q_w(6,5);...
    Q_w(7,1) Q_w(7,2) Q_w(7,3) Q_w(7,4) Q_w(7,5);...
    Q_w(8,1) Q_w(8,2) Q_w(8,3) Q_w(8,4) Q_w(8,5);...
    Q_w(9,1) Q_w(9,2) Q_w(9,3) Q_w(9,4) Q_w(9,5);...
    Q_w(10,1) Q_w(10,2) Q_w(10,3) Q_w(10,4) Q_w(10,5);...
    Q_w(11,1) Q_w(11,2) Q_w(11,3) Q_w(11,4) Q_w(11,5)];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Winter LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Bar graphs
y = [Q_s(1,1) Q_s(1,2) Q_s(1,3) Q_s(1,4) Q_s(1,5); ...
    Q_s(2,1) Q_s(2,2) Q_s(2,3) Q_s(2,4) Q_s(2,5);...
    Q_s(3,1) Q_s(3,2) Q_s(3,3) Q_s(3,4) Q_s(3,5);...
    Q_s(4,1) Q_s(4,2) Q_s(4,3) Q_s(4,4) Q_s(4,5);...
    Q_s(5,1) Q_s(5,2) Q_s(5,3) Q_s(5,4) Q_s(5,5);...
    Q_s(6,1) Q_s(6,2) Q_s(6,3) Q_s(6,4) Q_s(6,5);...
    Q_s(7,1) Q_s(7,2) Q_s(7,3) Q_s(7,4) Q_s(7,5);...
    Q_s(8,1) Q_s(8,2) Q_s(8,3) Q_s(8,4) Q_s(8,5);...
    Q_s(9,1) Q_s(9,2) Q_s(9,3) Q_s(9,4) Q_s(9,5);...
    Q_s(10,1) Q_s(10,2) Q_s(10,3) Q_s(10,4) Q_s(10,5);...
    Q_s(11,1) Q_s(11,2) Q_s(11,3) Q_s(11,4) Q_s(11,5)];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Summer LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%%
clc; clear;
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_2.mat')

%%
x1 = abs(nanmean(Q_hist_a,1));
%x2 = Horsepower;    % Contains NaN data
y = nanmean(Hb_f_a,1); %y=y.^2;

X = [ones(size(x1));x1];
[~,~,~,~,stats]= regress(y',X')    % Removes NaN data

%%
x1 = nanmean(Q_hist_a,1);
%x2 = Horsepower;    % Contains NaN data
y = angg; %nanmean(Hb_f_a,1); %y=y.^2;

X = [ones(size(x1));x1];
[~,~,~,~,stats]= regress(y',X')    % Removes NaN data

