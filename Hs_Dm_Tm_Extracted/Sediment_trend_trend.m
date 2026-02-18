% Load selected ensemble data: hist
clc;clear;
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Sediment_transport_ERA5.mat')

%% Timeseries Mid21C
ERA5=nanmean(abs(Q_ERA5),2);
Hist=nanmean(abs(Q_hist),2);
bias_hist=ERA5(1:27)-Hist;



figure
Year_h=1979:2005;
Year_e=1979:2005;
plot(Year_h,Hist,'o-r'); hold on
plot(Year_e(1:27),ERA5(1:27),'o-b');hold on
plot(Year_e(1:27),bias_hist(1:27),'o-k');hold on
xlim([1979 2005])
legend('Historical','ERA5','bias','Location','south','NumColumns',3);
title('Longshore Sediment Transport for GoG between 1979-2005','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Longshore sediment transport (m^3 per year)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%%
Mid21C_4p5=nanmean(abs(Q_Mid_4p5),2);
Mid21C_8p5=nanmean(abs(Q_Mid_8p5),2);
bias_mid=Mid21C_4p5-Mid21C_8p5;

Years=2026:2045;
figure
plot(Years,Mid21C_4p5,'o-r');hold on 
plot(Years,Mid21C_8p5,'o-b');hold on
plot(Years,bias_mid,'o-k');
xlim([2026 2045])
legend('Mid21C RCP4.5','Mid21C RCP8.5','Location','south','NumColumns',3);
title('Longshore Sediment Transport for GoG between 2026-2045','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Longshore sediment transport (m^3 per year)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
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
%% Timeseries End21C
End21C_4p5=nanmean(Q_End_4p5_,1);
End21C_8p5=nanmean(Q_End_8p5_,1);

%%
End21C_4p5=nanmean(abs(Q_End_4p5),2);
End21C_8p5=nanmean(abs(Q_End_8p5),2);
bias_end=End21C_4p5-End21C_8p5;

Years=2081:2100;
figure
plot(Years,End21C_4p5,'o-r');hold on 
plot(Years,End21C_8p5,'o-b');hold on
plot(Years,bias_end,'o-k');
xlim([2081 2100])
legend('End21C RCP4.5','End21C RCP8.5','Location','south','NumColumns',3);
title('Longshore Sediment Transport for GoG between 2081-2100','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Longshore sediment transport (m^3 per year)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%
z=nanmean(Q_hist_,2);
tr = trend(Q_hist_',1); %tr=tr*365.25;
significant = mann_kendall(Q_hist_'); % (may take a second)

cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);

figure %('Color',[0.6 0.6 0.6]) 
h =worldmap([-20.5 20.5],[-20.5 25]);
scatterm(lat_f,lon_f,50,z,'filled');%colorbar; Q(10,:)
%patchm([0.6 0.6 0.6]) 
colormap(jet(n)); 
p = findobj(h,'type','patch'); % Find background
%set(p,'FaceColor',[0.6 0.6 0.6]); 
hold on
bordersm
labelbordersm
cb =colorbar;
%clb=colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax);
caxis([cmin cmax]);
set(get(cb,'label'),'string','Longshore sediment transport (x10^2 m^3 per year)');

%% Change
Mid_4p5=nanmean(Q_Mid_4p5_,2)-nanmean(Q_hist_,2);
Mid_8p5=nanmean(Q_Mid_8p5_,2)-nanmean(Q_hist_,2);

End_4p5=nanmean(Q_End_4p5_,2)-nanmean(Q_hist_,2);
End_8p5=nanmean(Q_End_8p5_,2)-nanmean(Q_hist_,2);

%%
%% 
ind=find(lon_f>=-2 & lon_f<=7 & lat_f>=4 & lat_f<=7);
BoB_Q_ERA5=Q_ERA5(1:27,ind);
BoB_Q_hist=Q_hist(:,ind);
BoB_lon=lon_f(ind);
BoB_lat=lat_f(ind);

aaa=nanmean(nanmean(BoB_Q_hist,1));
aab=nanmean(nanmean(BoB_Q_ERA5,1));

figure;scatter(BoB_lon,BoB_lat,50,nanmean(BoB_Q_ERA5,1)','filled');...
    borders;colormap(jet); colorbar;caxis([-14*10^5 8*10^5])
%%
ind=find(lon_f>=-7.5 & lon_f<=20 & lat_f>=-1.5 & lat_f<=20);
GoG_Q_ERA5=Q_ERA5(1:27,ind);
GoG_Q_hist=Q_hist(:,ind);
GoG_lon=lon_f(ind);
GoG_lat=lat_f(ind);
figure;scatter(GoG_lon,GoG_lat,50,nanmean(GoG_Q_hist,1)','filled');...
    borders;colormap(jet); colorbar;caxis([-14*10^5 8*10^5])
%%
ind=find(lon_f>=-7.5 & lon_f<=20 & lat_f>=-1.5 & lat_f<=20);
GoG_Q_ERA5=Q_ERA5(1:27,ind);
GoG_Q_hist=Q_hist(:,ind);
bias_ERA5_hist=abs(GoG_Q_ERA5)-abs(GoG_Q_hist);

GoG_Q_Mid_4p5=Q_Mid_4p5(:,ind);
GoG_Q_Mid_8p5=Q_Mid_8p5(:,ind);

GoG_Q_End_4p5=Q_End_4p5(:,ind);
GoG_Q_End_8p5=Q_End_8p5(:,ind);

GoG_lon=lon_f(ind);
GoG_lat=lat_f(ind);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(GoG_Q_hist,1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Average Longshore Sediment Transport between 1979-2005 in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(GoG_Q_Mid_4p5,1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Average Longshore Sediment Transport between 2026-2045 (RCP 4.5) in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(GoG_Q_Mid_8p5,1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Average Longshore Sediment Transport between 2026-2045 (RCP 8.5) in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(GoG_Q_End_4p5,1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Average Longshore Sediment Transport between 2081-2100 (RCP 4.5) in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(GoG_Q_End_8p5,1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Average Longshore Sediment Transport between 2081-2100 (RCP 8.5) in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(bias_ERA5_hist,1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-2.5*10^4; cmax=0;%2.5*10^4; 
int=0.1*10^4; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Bias of ERA5 and ENSEMBLE LST between 1979-2005 in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(abs(GoG_Q_Mid_4p5),1)-nanmean(abs(GoG_Q_hist),1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-0.5*10^4; cmax=1.5*10^4;%2.5*10^4; 
int=0.1*10^4; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Change of LST between 2005-2045 (RCP 4.5) in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(abs(GoG_Q_End_8p5),1)-nanmean(abs(GoG_Q_hist),1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-0.5*10^4; cmax=1.5*10^4;%2.5*10^4; 
int=0.1*10^4; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Change of LST between 2005-2100 (RCP 8.5) in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot annual LST average
z=nanmean(abs(GoG_Q_End_4p5),1)-nanmean(abs(GoG_Q_hist),1);
% u = z.*cos(z);
% v = z.*sin(z);
cmin=-0.5*10^4; cmax=1.5*10^4;%2.5*10^4; 
int=0.1*10^4; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
figure
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(GoG_lon,GoG_lat,100,z,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.5);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))

m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'Côte d''Ivoire','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 

m_text(0,2.5,'Gulf of Guinea','FontSize',20,'Rotation', 0,'color','b','fontw','bold') 

%m_text(-9.2,5.5,'Liberia','Rotation',-30,'color',[0.6 0.6 0.6])
%m_text(-6.5,5.6,'C\hat{o}te d''Ivoire','Rotation',0)
%m_text(-6,5.4,'Côte d''Ivoire','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(-1,5.7,'Ghana','Rotation',20,'color',[0.6 0.6 0.6])
%m_text(0.8,6.5,'Togo','Rotation',15,'color',[0.6 0.6 0.6])
%m_text(1.8,6.7,'Benin','Rotation',5,'color',[0.6 0.6 0.6])
%m_text(4.2,6.8,'Nigeria','Rotation',-25,'color',[0.6 0.6 0.6])
m_text(5,5,'Niger Delta','Rotation',-60,'color','b','fontw','bold')

axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Change of LST between 2005-2100 (RCP 4.5) in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0
