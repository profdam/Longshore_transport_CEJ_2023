    
clc; clear
load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

%% Estimate correlation for LST and direction
corrcoef(nanmean(dm_co_hist_a,1),angg)
plot(nanmean(dm_co_hist_a,1),angg, '.r', 'MarkerSize',30)
%legend('Ann-Inc','Dry-Inc','Rain-Inc','Ann-Dm','Dry-Dm','Rain-Dm','Location','south','NumColumns',2,'FontWeight','Bold');
%title('Hs Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Incidence Angle (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Coastline Orientation (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


corrcoef(nanmean(Q_hist_a,1),angg)
plot(nanmean(Q_hist_a,1),angg, '.r', 'MarkerSize',30)
xlabel('LST (m^3y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Coastline Orientation (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

corrcoef(nanmean(Q_hist_a,1),nanmean(dm_co_hist_a,1))
plot(nanmean(Q_hist_a,1),nanmean(dm_co_hist_a,1), '.r', 'MarkerSize',30)
xlabel('LST (m^3y^-^1)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Incidence Angle (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%

WDIR=dm_of_hist_a(:);
WVHT=hs_of_hist_a(:);
    
%dir = WDIR*pi/180; %convert to radians
dir = (90-WDIR)*pi/180;
dat=[WVHT dir];
dat2=sortrows(dat);

heights=dat2(:,1);
dirs=dat2(:,2);

%create categorial values of waveheight
xn=10; % number of bins for wave heights
yn=10; %number of bins for direction
[N,Xedges,Yedges] = histcounts2(heights,dirs,[xn yn]);
%N=number of occurances at specific wave height and direction
%xedges= bin edges of wave heights
%yedges=bin edges of directions
%turn N into a probability 
ocur=sum(sum(N)); %number of occurances
probs=(N/ocur)*100; %probability of occurance as a percentage
polarhistogram('BinEdges',Yedges,'BinCounts',probs(1,:));
%ignore first row since it is 0 values
hold on

for i=3:size(probs,1)
fig=polarhistogram('BinEdges',Yedges,'BinCounts',probs(i,:));
end


% put the station name and location on the figure
%title('Significant Wave Height and Wave Direction');
thetaticks([0 90 180 270]);
thetaticklabels({'East','North','West','South'});
rtickformat('percentage');
legendCell = cellstr(num2str(Xedges(3:length(Xedges))', '%1.1f'));
lgd=legend(legendCell);
title(lgd,'Wave Height [meters]');

%%
clc; clear

load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\wave_climate_offshore_nearshore.mat')

% %% Calculate the eastward and northward components of the transport
% %load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction.mat')
% 
% U = sind(angg);
% V = cosd(angg);
% 
% % U1 = (U.*aaa)/abs(aaa);
% % V1 = (V.*aaa)/abs(aaa);
% 
% % U = sind(abcc_a(:,1));
% % V = cosd(abcc_a(:,1));

%%Generate locations to plot the arrows
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


% %% Load Sediment transport data
% load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\Sediment_transport_data_2.mat')
% load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\arrow_points.mat')
% load('D:\Review Papers\Sediment Transport\Linux_2_Windows\Sediment Transport\Scripts_data\coastline_direction_uniform.mat')
% for i=1:45
%     if True_coastline_direction(i)<0
%         angg(i)=True_coastline_direction(i)+360;
%     else
%         angg(i)=90-True_coastline_direction(i);
%     end
% end
    
%% Orientation of the coastline
% Plot hs map of Annual
cmin=0.3; cmax=1.6; int=0.10; n= round((cmax-cmin)/int);
%cmin=-90; cmax=90; int=10; n= round((cmax-cmin)/int);
figure
z1=nanmean(hs_of_hist_a,2);
z=nanmean(hs_co_hist_a,1);
m_proj('Mercator','longitude',[-8 15],'latitude',[-2 15]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
%m_contour(X,Y,z10,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
m_scatter(lon_f,lat_f,50,z,'filled'); %shading flat;
m_scatter(lon_f1,lat_f1,50,z1,'filled'); %shading flat;

%m_quiver(lon_f1,lat_f1,U,V,.09,'linewidth',4, 'color',[0.5 0.6 0.7]); 
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
cb=colorbar('ytick',cmin:1*int:cmax)
% cb =colorbar;
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Hs (m)');
%title('Annaual average of Longshore Sediment Transport between 1979-2004 in the GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%title('Annaual LST','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');

%%

yyaxis left;points=["P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "P14",...
    "P15", "P16", "P17", "P18", "P19", "P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27", "P28"...
    "P29", "P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37", "P38", "P39", "P40", "P41", "P42"...
    "P43", "P44", "P45"];
P=points(1:2:45);
P1=1:45;

plot(nanmean(dm_co_hist_a,1),'oy','linewi',1); hold on 
plot(nanmean(dm_co_hist_w,1),'-r','linewi',1); hold on 
plot(nanmean(dm_co_hist_s,1),'-b','linewi',1); hold on 

ylabel('Incidence angle (^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%ylim([-0.5 0.4])

yyaxis right;
plot(nanmean(dm_of_hist_a,2),'-m','linewi',1); hold on 
plot(nanmean(dm_of_hist_w,2),'-k','linewi',1); hold on 
plot(nanmean(dm_of_hist_s,2),'-c','linewi',1); hold on 

set(gca,'xticklabel',P.','FontWeight','Bold');
xticks(1:2:45)
xlim([1 45])
%ylim([-8*10^-4 7*10^-4])
ylim([160 260])

legend('Ann-Inc','Dry-Inc','Rain-Inc','Ann-Dm','Dry-Dm','Rain-Dm','Location','south','NumColumns',2,'FontWeight','Bold');
%title('Hs Trend for GoG','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Locations','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Projected Offshore Dm(^o)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
%yticklabels(gca, strrep(yticklabels(gca),'-','$-$'));
