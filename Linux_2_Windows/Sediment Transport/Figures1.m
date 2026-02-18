% Historical
clc; clear all; close all;


load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_2.mat')


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
z_Q_hist_a= abs(Q_hist_a(:,i));
t_Q_hist_a=trend(z_Q_hist_a); %tr=tr*365.25;
s_Q_hist_a= mann_kendall(z_Q_hist_a);
T_Q_hist_a=[T_Q_hist_a t_Q_hist_a];
S_Q_hist_a=[S_Q_hist_a s_Q_hist_a];


z_Q_hist_s= abs(Q_hist_s(:,i));
t_Q_hist_s=trend(z_Q_hist_s); %tr=tr*365.25;
s_Q_hist_s= mann_kendall(z_Q_hist_s);
T_Q_hist_s=[T_Q_hist_s t_Q_hist_s];
S_Q_hist_s=[S_Q_hist_s s_Q_hist_s];


z_Q_hist_w= abs(Q_hist_w(:,i));
t_Q_hist_w=trend(z_Q_hist_w); %tr=tr*365.25;
s_Q_hist_w= mann_kendall(z_Q_hist_w);
T_Q_hist_w=[T_Q_hist_w t_Q_hist_w];
S_Q_hist_w=[S_Q_hist_w s_Q_hist_w];

%% Mid 4.5
z_Q_Mid_4p5_a= abs(Q_Mid_4p5_a(:,i));
t_Q_Mid_4p5_a=trend(z_Q_Mid_4p5_a); %tr=tr*365.25;
s_Q_Mid_4p5_a= mann_kendall(z_Q_Mid_4p5_a);
T_Q_Mid_4p5_a=[T_Q_Mid_4p5_a t_Q_Mid_4p5_a];
S_Q_Mid_4p5_a=[S_Q_Mid_4p5_a s_Q_Mid_4p5_a];


z_Q_Mid_4p5_s= abs(Q_Mid_4p5_s(:,i));
t_Q_Mid_4p5_s=trend(z_Q_Mid_4p5_s); %tr=tr*365.25;
s_Q_Mid_4p5_s= mann_kendall(z_Q_Mid_4p5_s);
T_Q_Mid_4p5_s=[T_Q_Mid_4p5_s t_Q_Mid_4p5_s];
S_Q_Mid_4p5_s=[S_Q_Mid_4p5_s s_Q_Mid_4p5_s];


z_Q_Mid_4p5_w= abs(Q_Mid_4p5_w(:,i));
t_Q_Mid_4p5_w=trend(z_Q_Mid_4p5_w); %tr=tr*365.25;
s_Q_Mid_4p5_w= mann_kendall(z_Q_Mid_4p5_w);
T_Q_Mid_4p5_w=[T_Q_Mid_4p5_w t_Q_Mid_4p5_w];
S_Q_Mid_4p5_w=[S_Q_Mid_4p5_w s_Q_Mid_4p5_w];

%% Mid 8.5
z_Q_Mid_8p5_a= abs(Q_Mid_8p5_a(:,i));
t_Q_Mid_8p5_a=trend(z_Q_Mid_8p5_a); %tr=tr*365.25;
s_Q_Mid_8p5_a= mann_kendall(z_Q_Mid_8p5_a);
T_Q_Mid_8p5_a=[T_Q_Mid_8p5_a t_Q_Mid_8p5_a];
S_Q_Mid_8p5_a=[S_Q_Mid_8p5_a s_Q_Mid_8p5_a];


z_Q_Mid_8p5_s= abs(Q_Mid_8p5_s(:,i));
t_Q_Mid_8p5_s=trend(z_Q_Mid_8p5_s); %tr=tr*365.25;
s_Q_Mid_8p5_s= mann_kendall(z_Q_Mid_8p5_s);
T_Q_Mid_8p5_s=[T_Q_Mid_8p5_s t_Q_Mid_8p5_s];
S_Q_Mid_8p5_s=[S_Q_Mid_8p5_s s_Q_Mid_8p5_s];


z_Q_Mid_8p5_w= abs(Q_Mid_8p5_w(:,i));
t_Q_Mid_8p5_w=trend(z_Q_Mid_8p5_w); %tr=tr*365.25;
s_Q_Mid_8p5_w= mann_kendall(z_Q_Mid_8p5_w);
T_Q_Mid_8p5_w=[T_Q_Mid_8p5_w t_Q_Mid_8p5_w];
S_Q_Mid_8p5_w=[S_Q_Mid_8p5_w s_Q_Mid_8p5_w];

%% End 4.5
z_Q_End_4p5_a= abs(Q_End_4p5_a(:,i));
t_Q_End_4p5_a=trend(z_Q_End_4p5_a); %tr=tr*365.25;
s_Q_End_4p5_a= mann_kendall(z_Q_End_4p5_a);
T_Q_End_4p5_a=[T_Q_End_4p5_a t_Q_End_4p5_a];
S_Q_End_4p5_a=[S_Q_End_4p5_a s_Q_End_4p5_a];


z_Q_End_4p5_s= abs(Q_End_4p5_s(:,i));
t_Q_End_4p5_s=trend(z_Q_End_4p5_s); %tr=tr*365.25;
s_Q_End_4p5_s= mann_kendall(z_Q_End_4p5_s);
T_Q_End_4p5_s=[T_Q_End_4p5_s t_Q_End_4p5_s];
S_Q_End_4p5_s=[S_Q_End_4p5_s s_Q_End_4p5_s];


z_Q_End_4p5_w=abs(Q_End_4p5_w(:,i));
t_Q_End_4p5_w=trend(z_Q_End_4p5_w); %tr=tr*365.25;
s_Q_End_4p5_w= mann_kendall(z_Q_End_4p5_w);
T_Q_End_4p5_w=[T_Q_End_4p5_w t_Q_End_4p5_w];
S_Q_End_4p5_w=[S_Q_End_4p5_w s_Q_End_4p5_w];

%% End 8.5
z_Q_End_8p5_a= abs(Q_End_8p5_a(:,i));
t_Q_End_8p5_a=trend(z_Q_End_8p5_a); %tr=tr*365.25;
s_Q_End_8p5_a= mann_kendall(z_Q_End_8p5_a);
T_Q_End_8p5_a=[T_Q_End_8p5_a t_Q_End_8p5_a];
S_Q_End_8p5_a=[S_Q_End_8p5_a s_Q_End_8p5_a];


z_Q_End_8p5_s= abs(Q_End_8p5_s(:,i));
t_Q_End_8p5_s=trend(z_Q_End_8p5_s); %tr=tr*365.25;
s_Q_End_8p5_s= mann_kendall(z_Q_End_8p5_s);
T_Q_End_8p5_s=[T_Q_End_8p5_s t_Q_End_8p5_s];
S_Q_End_8p5_s=[S_Q_End_8p5_s s_Q_End_8p5_s];


z_Q_End_8p5_w= abs(Q_End_8p5_w(:,i));
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
legend('Annual','Summer','Winter','Location','north','NumColumns',2,'FontWeight','Bold');
title('LST for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Temporal Timeseries historical
T=1979:2:2005;
plot(nanmean(Q_hist_a,2),'o-r','linewi',1.5); hold on 
plot(nanmean(Q_hist_s,2),'>-b','linewi',1.5);hold on
plot(nanmean(Q_hist_w,2),'x-c','linewi',1.5);hold on
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
plot(nanmean(Q_Mid_4p5_a,1),'+-r','linewi',1.5); hold on 
plot(nanmean(Q_Mid_4p5_s,1),'>-b','linewi',1.5);hold on
plot(nanmean(Q_Mid_4p5_w,1),'x-c','linewi',1.5);hold on
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
plot(nanmean(Q_Mid_8p5_a,1),'*-k','linewi',1.5); hold on 
plot(nanmean(Q_Mid_8p5_s,1),'p-m','linewi',1.5);hold on
plot(nanmean(Q_Mid_8p5_w,1),'s-g','linewi',1.5);hold on
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
plot(nanmean(Q_End_4p5_a,1),'+-r','linewi',1.5); hold on 
plot(nanmean(Q_End_4p5_s,1),'>-b','linewi',1.5);hold on
plot(nanmean(Q_End_4p5_w,1),'x-c','linewi',1.5);hold on
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
plot(nanmean(Q_End_8p5_a,1),'*-k','linewi',1.5); hold on 
plot(nanmean(Q_End_8p5_s,1),'p-m','linewi',1.5);hold on
plot(nanmean(Q_End_8p5_w,1),'s-g','linewi',1.5);hold on
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

%% LST Trend plots
% Plot the line graph of all seasons
% Annual
P1=1:45;
plot(T_Q_hist_a,'o-r','linewi',1.0); hold on 
plot(T_Q_Mid_4p5_a,'o-b','linewi',1.0);hold on
plot(T_Q_Mid_8p5_a,'o-c','linewi',1.0);hold on
plot(T_Q_End_4p5_a,'o-m','linewi',1.0); hold on 
plot(T_Q_End_8p5_a,'o-g','linewi',1.0);hold on

for i=1:45
if S_Q_hist_a(i)==1
       plot(P1(i),T_Q_hist_a(i),'*k','linewi',1.0); hold on
end
if S_Q_Mid_4p5_a(i)==1
        plot(P1(i),T_Q_Mid_4p5_a(i),'*k','linewi',1.0); hold on
end
if S_Q_Mid_8p5_a(i)==1
        plot(P1(i),T_Q_Mid_8p5_a(i),'*k','linewi',1.0); hold on
end


if S_Q_End_4p5_a(i)==1
        plot(P1(i),T_Q_End_4p5_a(i),'*k','linewi',1.0); hold on
end
if S_Q_End_8p5_a(i)==1
        plot(P1(i),T_Q_End_8p5_a(i),'*k','linewi',1.0); hold on
end
end

set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',2,'FontWeight','Bold');
title('Annual LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Trend (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%%
% Winter
P1=1:45;
plot(T_Q_hist_w,'o-r','linewi',1.0); hold on 
plot(T_Q_Mid_4p5_w,'o-b','linewi',1.0);hold on
plot(T_Q_Mid_8p5_w,'o-c','linewi',1.0);hold on
plot(T_Q_End_4p5_w,'o-m','linewi',1.0); hold on 
plot(T_Q_End_8p5_w,'o-g','linewi',1.0);hold on

for i=1:45
if S_Q_hist_w(i)==1
       plot(P1(i),T_Q_hist_w(i),'*k','linewi',1.0); hold on
end
if S_Q_Mid_4p5_w(i)==1
        plot(P1(i),T_Q_Mid_4p5_w(i),'*k','linewi',1.0); hold on
end
if S_Q_Mid_8p5_w(i)==1
        plot(P1(i),T_Q_Mid_8p5_w(i),'*k','linewi',1.0); hold on
end


if S_Q_End_4p5_w(i)==1
        plot(P1(i),T_Q_End_4p5_w(i),'*k','linewi',1.0); hold on
end
if S_Q_End_8p5_w(i)==1
        plot(P1(i),T_Q_End_8p5_w(i),'*k','linewi',1.0); hold on
end
end

set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',2,'FontWeight','Bold');
title('Winter LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Trend (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
% Summer
P1=1:45;
plot(T_Q_hist_s,'o-r','linewi',1.0); hold on 
plot(T_Q_Mid_4p5_s,'o-b','linewi',1.0);hold on
plot(T_Q_Mid_8p5_s,'o-c','linewi',1.0);hold on
plot(T_Q_End_4p5_s,'o-m','linewi',1.0); hold on 
plot(T_Q_End_8p5_s,'o-g','linewi',1.0);hold on

for i=1:45
if S_Q_hist_s(i)==1
       plot(P1(i),T_Q_hist_s(i),'*k','linewi',1.0); hold on
end
if S_Q_Mid_4p5_s(i)==1
        plot(P1(i),T_Q_Mid_4p5_s(i),'*k','linewi',1.0); hold on
end
if S_Q_Mid_8p5_s(i)==1
        plot(P1(i),T_Q_Mid_8p5_s(i),'*k','linewi',1.0); hold on
end


if S_Q_End_4p5_s(i)==1
        plot(P1(i),T_Q_End_4p5_s(i),'*k','linewi',1.0); hold on
end
if S_Q_End_8p5_s(i)==1
        plot(P1(i),T_Q_End_8p5_s(i),'*k','linewi',1.0); hold on
end
end
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',2,'FontWeight','Bold');
title('Summer LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Trend (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


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
Q1_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];

L=C2;
Q2_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];

L=C3;
Q3_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];

L=C4;
Q4_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
L=C5;
Q5_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
L=C6;
Q6_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
L=C7;
Q7_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
L=C8;
Q8_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
L=C9;
Q9_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
L=C10;
Q10_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
L=C11;
Q11_a=[nanmean(nanmean(T_Q_hist_a(:,L))) nanmean(nanmean(T_Q_Mid_4p5_a(:,L))) nanmean(nanmean(T_Q_Mid_8p5_a(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_a(:,L))) nanmean(nanmean(T_Q_End_8p5_a(:,L)))];
T_Q_a=[Q1_a;Q2_a;Q3_a;Q4_a;Q5_a;Q6_a;Q7_a;Q8_a;Q9_a;Q10_a;Q11_a];

%% Winter average
L=C1;
Q1_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];

L=C2;
Q2_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];

L=C3;
Q3_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];

L=C4;
Q4_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
L=C5;
Q5_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
L=C6;
Q6_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
L=C7;
Q7_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
L=C8;
Q8_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
L=C9;
Q9_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
L=C10;
Q10_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
L=C11;
Q11_w=[nanmean(nanmean(T_Q_hist_w(:,L))) nanmean(nanmean(T_Q_Mid_4p5_w(:,L))) nanmean(nanmean(T_Q_Mid_8p5_w(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_w(:,L))) nanmean(nanmean(T_Q_End_8p5_w(:,L)))];
T_Q_w=[Q1_w;Q2_w;Q3_w;Q4_w;Q5_w;Q6_w;Q7_w;Q8_w;Q9_w;Q10_w;Q11_w];

%% Summer Average
L=C1;
Q1_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];

L=C2;
Q2_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];

L=C3;
Q3_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];

L=C4;
Q4_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
L=C5;
Q5_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
L=C6;
Q6_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
L=C7;
Q7_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
L=C8;
Q8_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
L=C9;
Q9_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
L=C10;
Q10_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
L=C11;
Q11_s=[nanmean(nanmean(T_Q_hist_s(:,L))) nanmean(nanmean(T_Q_Mid_4p5_s(:,L))) nanmean(nanmean(T_Q_Mid_8p5_s(:,L)))...
    nanmean(nanmean(T_Q_End_4p5_s(:,L))) nanmean(nanmean(T_Q_End_8p5_s(:,L)))];
T_Q_s=[Q1_s;Q2_s;Q3_s;Q4_s;Q5_s;Q6_s;Q7_s;Q8_s;Q9_s;Q10_s;Q11_s];

%% Annaual Bar graphs
y = [T_Q_a(1,1) T_Q_a(1,2) T_Q_a(1,3) T_Q_a(1,4) T_Q_a(1,5); ...
    T_Q_a(2,1) T_Q_a(2,2) T_Q_a(2,3) T_Q_a(2,4) T_Q_a(2,5);...
    T_Q_a(3,1) T_Q_a(3,2) T_Q_a(3,3) T_Q_a(3,4) T_Q_a(3,5);...
    T_Q_a(4,1) T_Q_a(4,2) T_Q_a(4,3) T_Q_a(4,4) T_Q_a(4,5);...
    T_Q_a(5,1) T_Q_a(5,2) T_Q_a(5,3) T_Q_a(5,4) T_Q_a(5,5);...
    T_Q_a(6,1) T_Q_a(6,2) T_Q_a(6,3) T_Q_a(6,4) T_Q_a(6,5);...
    T_Q_a(7,1) T_Q_a(7,2) T_Q_a(7,3) T_Q_a(7,4) T_Q_a(7,5);...
    T_Q_a(8,1) T_Q_a(8,2) T_Q_a(8,3) T_Q_a(8,4) T_Q_a(8,5);...
    T_Q_a(9,1) T_Q_a(9,2) T_Q_a(9,3) T_Q_a(9,4) T_Q_a(9,5);...
    T_Q_a(10,1) T_Q_a(10,2) T_Q_a(10,3) T_Q_a(10,4) T_Q_a(10,5);...
    T_Q_a(11,1) T_Q_a(11,2) T_Q_a(11,3) T_Q_a(11,4) T_Q_a(11,5)];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Annual LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%bar(y,'stacked')
%% Winter Bar graphs
y = [T_Q_w(1,1) T_Q_w(1,2) T_Q_w(1,3) T_Q_w(1,4) T_Q_w(1,5); ...
    T_Q_w(2,1) T_Q_w(2,2) T_Q_w(2,3) T_Q_w(2,4) T_Q_w(2,5);...
    T_Q_w(3,1) T_Q_w(3,2) T_Q_w(3,3) T_Q_w(3,4) T_Q_w(3,5);...
    T_Q_w(4,1) T_Q_w(4,2) T_Q_w(4,3) T_Q_w(4,4) T_Q_w(4,5);...
    T_Q_w(5,1) T_Q_w(5,2) T_Q_w(5,3) T_Q_w(5,4) T_Q_w(5,5);...
    T_Q_w(6,1) T_Q_w(6,2) T_Q_w(6,3) T_Q_w(6,4) T_Q_w(6,5);...
    T_Q_w(7,1) T_Q_w(7,2) T_Q_w(7,3) T_Q_w(7,4) T_Q_w(7,5);...
    T_Q_w(8,1) T_Q_w(8,2) T_Q_w(8,3) T_Q_w(8,4) T_Q_w(8,5);...
    T_Q_w(9,1) T_Q_w(9,2) T_Q_w(9,3) T_Q_w(9,4) T_Q_w(9,5);...
    T_Q_w(10,1) T_Q_w(10,2) T_Q_w(10,3) T_Q_w(10,4) T_Q_w(10,5);...
    T_Q_w(11,1) T_Q_w(11,2) T_Q_w(11,3) T_Q_w(11,4) T_Q_w(11,5)];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Winter LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Summer Bar graphs
y = [T_Q_s(1,1) T_Q_s(1,2) T_Q_s(1,3) T_Q_s(1,4) T_Q_s(1,5); ...
    T_Q_s(2,1) T_Q_s(2,2) T_Q_s(2,3) T_Q_s(2,4) T_Q_s(2,5);...
    T_Q_s(3,1) T_Q_s(3,2) T_Q_s(3,3) T_Q_s(3,4) T_Q_s(3,5);...
    T_Q_s(4,1) T_Q_s(4,2) T_Q_s(4,3) T_Q_s(4,4) T_Q_s(4,5);...
    T_Q_s(5,1) T_Q_s(5,2) T_Q_s(5,3) T_Q_s(5,4) T_Q_s(5,5);...
    T_Q_s(6,1) T_Q_s(6,2) T_Q_s(6,3) T_Q_s(6,4) T_Q_s(6,5);...
    T_Q_s(7,1) T_Q_s(7,2) T_Q_s(7,3) T_Q_s(7,4) T_Q_s(7,5);...
    T_Q_s(8,1) T_Q_s(8,2) T_Q_s(8,3) T_Q_s(8,4) T_Q_s(8,5);...
    T_Q_s(9,1) T_Q_s(9,2) T_Q_s(9,3) T_Q_s(9,4) T_Q_s(9,5);...
    T_Q_s(10,1) T_Q_s(10,2) T_Q_s(10,3) T_Q_s(10,4) T_Q_s(10,5);...
    T_Q_s(11,1) T_Q_s(11,2) T_Q_s(11,3) T_Q_s(11,4) T_Q_s(11,5)];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Historical','Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Summer LST Trend','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% LST Change plots
% Plot the line graph of all seasons
% Annual
plot(abs(nanmean(Q_Mid_4p5_a,1))-abs(nanmean(Q_hist_a,1)),'-b','linewi',1.5);hold on
plot(abs(nanmean(Q_Mid_8p5_a,1))-abs(nanmean(Q_hist_a,1)),'-c','linewi',1.5);hold on
plot(abs(nanmean(Q_End_4p5_a,1))-abs(nanmean(Q_hist_a,1)),'-k','linewi',1.5); hold on 
plot(abs(nanmean(Q_End_8p5_a,1))-abs(nanmean(Q_hist_a,1)),'-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',2,'FontWeight','Bold');
title('Annual LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Change(m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
% Winter
plot(abs(nanmean(Q_Mid_4p5_w,1))-abs(nanmean(Q_hist_w,1)),'-b','linewi',1.5);hold on
plot(abs(nanmean(Q_Mid_8p5_w,1))-abs(nanmean(Q_hist_w,1)),'-c','linewi',1.5);hold on
plot(abs(nanmean(Q_End_4p5_w,1))-abs(nanmean(Q_hist_w,1)),'-k','linewi',1.5); hold on 
plot(abs(nanmean(Q_End_8p5_w,1))-abs(nanmean(Q_hist_w,1)),'-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',2,'FontWeight','Bold');
title('Winter LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Change(m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
% Summer
plot(abs(nanmean(Q_Mid_4p5_s,1))-abs(nanmean(Q_hist_s,1)),'-b','linewi',1.5);hold on
plot(abs(nanmean(Q_Mid_8p5_s,1))-abs(nanmean(Q_hist_s,1)),'-c','linewi',1.5);hold on
plot(abs(nanmean(Q_End_4p5_s,1))-abs(nanmean(Q_hist_s,1)),'-k','linewi',1.5); hold on 
plot(abs(nanmean(Q_End_8p5_s,1))-abs(nanmean(Q_hist_s,1)),'-m','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:3:45)
% xlim([points(1) points(47)])
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','north','NumColumns',2,'FontWeight','Bold');
title('Summer LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST Change(m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Change from past to future
% Historical
clc; clear all; close all;


load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_2.mat')

Mid_4p5_a=abs(nanmean(Q_Mid_4p5_a,1))-abs(nanmean(Q_hist_a,1));
Mid_8p5_a=abs(nanmean(Q_Mid_8p5_a,1))-abs(nanmean(Q_hist_a,1));
End_4p5_a=abs(nanmean(Q_End_4p5_a,1))-abs(nanmean(Q_hist_a,1));
End_8p5_a=abs(nanmean(Q_End_8p5_a,1))-abs(nanmean(Q_hist_a,1));

Mid_4p5_w=abs(nanmean(Q_Mid_4p5_w,1))-abs(nanmean(Q_hist_w,1));
Mid_8p5_w=abs(nanmean(Q_Mid_8p5_w,1))-abs(nanmean(Q_hist_w,1));
End_4p5_w=abs(nanmean(Q_End_4p5_w,1))-abs(nanmean(Q_hist_w,1));
End_8p5_w=abs(nanmean(Q_End_8p5_w,1))-abs(nanmean(Q_hist_w,1));

Mid_4p5_s=abs(nanmean(Q_Mid_4p5_s,1))-abs(nanmean(Q_hist_s,1));
Mid_8p5_s=abs(nanmean(Q_Mid_8p5_s,1))-abs(nanmean(Q_hist_s,1));
End_4p5_s=abs(nanmean(Q_End_4p5_s,1))-abs(nanmean(Q_hist_s,1));
End_8p5_s=abs(nanmean(Q_End_8p5_s,1))-abs(nanmean(Q_hist_s,1));

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
Q1_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];

L=C2;
Q2_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];

L=C3;
Q3_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];

L=C4;
Q4_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
L=C5;
Q5_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
L=C6;
Q6_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
L=C7;
Q7_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
L=C8;
Q8_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
L=C9;
Q9_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
L=C10;
Q10_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
L=C11;
Q11_a=[nanmean(nanmean(Mid_4p5_a(:,L))) nanmean(nanmean(Mid_8p5_a(:,L)))...
    nanmean(nanmean(End_4p5_a(:,L))) nanmean(nanmean(End_8p5_a(:,L)))];
a=[Q1_a;Q2_a;Q3_a;Q4_a;Q5_a;Q6_a;Q7_a;Q8_a;Q9_a;Q10_a;Q11_a];

%% Winter average
L=C1;
Q1_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];

L=C2;
Q2_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];

L=C3;
Q3_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];

L=C4;
Q4_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
L=C5;
Q5_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
L=C6;
Q6_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
L=C7;
Q7_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
L=C8;
Q8_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
L=C9;
Q9_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
L=C10;
Q10_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
L=C11;
Q11_w=[nanmean(nanmean(Mid_4p5_w(:,L))) nanmean(nanmean(Mid_8p5_w(:,L)))...
    nanmean(nanmean(End_4p5_w(:,L))) nanmean(nanmean(End_8p5_w(:,L)))];
w=[Q1_w;Q2_w;Q3_w;Q4_w;Q5_w;Q6_w;Q7_w;Q8_w;Q9_w;Q10_w;Q11_w];

%% Summer Average
L=C1;
Q1_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];

L=C2;
Q2_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];

L=C3;
Q3_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];

L=C4;
Q4_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
L=C5;
Q5_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
L=C6;
Q6_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
L=C7;
Q7_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
L=C8;
Q8_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
L=C9;
Q9_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
L=C10;
Q10_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
L=C11;
Q11_s=[nanmean(nanmean(Mid_4p5_s(:,L))) nanmean(nanmean(Mid_8p5_s(:,L)))...
    nanmean(nanmean(End_4p5_s(:,L))) nanmean(nanmean(End_8p5_s(:,L)))];
s=[Q1_s;Q2_s;Q3_s;Q4_s;Q5_s;Q6_s;Q7_s;Q8_s;Q9_s;Q10_s;Q11_s];

%% Annual Change Bar graphs
y = [a(1,1) a(1,2) a(1,3) a(1,4);...
    a(2,1) a(2,2) a(2,3) a(2,4);...
    a(3,1) a(3,2) a(3,3) a(3,4);...
    a(4,1) a(4,2) a(4,3) a(4,4);...
    a(5,1) a(5,2) a(5,3) a(5,4);...
    a(6,1) a(6,2) a(6,3) a(6,4);...
    a(7,1) a(7,2) a(7,3) a(7,4);...
    a(8,1) a(8,2) a(8,3) a(8,4);...
    a(9,1) a(9,2) a(9,3) a(9,4);...
    a(10,1) a(10,2) a(10,3) a(10,4);...
    a(11,1) a(11,2) a(11,3) a(11,4);];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Annual LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%bar(y,'stacked')
%% Wiinter Change Bar graphs
y = [w(1,1) w(1,2) w(1,3) w(1,4); ...
    w(2,1) w(2,2) w(2,3) w(2,4);...
    w(3,1) w(3,2) w(3,3) w(3,4);...
    w(4,1) w(4,2) w(4,3) w(4,4);...
    w(5,1) w(5,2) w(5,3) w(5,4);...
    w(6,1) w(6,2) w(6,3) w(6,4);...
    w(7,1) w(7,2) w(7,3) w(7,4);...
    w(8,1) w(8,2) w(8,3) w(8,4);...
    w(9,1) w(9,2) w(9,3) w(9,4);...
    w(10,1) w(10,2) w(10,3) w(10,4);...
    w(11,1) w(11,2) w(11,3) w(11,4);];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Winter LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Summer Change Bar graphs
y = [s(1,1) s(1,2) s(1,3) s(1,4);...
    s(2,1) s(2,2) s(2,3) s(2,4);...
    s(3,1) s(3,2) s(3,3) s(3,4);...
    s(4,1) s(4,2) s(4,3) s(4,4);...
    s(5,1) s(5,2) s(5,3) s(5,4);...
    s(6,1) s(6,2) s(6,3) s(6,4);...
    s(7,1) s(7,2) s(7,3) s(7,4);...
    s(8,1) s(8,2) s(8,3) s(8,4);...
    s(9,1) s(9,2) s(9,3) s(9,4);...
    s(10,1) s(10,2) s(10,3) s(10,4);...
    s(11,1) s(11,2) s(11,3) s(11,4);];

X = categorical({'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
X = reordercats(X,{'P1-P4','P5-P8','P9-P12','P13-P17','P18-P23','P24-P26','P27-P29'...
    ,'P30-P31','P32-P34','P35-P38','P39-P45'});
%histogram(y)
h=bar(X,y);
set(gca,'xticklabel',X.','FontWeight','Bold');
%xticks(1:3:45)
legend('Mid 4.5','Mid 8.5','End 4.5','End 8.5','Location','southeast','NumColumns',2,'FontWeight','Bold');
title('Summer LST Change','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('LST (m^3 y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');



%% Calculate the direction of the coastline
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat')

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
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction.mat')

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
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_2.mat')
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\arrow_points.mat')
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction_uniform.mat')
for i=1:45
    if True_coastline_direction(i)<0
        angg(i)=True_coastline_direction(i)+360;
    else
        angg(i)=90-True_coastline_direction(i);
    end
end
    
%% Orientation of the coastline
% Plot hs map of Annual
%lon_f1=lon_f-0.3; lat_f1=lat_f-0.5;
% cmin=-0.005; cmax=0.005; int=0.0005; n= round((cmax-cmin)/int);
cmin=0; cmax=360; int=10; n= round((cmax-cmin)/int);
%cmin=-90; cmax=90; int=10; n= round((cmax-cmin)/int);
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
title('Annaual LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%%
for i=1:45
    if i==1 | i<=8
        lon_f1(i)=lon_f(i)-0.3; lat_f1(i)=lat_f(i);
    elseif i==9 | i<=11
        lon_f1(i)=lon_f(i)-0.1; lat_f1(i)=lat_f(i)-0.2;
    elseif i==12
        lon_f1(i)=lon_f(i)+0.25; lat_f1(i)=lat_f(i)-0.45;
    elseif i==23
        lon_f1(i)=lon_f(i)+0.15; lat_f1(i)=lat_f(i)-0.3;
    elseif i==38
        lon_f1(i)=lon_f(i)+0.25; lat_f1(i)=lat_f(i)-0.3;
    elseif lon_f(i)<=0 & lat_f(i)>=0
        lon_f1(i)=lon_f(i); lat_f1(i)=lat_f(i)-0.3;
    elseif lon_f(i)>=0 & lat_f(i)>=0 | lon_f(i)<=5 | lat_f(i)>=0
        lon_f1(i)=lon_f(i); lat_f1(i)=lat_f(i)-0.3;
    else
        lon_f1(i)=lon_f(i); lat_f1(i)=lat_f(i);
    end
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot annual LST average

% Historical
% Plot hs map of Annual
%lon_f1=lon_f-0.3; lat_f1=lat_f-0.5;
% cmin=-0.005; cmax=0.005; int=0.0005; n= round((cmax-cmin)/int);
cmin=-9*10^5; cmax=9*10^5; int=0.5*10^5; n= round((cmax-cmin)/int);
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
%m_quiver(lon_f1,lat_f1,U,V,.09,'linewidth',4, 'color',[0.5 0.6 0.7]); 
m_vec(15,lon_f1,lat_f1,U,V,z,'headlength',3,'headangle',50,'shaftwidth',2);
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
%cb=colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
%set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
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

