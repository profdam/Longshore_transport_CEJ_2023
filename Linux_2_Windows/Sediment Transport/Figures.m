% Historical
clc; clear all; close all;

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat')

load('D:\Review Papers\Extreme Waves\Extreme/GEBCO_bathymetry_GoG.mat')

%%
points=["P1", "", "P3", "", "P5", "", "P7", "", "P9", "", "P11", "", "P13", "",...
    "P15", "", "P17", "", "P19", "", "P21", "", "P23", "", "P25", "", "P27", ""...
    "P29", "", "P31", "", "P33", "", "P35", "", "P37", "", "P39", "", "P41", ""...
    "P43", "", "P45"];

%%
% 
% points=["P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "P14",...
%     "P15", "P16", "P17", "P18", "P19", "P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27", "P28"...
%     "P29", "P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37", "P38", "P39", "P40", "P41", "P42"...
%     "P43", "P44", "P45"];
%%
for i=1:45
    if i<=11 & i>=10
lon_f1(i)=lon_f(i)-0.5; lat_f1(i)=lat_f(i)-0.5;
    elseif i<=9
        lon_f1(i)=lon_f(i)-0.4; lat_f1(i)=lat_f(i)-0.5;
    elseif i==29
        lon_f1(i)=lon_f(i)-0.1; lat_f1(i)=lat_f(i)-0.8;
    else
        lon_f1(i)=lon_f(i)-0.3; lat_f1(i)=lat_f(i)-0.8;
    end
end
%load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\arrow_points.mat', 'lat_f1', 'lon_f1')
%% Map of GoG
% cmin=-0.005; cmax=0.005; int=0.0005; n= round((cmax-cmin)/int);
figure
m_proj('Mercator','longitude',[-8.5 15.5],'latitude',[-2.5 15.5]);
m_gshhs_c('patch',[0.5 0.5 0.5],'linewidth',2,'edgecolor','c');
% m_coast('patch',[.7 .7 .7],'edgecolor','r');
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','b','linewidth',2);
%labelbordersm
hold on
%m_names
%m_contourf(Xlong,Ylat,dep',[-6000:250:-1000 -950:250:-100 -20:5:0],'edgecolor','none');
m_contourf(Xlong,Ylat,dep',[-6000:100:-1000 -1000:50:-200 -200:10:0],'edgecolor','none');
%m_contourf(Xlong,Ylat,dep',[-6000 -5500 -5000 -4500 -4000 -3500 -3000 -2500 -2000 -1500 -1000 -500 -200 -150 -100 -50 0],'edgecolor','none');
% [CS,H] =m_contourf(Xlong,Ylat,dep',[-6000:1000:-1000 -950:250:-100 -20:5:0],'edgecolor','k');
m_scatter(lon_f,lat_f,50,'filled','MarkerFaceColor','m'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
% h=m_quiver(-5,-1,0,2,'LineWidth',3,'Color','k','MaxHeadSize',10);
% m_text(-5.2,-1.2,'N','Rotation', 0,'color','k','fontw','bold','FontSize',15) 
m_northarrow(-5,2,2,'type',4,'linewi',.7);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))
m_text(lon_f1,lat_f1,points,'Rotation', 75,'color','k','fontw','bold','FontSize',12)


m_text(2.3,6.7,'Cotonou','Rotation', 90,'color','k','fontw','bold') 
% m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.83,10,'Benin','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.7,'Lagos','Rotation', 90,'color','k','fontw','bold') 
m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,8.1,'Benue River','Rotation', 0,'color','k','fontw','bold') 
m_text(4.5,11,'Niger River','Rotation', -45,'color','k','fontw','bold') 
m_text(5.6,5,'Niger Delta','Rotation', 0,'color','k','fontw','bold') 
m_text(7,10,'Nigeria','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
% m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
% m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
% m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.5,'Lome','Rotation', 90,'color','k','fontw','bold') 
m_text(0.5,9,'Togo','FontSize',11,'Rotation', 0,'color','k','fontw','bold') 

m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
% m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
% m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2,8,'Lake Volta','Rotation', 0,'color','k','fontw','bold') 
m_text(-2,10,'Ghana','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 

m_text(-7,9,'C\^ote d''Ivoire','interpreter','latex','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(-3.1,5.2,'Abidjan','Rotation',125,'color','k','fontw','bold')
m_text(-7.9,4.5,'C. Palmas','Rotation',90,'color','k','fontw','bold')
% m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
m_text(-5.35,5.3,'Fresco','Rotation', 90,'color','k','fontw','bold') 
m_text(-6.3,8,'lac de kossou','Rotation', 0,'color','k','fontw','bold') 
m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
% m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 

m_text(9.9,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(10.2,4.0,'Douala','Rotation',-60,'color','k','fontw','bold')
m_text(10,5,'Cameroon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.7,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',13,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.8,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,-1,'C. Lopez','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(-2,2.5,'Gulf of Guinea','FontSize',25,'Rotation', 0,'color','k','fontw','bold') 
axis equal tight
cmin=-6000; cmax=0; int=200; n= (cmax-cmin)/int;
%colormap(jet(n)); 
colormap([m_colmap('water',200);flipud(m_colmap('bland',128))]);
cb=colorbar('ytick',cmin:1*int:cmax); %,'Location','west'
cb.TickLabelInterpreter= 'latex'
caxis([cmin cmax])
set(get(cb,'label'),'string','Depth (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
cb.TickLabels = strrep(cb.TickLabels,'-','$-$');
%colormap([m_colmap('gland',128);m_colmap('water',128)]);
%colormap([ m_colmap('gland',20)]); 
%ax=m_contfbar(1,[.5 .8],CS,CH);
%[cb]=colorbar('ytick',cmin:1*int:cmax); %,'Location','west'
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
% caxis([cmin cmax])
% %set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Depth (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
title('Map of Gulf of Guinea','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% Plot unstructured grids
%load the unstrctured grids
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Unstructured_Traingles_nodes.mat')
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat')

% lon_f1=lon_f-0.3; lat_f1=lat_f-0.5;
% cmin=-0.005; cmax=0.005; int=0.0005; n= round((cmax-cmin)/int);
figure
m_gshhs_h('patch',[0.9 0.9 0.9],'linewidth',2,'edgecolor','c');
% m_coast('patch',[.7 .7 .7],'edgecolor','r');
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','b','linewidth',3);
%labelbordersm
hold on
m_triplot(lon, lat,T)
%m_scatter(lon_f,lat_f,50,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'fontweight','bold');
m_northarrow(-5,2,2,'type',4,'linewi',2.0);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))
%m_text(lon_f1,lat_f1,points,'Rotation', 75,'color','m','fontw','bold','FontSize',9)


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
m_text(-3.1,5.2,'Abidjan','Rotation',135,'color','k','fontw','bold')
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
%m_text(0,2.5,'Gulf of Guinea','FontSize',10,'Rotation', 0,'color','b','fontw','bold') 
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
%colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
%caxis([cmin cmax])
%set(gca,'ColorScale','log')
% set(get(cb,'label'),'string','Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
title('Unstructured Grids in the GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% Plot structured grids
%load the unstrctured grids
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\structured_grid_gog.mat')
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat')

% lon_f1=lon_f-0.3; lat_f1=lat_f-0.5;
% cmin=-0.005; cmax=0.005; int=0.0005; n= round((cmax-cmin)/int);
figure
m_gshhs_h('patch',[0.9 0.9 0.9],'linewidth',2,'edgecolor','c');
% m_coast('patch',[.7 .7 .7],'edgecolor','r');
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','b','linewidth',3);
%labelbordersm
hold on
m_rectangle(X,Y,W,H,1)
%m_scatter(lon_f,lat_f,50,'filled'); %shading flat;
%m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'fontweight','bold');
m_northarrow(-5,2,2,'type',4,'linewi',2.0);
%m_ruler([min(GoG_lon) max(GoG_lon)],min(GoG_lat))
%m_text(lon_f1,lat_f1,points,'Rotation', 75,'color','m','fontw','bold','FontSize',9)


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
m_text(-3.1,5.2,'Abidjan','Rotation',135,'color','k','fontw','bold')
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
%m_text(0,2.5,'Gulf of Guinea','FontSize',10,'Rotation', 0,'color','b','fontw','bold') 
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
%colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
%caxis([cmin cmax])
%set(gca,'ColorScale','log')
% set(get(cb,'label'),'string','Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
title('Unstructured Grids in the GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%% Plot timeries for comparing CMEMS and the ensembles
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'hs_cmems', 'hs_struct', 'hs_unstruct')


% points=["1979", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988",...
% "1989", "1990", "1991", "1992",...
%     "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005"];
% P=points(1:4:46);
points=["1979", "", "", "1982", "", "", "1985", "", "", "1988", "", "", "1991", "",...
"", "1994", "", "", "1997", "", "", "2000", "", "", "2003", "", "2005"];
%%
P=2002:2005;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the line graph of all against CMEMS
% figure(1)
%subplot(231)
plot(hs_cmems,'o-r','linewi',1.5); hold on 
plot(hs_struct,'>-b','linewi',1.5);hold on
plot(hs_unstruct,'x-k','linewi',1.5);hold on
%plot(end8p5_a,'<-k','linewi',1.5);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:12:48)
ax = gca; ax.FontSize = 12; ax.FontWeight='bold';  
% xlim([points(1) points(47)])
legend('CMEMS','Structured','Unstructured','Location','south','NumColumns',3,'FontWeight','Bold');
title('CMEMS','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%% Plot timeries for comparing coast_giard with the ensembles
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'Giardino_1979_2005_hs', 'hs_giard_struct', 'hs_giard_unstruct')


% points=["P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "P14",...
%     "P15", "P16", "P17", "P18", "P19", "P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27", "P28"...
%     "P29", "P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37", "P38", "P39", "P40", "P41", "P42"...
%     "P43", "P44", "P45", "P46"];
% P=points(1:4:46);
points=["1979", "", "", "1982", "", "", "1985", "", "", "1988", "", "", "1991", "",...
"", "1994", "", "", "1997", "", "", "2000", "", "", "2003", "", "2005"];

points=["1979", "", "", "", "1983", "", "", "", "1987", "",...
"", "1990", "", "",...
    "1993", "", "", "1996", "", "", "1999", "", "", "2002", "", "", "2005"];

%%
P=points;%(1:3:27);
%P=1979:1:2005;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the line graph of all against Giardino
% figure(1)
%subplot(231)
% plot(nanmean(Giardino_1979_2005_hs,1),'o-r','linewi',1.0); hold on 
% plot(hs_giard_struct,'>-b','linewi',1.0);hold on
% plot(hs_giard_unstruct,'x-m','linewi',1.0);hold on
%plot(end8p5_a,'<-k','linewi',1.5);hold on

plot(nanmean(Giardino_1979_2005_hs,1),'-r','linewi',1.0); hold on 
plot(hs_giard_struct,'-b','linewi',1.0);hold on
plot(hs_giard_unstruct,'-k','linewi',1.0);hold on
set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:12:324)
ax = gca; ax.FontSize = 12; ax.FontWeight='bold';  
xlim([1 324])
legend('coast\_giard','Structured','Unstructured','Location','south','NumColumns',3,'FontWeight','Bold');
title('coast\_giard','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

