%read SSS SMOS climatology
tic
clear
close all; clc;

%%
% define parameters
load('D:\Review Papers\Sediment Transport\Hs_Dm_Tm_Extracted/All_models_historical.mat',  'hs_ac', 'lat', 'lon')
%load('D:\Review Papers\Sediment Transport\Hs_Dm_Tm_Extracted\All_models_historical_R0p5.mat', 'ACCESS1_0_hs0p5_1979_2005', 'Xlong', 'Ylat')

DD = 250;  % distance to the coast
lend = 0; % length to which NaN is added to have the same size for satellites points
D = 2;
% hs_ac=permute(ACCESS1_0_hs0p5_1979_2005,[3 2 1]);
% lon=Xlong;
% lat=Ylat;
%%
%====select regional area coordinates
lon1x = -9; lon2x = 16; lat1y = -3; lat2y = 16; %gog
hs_ac=permute(hs_ac,[2 3 1]);
%m_proj('Mercator','longitude',[-8.5 15.5],'latitude',[-2.5 15.5]);

% ind_lon=find(Xlong>=-9 & Xlong<=16);
% ind_lat=find(Ylat>=-3 & Ylat<=16); 
% Xlong=Xlong(ind_lon);
% Ylat=Ylat(ind_lat);



indlon = find(lon<=lon2x & lon>=lon1x); indlat = find(lat<=lat2y & lat>=lat1y);
lonx=lon(indlon);latx=lat(indlat);
hs_ac=hs_ac(indlat,indlon,:);
%hs_ac=hs_ac(indlon,indlat,:);

%%
[nx1,ny1,nt]=size(hs_ac);
%
for ip = 1%:nt
    ip;
ENSEMBLE_hs_mean = nanmean(hs_ac,3); %squeeze(ENSEMBLE_hs(:,:,ip));
lon_smos = lonx; lat_smos =latx;
%lon_smos = Xlong; lat_smos =Ylat;

%rearrange lon,lat,SSS as vectors
[lat2_smos,lon2_smos]=meshgrid(lat_smos,lon_smos);
lat2_smos=lat2_smos';lon2_smos=lon2_smos';

[nx,ny]=size(ENSEMBLE_hs_mean);

lon1_smos=reshape(lon2_smos,nx*ny,1);
lat1_smos=reshape(lat2_smos,nx*ny,1);
sss1_smos=reshape(ENSEMBLE_hs_mean,nx*ny,1);

ind= find(lon1_smos<=lon2x & lon1_smos>=lon1x & lat1_smos<=lat2y & lat1_smos>=lat1y);
lon1_smos=lon1_smos(ind);
lat1_smos=lat1_smos(ind);
sss1_smos=sss1_smos(ind);

%reduce to spatial points with SSS values
def=find(isfinite(sss1_smos));
lon1_smos=lon1_smos(def);
lat1_smos=lat1_smos(def);
sss1_smos=sss1_smos(def);
lonx=lon1_smos;latx=lat1_smos;sss=sss1_smos; %time=date;
% clear sss1_smos def ans lat1_smos lon1_smos lat2_smos lon2_smos lat_smos lon_smos nx ny sint smax smin sss_smos sss_smos_mean

%% Read the global coastal data and extract the needed  
%load('C:\ADEOLA_STAGE_OA2019_GAEL\MATLAB/coasts_i.mat')
% load('C:\ADEOLA_STAGE_OA2019_GAEL\TSG\ZZSection_mat\ZZZZZZ\Main\Final\CoastlineLR.mat')
%load('/home/profdam/Downloads/DATASylvain/coasts_i.mat')
load('D:\Review Papers\Sediment Transport\Linux_2_Windows/Coastal_reformed.mat')
%load('/home/profdam/Downloads/DATASylvain/CoastlineHR.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
D=0.5;
%D=0;
% lonx_coteind=find(lonx_cotei<=(nanmax(lonx)+D)& lonx_cotei>=(nanmin(lonx)-D)...
%     & latx_cotei <=(nanmax(latx)+D)& latx_cotei >=(nanmin(latx)-D));

lonx_coteind=find(lonx_cotei<=(nanmax(lonx)+D/cosd(max(abs(latx)))) & lonx_cotei>=(nanmin(lonx)-D/cosd(max(abs(latx))))...
    & latx_cotei <=(nanmax(latx)+D)& latx_cotei >=(nanmin(latx)-D));

lonx_cote=lonx_cotei(lonx_coteind);
latx_cote=latx_cotei(lonx_coteind);
% clear Area k ncst
%  figure
%  plot(lonx_cote,latx_cote,'o','color','r','linewidth',1)
%  hold on
%  plot(lonx_cotei,latx_cotei,'ok','linewidth',0.5)
% 
%%
%%Limit range of calculations of distance and estimate distance
coastal_dist = NaN(1,length(lonx)); 
D=10;

for j=1:length(lonx)
    j;
    find_latlon= find(lonx_cote>= lonx(j)-D ...
        & lonx_cote <= lonx(j)+D...
        & latx_cote>= latx(j)-D ...
        & latx_cote <= latx(j)+D);

    if isempty(find_latlon)==0
        X=lonx_cote(find_latlon);
        Y=latx_cote(find_latlon);
            % coastal_dist(j) =nanmin(deg2km(distance(latx(j),lonx(j),Y,X)));
        p2pdist=[];
        for icoast=1:length(find_latlon)
            p2pdist(icoast)=m_lldist([lonx(j) X(icoast)],[latx(j) Y(icoast)]);
        end
        coastal_dist(j) =nanmin(p2pdist);
     end
end

clear D find_latlon j
DD=100;
%%Refresh the data to cover 200km to the coast only
coastal_distx =find(coastal_dist<=DD);
sssax=sss(coastal_distx);
lonax=lonx(coastal_distx);
latax=latx(coastal_distx);
distax=coastal_dist(coastal_distx);

clear coastal_distx fullFileName j D X Y lonx_coteind
end

%%
m_proj('Mercator','longitude',[-9.5 16.5],'latitude',[-3.5 16.5]);
m_gshhs_h('patch',[0.8 0.8 0.8]);
m_usercoast('coast_name','color','k','linewidth',2);
hold on
%m_scatter(lonax,latax,53,distax,'filled'); %shading flat;
m_scatter(lonx,latx,70,coastal_dist,'filled'); %shading flat;
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',12,'FontName','Times News Roman','FontWeight','Bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
%axis equal tight
m_northarrow(-5,0,2,'type',4,'linewi',.7);

m_text(2.3,6.9,'Cotonou','Rotation', 90,'color','k','fontw','bold','FontSize',8) 
% m_text(2.6,6.7,'Porto Novo','Rotation', 90,'color','k','fontw','bold') 
%m_text(1.83,6.7,'Grand Popo','Rotation', 90,'color','k','fontw','bold') 
m_text(1.6,10,'Benin','FontSize',9,'Rotation', 0,'color','k','fontw','bold') 

m_text(3.37,6.9,'Lagos','Rotation', 90,'color','k','fontw','bold','FontSize',8) 
%m_text(4.5,6.7,'Ayetoro','Rotation', 90,'color','k','fontw','bold')
m_text(7,10,'Nigeria','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
% m_text(5.5,6,'Warri','Rotation', -60,'color','k','fontw','bold') 
% m_text(5.8,4.7,'Port Harcourt','Rotation', 15,'color','k','fontw','bold') 
% m_text(8,4.6,'Calabar','Rotation', 50,'color','k','fontw','bold') 


m_text(1.25,6.7,'Lome','Rotation', 90,'color','k','fontw','bold','FontSize',8) 
%m_text(0.5,9,'Togo','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 

% m_text(0.85,6.1,'Keta','Rotation', 125,'color','k','fontw','bold') 
%m_text(-0.25,5.7,'Accra','Rotation', 95,'color','k','fontw','bold') 
% m_text(-1.08,5.4,'Cape Coast','Rotation', 90,'color','k','fontw','bold') 
%m_text(-1.58,5.2,'Takoradi','Rotation', 90,'color','k','fontw','bold')
% m_text(-2.54,5.2,'C. Three Points','Rotation',85,'color','k','fontw','bold')
m_text(-2.5,10,'Ghana','FontSize',9,'Rotation', 0,'color','k','fontw','bold') 

% m_text(-7,9,'Côte d''Ivoire','FontSize',9,'Rotation', 0,'color','k','fontw','bold') 
m_text(-7,9,'C\^ote d''Ivoire','interpreter','latex','FontSize',9,'Rotation', 0,'color','k','fontw','bold') 
%m_text(-3.1,5.2,'Abidjan','Rotation',90,'color','k','fontw','bold')
% m_text(-7.42,4.5,'C. Palmas','Rotation',70,'color','k','fontw','bold')
% m_text(-5,5.1,'Grand Lahou','Rotation', 90,'color','k','fontw','bold') 
%m_text(-6.33,5,'San Pedro','Rotation', 90,'color','k','fontw','bold') 
% m_text(-5.92,5.2,'Sassandra','Rotation', 90,'color','k','fontw','bold') 
%m_text(9.8,3.0,'Kribi','Rotation',-60,'color','k','fontw','bold')
m_text(9.9,4,'Douala','Rotation',-60,'color','k','fontw','bold','FontSize',8)
m_text(10,5,'Cameroon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
%m_text(9,1.5,'Equaorial Guinea','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(10,0,'Gabon','FontSize',10,'Rotation', 0,'color','k','fontw','bold') 
m_text(9.4,0.5,'Libreville','Rotation', 0,'color','k','fontw','bold','FontSize',8) 
%m_text(9.6,-0.1,'C. Lopez','FontSize',9,'Rotation', -75,'color','k','fontw','bold') 
%m_text(0,0,'Gulf of Guinea','FontSize',10,'Rotation', 0,'color','b','fontw','bold') 
axis equal tight
cmin=5; cmax=850; int=25; n= round((cmax-cmin)/int);
colormap(jet(n)); 
cb=colorbar('ytick',cmin:1*int:cmax)
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
caxis([cmin cmax])
set(get(cb,'label'),'string','Distance (km)','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
title('Coastal distance','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',12,'FontName','Times News Roman','FontWeight','Bold');


%%
% %%Plot Original distance
figure
m_proj('Mercator','longitude',[-8.5 15.5],'latitude',[-2.5 15.5]);
m_scatter(lonx,latx,50,coastal_dist,'filled')
colormap('jet')
colorbar
cmin=min(coastal_dist);
cmax=max(coastal_dist);
caxis([cmin cmax]);
m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
m_grid('box','on')
title('Original Distance')

%% Coastal 
% %%Plot Original distance
figure
m_proj('Mercator','longitude',[-8.5 15.5],'latitude',[-2.5 15.5]);
m_scatter(lonax,latax,70,distax,'filled')
colormap('jet')
colorbar
cmin=min(distax);
cmax=max(distax);
caxis([cmin cmax]);
m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
m_grid('box','on')
title('Coastal Distance')

