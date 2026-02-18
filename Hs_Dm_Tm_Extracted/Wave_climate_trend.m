
%Load selected ensemble data
clc;clear;

load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE_ERA5_yearly.mat')
%% Timeseries HS
ERA5=nanmean(HS_ERA5_,1);
Hist=nanmean(HS_hist_,1);
bias=ERA5(1:27)-Hist;

Mid21C_4p5=nanmean(HS_Mid_4p5_,1);
Mid21C_8p5=nanmean(HS_Mid_8p5_,1);
End21C_4p5=nanmean(HS_End_4p5_,1);
End21C_8p5=nanmean(HS_End_8p5_,1);


figure
Year_h=1979:2005;
Year_e=1979:2005;
plot(Year_h,Hist,'o-r'); hold on
plot(Year_e(1:27),ERA5(1:27),'>-b');hold on
plot(Year_e(1:27),bias(1:27),'<-k');hold on
xlim([1979 2005])
legend('Historical','ERA5','bias','Location','south','NumColumns',3);
title('Hs for GoG between 1979-2005','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

figure
Years=2026:2045;
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'>-b');hold on
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Hs for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


figure
Years=2081:2100;
plot(Years,End21C_4p5,'o-r');hold on 
plot(Years,End21C_8p5,'>-b');hold on
xlim([2081 2100])
legend('End21C RCP4.5','End21C RCP8.5','Location','south','NumColumns',3);
title('Hs for GoG between 2081-2100','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Timeseries TM
ERA5=nanmean(TM_ERA5_,1);
Hist=nanmean(TM_hist_,1);
bias=ERA5(1:27)-Hist;

Mid21C_4p5=nanmean(TM_Mid_4p5_,1);
Mid21C_8p5=nanmean(TM_Mid_8p5_,1);
End21C_4p5=nanmean(TM_End_4p5_,1);
End21C_8p5=nanmean(TM_End_8p5_,1);

Year_h=1979:2005;
Year_e=1979:2005;
plot(Year_h,Hist,'o-r'); hold on
plot(Year_e(1:27),ERA5(1:27),'>-b');hold on
plot(Year_e(1:27),bias(1:27),'<-k');hold on
xlim([1979 2005])
legend('Historical','ERA5','bias','Location','south','NumColumns',3);title('Tm for GoG between 1979-2005','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm (s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

figure
Years=2026:2045;
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'>-b');hold on
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Tm for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm (s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


figure
Years=2081:2100;
plot(Years,End21C_4p5,'o-r');hold on 
plot(Years,End21C_8p5,'>-b');hold on
xlim([2081 2100])
legend('End21C RCP4.5','End21C RCP8.5','Location','south','NumColumns',3);
title('Tm for GoG between 2081-2100','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm (s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Timeseries DM
ERA5=nanmean(DM_ERA5_,1);
Hist=nanmean(DM_hist_,1);
bias=ERA5(1:27)-Hist;

Mid21C_4p5=nanmean(DM_Mid_4p5_,1);
Mid21C_8p5=nanmean(DM_Mid_8p5_,1);
End21C_4p5=nanmean(DM_End_4p5_,1);
End21C_8p5=nanmean(DM_End_8p5_,1);

Year_h=1979:2005;
Year_e=1979:2005;
plot(Year_h,Hist,'o-r'); hold on
plot(Year_e(1:27),ERA5(1:27),'>-b');hold on
plot(Year_e(1:27),bias(1:27),'<-k');hold on
xlim([1979 2005])
legend('Historical','ERA5','bias','Location','south','NumColumns',3);title('Dm for GoG between 1979-2005','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

figure
Years=2026:2045;
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'>-b');hold on
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Dm for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


figure
Years=2081:2100;
plot(Years,End21C_4p5,'o-r');hold on 
plot(Years,End21C_8p5,'>-b');hold on
xlim([2081 2100])
legend('End21C RCP4.5','End21C RCP8.5','Location','south','NumColumns',3);
title('Dm for GoG between 2081-2100','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%%
figure
Years=2026:2045;
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'>-b');hold on
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Longshore Sediment Transport for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Longshore sediment transport (m^3 per year)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
plot(Years,Hist,'o-r');
xlim([1979 2005])
legend('Historical','Location','south','NumColumns',3);
title('Hs for GoG between 1979-2005','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

figure
Years=2026:2045;
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'>-b');hold on
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Hs for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


figure
Years=2081:2100;
plot(Years,End21C_4p5,'o-r');hold on 
plot(Years,End21C_8p5,'>-b');hold on
xlim([2081 2100])
legend('End21C RCP4.5','End21C RCP8.5','Location','south','NumColumns',3);
title('Hs for GoG between 2081-2100','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Timeseries TM
Hist=nanmean(TM_hist_,1);
Mid21C_4p5=nanmean(TM_Mid_4p5_,1);
Mid21C_8p5=nanmean(TM_Mid_8p5_,1);
End21C_4p5=nanmean(TM_End_4p5_,1);
End21C_8p5=nanmean(TM_End_8p5_,1);

figure
Years=1979:2005;
plot(Years,Hist,'o-r');
xlim([1979 2005])
legend('Historical','Location','south','NumColumns',3);
title('Tm for GoG between 1979-2005','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm (s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

figure
Years=2026:2045;
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'>-b');hold on
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Tm for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm (s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


figure
Years=2081:2100;
plot(Years,End21C_4p5,'o-r');hold on 
plot(Years,End21C_8p5,'>-b');hold on
xlim([2081 2100])
legend('End21C RCP4.5','End21C RCP8.5','Location','south','NumColumns',3);
title('Tm for GoG between 2081-2100','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm (s)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Timeseries DM
Hist=nanmean(DM_hist_,1);
Mid21C_4p5=nanmean(DM_Mid_4p5_,1);
Mid21C_8p5=nanmean(DM_Mid_8p5_,1);
End21C_4p5=nanmean(DM_End_4p5_,1);
End21C_8p5=nanmean(DM_End_8p5_,1);

figure
Years=1979:2005;
plot(Years,Hist,'o-r');
xlim([1979 2005])
legend('Historical','Location','south','NumColumns',3);
title('Dm for GoG between 1979-2005','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

figure
Years=2026:2045;
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'>-b');hold on
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Dm for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


figure
Years=2081:2100;
plot(Years,End21C_4p5,'o-r');hold on 
plot(Years,End21C_8p5,'>-b');hold on
xlim([2081 2100])
legend('End21C RCP4.5','End21C RCP8.5','Location','south','NumColumns',3);
title('Dm for GoG between 2081-2100','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


