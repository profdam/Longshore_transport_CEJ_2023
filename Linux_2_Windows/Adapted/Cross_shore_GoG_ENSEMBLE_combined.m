%read hs ENSEMBLE climatology
tic
clear
close all; clc;
 
%%
% define parameters
load('/home/profdam/Downloads/INPUT_DATA/ENSEMBLE.mat')
DD = 200;  % distance to the coast
lend = 0; % length to which NaN is added to have the same size for satellites points
D = 2;
%%
%====select regional area coordinates
% lon1x = -20; lon2x = 20; lat1y = -20; lat2y = 20; %gog
 lon1x = -15; lon2x = 15; lat1y = -15; lat2y = 15; %gog

 
% indlon = find(lon<=lon2x & lon>=lon1x); indlat = find(lat<=lat2y & lat>=lat1y);
 %%
 ENSEMBLE_dm=ERA5_dm0p5_1979_2004;
 ENSEMBLE_hs=ERA5_hs0p5_1979_2004;
 ENSEMBLE_tm=ERA5_tm0p5_1979_2004;
%%
time=1:312;
qlon=[-20:0.25:20]; %0 degrees and 360 degrees (180 east and west are the same). it is continuous
qlat=[-20:0.25:20];
[QLON, QLAT] = ndgrid(qlon, qlat);
nair = size(ENSEMBLE_hs,3);
new_hs= zeros(size(QLON,1), size(QLON,2), nair);
new_tm= zeros(size(QLON,1), size(QLON,2), nair);
new_dm= zeros(size(QLON,1), size(QLON,2), nair);

for time = 1 : nair
    new_hs(:,:,time) = interp2(Xlong, Ylat, ENSEMBLE_hs(:,:,time).', QLON, QLAT);
    new_tm(:,:,time) = interp2(Xlong, Ylat, ENSEMBLE_tm(:,:,time).', QLON, QLAT);
    new_dm(:,:,time) = interp2(Xlong, Ylat, ENSEMBLE_dm(:,:,time).', QLON, QLAT);
end
%for time = 1 : nair; surf(QLON, QLAT, new(:,:,time), 'edgecolor', 'none'); drawnow limitrate; end

ENSEMBLE_hs=new_hs;ENSEMBLE_tm=new_tm; ENSEMBLE_dm=new_dm; Xlong=qlon;Ylat=qlat;
clear QLON QLAT new_hs new_tm new_dm nair qlat qlon time
%%
 
[nx1,ny1,nt]=size(ENSEMBLE_hs);
hsG_ENSEMBLE = []; lon_ENSEMBLE = []; lat_ENSEMBLE =[]; hs_ENSEMBLE =[];  hsa2_ENSEMBLE =[]; 
cont = 0; lonsec_mean =[]; latsec_mean = []; 
hs_mean=[];tm_mean=[]; dm_mean=[]; lon_mean = []; lat_mean = [];
for ip = 1%:nt
    ip;
ENSEMBLE_hs_mean = nanmean(ENSEMBLE_hs,3); %squeeze(ENSEMBLE_hs(:,:,ip));
ENSEMBLE_tm_mean = nanmean(ENSEMBLE_tm,3); %squeeze(ENSEMBLE_hs(:,:,ip));
ENSEMBLE_dm_mean = nanmean(ENSEMBLE_dm,3); %squeeze(ENSEMBLE_hs(:,:,ip));

lon_ENSEMBLE = Xlong; lat_ENSEMBLE =Ylat;
 
%rearrange lon,lat,hs as vectors
[lat2_ENSEMBLE,lon2_ENSEMBLE]=meshgrid(lat_ENSEMBLE,lon_ENSEMBLE);
 
[nx,ny]=size(ENSEMBLE_hs_mean);
 
lon1_ENSEMBLE=reshape(lon2_ENSEMBLE,nx*ny,1);
lat1_ENSEMBLE=reshape(lat2_ENSEMBLE,nx*ny,1);
hs1_ENSEMBLE=reshape(ENSEMBLE_hs_mean,nx*ny,1);
tm1_ENSEMBLE=reshape(ENSEMBLE_tm_mean,nx*ny,1);
dm1_ENSEMBLE=reshape(ENSEMBLE_dm_mean,nx*ny,1);
 
%reduce to spatial points with hs values
def=find(isfinite(hs1_ENSEMBLE));
lon1_ENSEMBLE=lon1_ENSEMBLE(def);
lat1_ENSEMBLE=lat1_ENSEMBLE(def);
hs1_ENSEMBLE=hs1_ENSEMBLE(def);
tm1_ENSEMBLE=tm1_ENSEMBLE(def);
dm1_ENSEMBLE=dm1_ENSEMBLE(def);

lonx=lon1_ENSEMBLE;latx=lat1_ENSEMBLE;hs=hs1_ENSEMBLE; tm=tm1_ENSEMBLE; dm=dm1_ENSEMBLE; %time=date;
% clear hs1_ENSEMBLE def ans lat1_ENSEMBLE lon1_ENSEMBLE lat2_ENSEMBLE lon2_ENSEMBLE lat_ENSEMBLE lon_ENSEMBLE nx ny sint smax smin hs_ENSEMBLE hs_ENSEMBLE_mean

%% Read the global coastal data and extract the needed  
%load('C:\ADEOLA_STAGE_OA2019_GAEL\MATLAB/coasts_i.mat')
% load('C:\ADEOLA_STAGE_OA2019_GAEL\TSG\ZZSection_mat\ZZZZZZ\Main\Final\CoastlineLR.mat')
%load('/home/profdam/Downloads/DATASylvain/coasts_i.mat')
load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
%load('/home/profdam/Downloads/DATASylvain/CoastlineHR.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
D=2;
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
 
%%Refresh the data to cover 200km to the coast only
coastal_distx =find(coastal_dist<=DD);
hsax=hs(coastal_distx);
tmax=tm(coastal_distx);
dmax=dm(coastal_distx);
lonax=lonx(coastal_distx);
latax=latx(coastal_distx);
distax=coastal_dist(coastal_distx);
 
clear coastal_distx fullFileName j D X Y lonx_coteind

%%Plot Coastal distance
%  figure
%  m_proj('mercator','lon',[min(lonax) max(lonax)],'lat',[min(latax) max(latax)])
%  m_scatter(lonax,latax,15,hsax,'fill')
%  colormap('jet')
%  colorbar
%  cmin=min(hsax);
%  cmax=max(hsax);
% caxis([cmin cmax]);
% m_coast('patch',[.6 .6 .6])
% % m_gshhs_h('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);m_grid('box','on')
% title('Coastal Distance')
% xlabel('Longitude')
% ylabel('Latitude')
 
% % %%Plot Original distance
% figure
% m_proj('mercator','lon',[min(lonx) max(lonx)],'lat',[min(latx) max(latx)])
% m_scatter(lonx,latx,15,coastal_dist)
% colormap('jet')
% colorbar
% cmin=min(coastal_dist);
% cmax=max(coastal_dist);
% caxis([cmin cmax]);
% m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
% m_grid('box','on')
% title('Original Distance')
 
% %title('hs')
% xlabel('Longitude')
% ylabel('Latitude')
% 
%% Selecting a region
%***RUN THE LOOP BELOW FOR A SMALL REGION FIRST AND EVEN POINT BY POINT TO UNDERSTAND
%HOW IT WORKS FIRST AND GET PLOTS TO ILLUSTRATE THE METHODOLOGY BEFORE GOING GLOBAL
 
 
%== define a global area or a selected one
 
% % %% regional area 
def=find(lonax>=lon1x & lonax<=lon2x & latax>=lat1y & latax<=lat2y); %Northeast Br
lona=lonax(def); lata=latax(def); dista=distax(def); hsa=hsax(def); tma=tmax(def); dma=dmax(def);
%== coastal line coord  
def=find(lonx_cote>=lon1x & lonx_cote<=lon2x & latx_cote>=lat1y & latx_cote<=lat2y);
lonx_cote_reg=lonx_cote(def); latx_cote_reg=latx_cote(def);
 
 
% % global area selction =============
% %%== coorddinate of ENSEMBLE data
% def=find(lonax>=-180 & lonax<=180 & latax>=-90 & latax<=90); %GLOBAL
% lona=lonax(def); lata=latax(def); dista=distax(def); hsa=hsax(def);
% %=== coordinate of coastline
% def=find(lonx_cote>=-180 & lonx_cote<=180 & latx_cote>=-90 & latx_cote<=90); %GLOBAL
% lonx_cote_reg=lonx_cote(def); latx_cote_reg=latx_cote(def);
 
 
%%Plot Coastal distance close to the selected point
inp =1; 
% figure
% m_proj('mercator','lon',[min(lona)-inp max(lona)+inp],'lat',[min(lata)-inp max(lata)+inp])
% m_scatter(lona,lata,15,hsa,'fill')
% colormap('jet')
% colorbar
% cmin=min(hsa);
% cmax=max(hsa);
% caxis([cmin cmax]);
% m_coast('patch',[.6 .6 .6])
% % m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
% m_grid('box','on')
% title('COASTAL DISTANCE')
% xlabel('Longitude')
% ylabel('Latitude')
 
%%
%ship_shore=find(dista==defd); %ship_shore=find(dista<5);
% hold on
% 
lon_cst=[];
lat_cst=[];
Sgrad_cst=[]; 
lonx_cst=[];
latx_cst=[];
lonsec_mean =[];latsec_mean =[];
 
lonm_cst=[];
latm_cst=[];
 
lons_cst=[];
lats_cst=[];
numbpt = []; npointax = [];
hs_css =[];tm_css =[];dm_css =[]; lat_css =[]; lon_css =[];
%global loop to compute hs gradients
for i=1:length(def)
    
    %defind=12;
    defind=i;
%      figure
%      hold on
    %m_plot(lona(ship_shore),lata(ship_shore),'r+','markersize',10)
%      m_plot(lonx_cote_reg(defind),latx_cote_reg(defind),'r+','markersize',10)
    %Mr=5;
   
    Mr=2; %Radius of the circle (in Â°) to select the coastline which direction will be estimated
    %lon_shore=mean(lona(ship_shore));
    %lat_shore=mean(lata(ship_shore));
    %if isempty(ship_shore)
    %    ship_shore=find(dista==min((dista)));
    %    shoreind=find(sqrt((lonx_cotei-lona(ship_shore)).*(lonx_cotei-lona(ship_shore))+(latx_cotei-lata(ship_shore)).*(latx_cotei-lata(ship_shore)))<(Mr+min(dista)/110));
    shoreind=find(sqrt((lonx_cote_reg-lonx_cote_reg(defind)).*(lonx_cote_reg-lonx_cote_reg(defind))...
        +(latx_cote_reg-latx_cote_reg(defind)).*(latx_cote_reg-latx_cote_reg(defind)))<Mr);
    %    lon_shore=mean(lonx_cotei(shoreind));
    %    lat_shore=mean(latx_cotei(shoreind));
    %end
    %lonx_coteind=find(sqrt((lonx_cotei-lon_shore).*(lonx_cotei-lon_shore)+(latx_cotei-lat_shore).*(latx_cotei-lat_shore))<Mr);
    lonx_cote_sel=lonx_cote_reg(shoreind);
    latx_cote_sel=latx_cote_reg(shoreind);
%      m_plot(lonx_cote_sel,latx_cote_sel,'r.','markersize',10) 
%     hold on
    %***COMPUTE ANGLE OF COASTLINE
    p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    %tangline = [lon_shore min(lona); lat_shore min(lata)]; %min(lonx_cote) min(latx_cote)min(coast_fit X=[lona lata];
    
    %compute cross-shore direction to the coastline
    lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
    laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
%     m_plot(lonx_cote_sel,coast_fit,'r-')
%     
%     %m_plot(tangline(1,:), tangline(2,:),'k')
%       m_plot(lonx_norm,laty_norm ,'k')   % plot du crosshore section
    
    %select ENSEMBLE points in a rectangle around cross-shore axis
    
%     lonp(1)=lonx_norm(1)-0.5*cosd(ang_coast);
%     lonp(2)=lonx_norm(1)+0.5*cosd(ang_coast);
%     lonp(3)=lonx_norm(2)+0.5*cosd(ang_coast);
%     lonp(4)=lonx_norm(2)-0.5*cosd(ang_coast);
%     latp(1)=laty_norm(1)-0.5*sind(ang_coast);
%     latp(2)=laty_norm(1)+0.5*sind(ang_coast);
%     latp(3)=laty_norm(2)+0.5*sind(ang_coast);
%     latp(4)=laty_norm(2)-0.5*sind(ang_coast);
    
    lonp(1)=lonx_norm(1)-0.5*cosd(ang_coast);
    lonp(2)=lonx_norm(1)+0.5*cosd(ang_coast);
    lonp(3)=lonx_norm(2)+0.5*cosd(ang_coast);
    lonp(4)=lonx_norm(2)-0.5*cosd(ang_coast);
    latp(1)=laty_norm(1)-0.5*sind(ang_coast);
    latp(2)=laty_norm(1)+0.5*sind(ang_coast);
    latp(3)=laty_norm(2)+0.5*sind(ang_coast);
    latp(4)=laty_norm(2)-0.5*sind(ang_coast);
%       m_plot([lonp lonp(1)],[latp latp(1)],'b') % plot du rectangle autour des points du crosshore section
    in=find(inpolygon(lona,lata,lonp,latp));
    %find offshore direction
    proj=((lona(in)-lonx_cote_reg(defind))*2+(lata(in)-latx_cote_reg(defind))*2*tand(ang_coast+90))/sqrt(2+(2*tand(ang_coast+90))^2);
    off=sign(mean(proj));% +/-1 for east/west-ward
    if ~isempty(proj)
        %create points every 0.25Â° along cross-shore axis
        lon_CSS=lonx_cote_reg(defind)+off*(0:0.25:2)*abs(cosd(ang_coast+90));
        lat_CSS=latx_cote_reg(defind)+(lon_CSS-lonx_cote_reg(defind))*tand(ang_coast+90);
%          m_plot(lon_CSS,lat_CSS,'r.','markersize',10)
%          m_coast('patch',[.6 .6 .6])
%          m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
%          m_grid('box','on')
         
        %regrid ENSEMBLE data around cross-shore axis
        if length(unique(lona(in)))>1 & length(unique(lata(in)))>1
            [lona2,lata2]=meshgrid(unique(lona(in)),unique(lata(in)));
            hsa2=nan(size(lona2));
            tma2=nan(size(lona2));
            dma2=nan(size(lona2));
            for iin=1:length(in)
                hsa2(lona2==lona(in(iin)) & lata2==lata(in(iin)))=hsa(in(iin));
                tma2(lona2==lona(in(iin)) & lata2==lata(in(iin)))=tma(in(iin));
                dma2(lona2==lona(in(iin)) & lata2==lata(in(iin)))=dma(in(iin));
            end
            
%             numb = length(find(isfinite(hsa2)));
            %interpolate ENSEMBLE points every 0.25Â° along cross-shore axis
            hs_CSS=interp2(lona2,lata2,hsa2,lon_CSS,lat_CSS);
            tm_CSS=interp2(lona2,lata2,tma2,lon_CSS,lat_CSS);
            dm_CSS=interp2(lona2,lata2,dma2,lon_CSS,lat_CSS);
            CSS_coord=(0:0.25:2); % je dois calculer plutot la distance
%             
%             css_coord = ac_distance(lat_CSS,lon_CSS,latx_cote_reg(defind),lonx_cote_reg(defind)); % distance insert by ND 
%            
            def_CSS=find(isfinite(hs_CSS));
            %compute the coastal gradient by linear fit with at least 4
            %points
            if length(def_CSS)>=3 % reduire le nombre de points ï¿½ 1
                nptax = length(def_CSS);
                numb = length(find(isfinite(hsa2)));
                 p=polyfit(CSS_coord(def_CSS),hs_CSS(def_CSS),1);
%                   p=polyfit(css_coord(def_CSS),hs_CSS(def_CSS),1); % ND
                 Sgrad=-p(1)/110;
%                  Sgrad=-p(1);
                lon_cst=[lon_cst lonx_cote_reg(defind)];
                lat_cst=[lat_cst latx_cote_reg(defind)];
                Sgrad_cst=[Sgrad_cst Sgrad];
                numbpt =[numbpt numb];
                npointax = [npointax nptax]; 
               % crosshore sections
                % crosshore sections
                loncs = nanmean(lon_CSS);
                lonsec_mean = [lonsec_mean loncs];
                latcs = nanmean(lat_CSS);
                latsec_mean = [latsec_mean latcs];
                lonx_cst = [lonx_cst lon_CSS];
                latx_cst = [latx_cst lat_CSS];
                                              
                lonm_cst=[lonm_cst lonx_norm];
                latm_cst=[latm_cst laty_norm];
            
            end
        end
    end 
    if exist('hs_CSS','var')~=0
hs_css = [hs_css hs_CSS];
tm_css = [tm_css tm_CSS];
hs_css = [dm_css dm_CSS];

lon_css = [lon_css lon_CSS]; 
lat_css = [lat_css lat_CSS];
hs_mean = [hs_mean nanmean(hs_CSS)];
tm_mean = [tm_mean nanmean(tm_CSS)];
dm_mean = [dm_mean nanmean(dm_CSS)];

lon_mean = [lon_mean nanmean(lon_CSS)];
lat_mean = [lat_mean nanmean(lat_CSS)];
    else
        continue
    end
   
end
 
 
cont = cont+1;
Sgrad_cst(end+1:lend) = NaN;
lonsec_mean(end+1:lend) = NaN;
latsec_mean(end+1:lend) = NaN;
numbpt(end+1:lend) = NaN;
npointax(end+1:lend) = NaN;
 
lonsecmean(:,cont) = lonsec_mean;
latsecmean(:,cont) = latsec_mean;
 
hsG_ENSEMBLE(:,cont) = Sgrad_cst;

 
% hsa2_ENSEMBLE(:,:,cont) = hsa2;
 
 
% clear hs_CSS
clear hs_ENSEMBLE_mean
clear Sgrad_cst
clear hsa
clear hsa2 numb
clear Sgrad_cst1
clear hsx1
clear hsx2 latsec_mean lonsec_mean
end
long_ENSEMBLE = nanmean(lonsecmean,2); lati_ENSEMBLE = nanmean(latsecmean,2);
hsG = nanmean(hsG_ENSEMBLE,2);
%%
% m_proj('mercator','lon',[0 15],'lat',[-8 8]);
% m_proj('mercator','lon',[min(lon_css) max(lon_css)],'lat',[min(lat_css) max(lat_css)]);
m_proj('mercator','lon',[lon1x lon2x],'lat',[lat1y lat2y]);
 
figure
m_scatter(lon_css,lat_css,50,hs_css,'fill')
hold on
colormap(jet)
m_plot(lon_css,lat_css,'.k')
m_coast('color',[.1 .1 .1])
m_grid('box','on')
caxis([31 38])
colorbar
caxis([31 38])
 
 
%%
aa=isfinite(hs_css); aas=hs_css(aa); aalon=lon_css(aa); aalat=lat_css(aa);
 
aa=isfinite(hs_mean); aas=hs_mean(aa); aalon=lon_mean(aa); aalat=lat_mean(aa);

alon=round(aalon,3);
indlon = find(alon ==8.819  | alon == 8.941 | alon == 9.115);
aalon(indlon)=nan; aalat(indlon)=nan; aas(indlon)=nan;
aa=isfinite(aas); aas=aas(aa); aalon=aalon(aa); aalat=aalat(aa);

 
m_proj('mercator','lon',[lon1x lon2x],'lat',[lat1y lat2y]);
figure
% m_scatter(lon_mean,lat_mean,50,hs_mean,'fill')
m_scatter(aalon,aalat,50,aas,'fill')
hold on
colormap(jet)
%m_plot(lon_css,lat_css,'.k')
m_coast('color',[.1 .1 .1])
m_grid('box','on')
caxis([min(hs_mean) max(hs_mean)])
colorbar
%caxis([31 38])
%% Projected locations on the coast
% along=[-14 -13.58 -13.25 -12.92 -12.42 -11.92 -11.00 -9.42 -8.33 -7.42 -6.33 -5.92 -5.33 -4.75 -4.33 -3.83 -3.08 -2.58 -2.00 -1.58 -1.08 -0.25 0.33 1.00 1.83 2.33 3.42...
%     4.5 5.0 5.42 6.00 6.5 7.0 7.5 8.0 8.42 8.83 8.92 9.33 9.92 9.67 9.33 9.25 8.75 9.00 9.17 9.50 9.83 10.33 10.67 11.00 11.33 11.58 11.92 12.17...
%     12.42 12.92 13.42 13.17 13.58 13.92 13.42 12.67 12.33 11.83];


along=[11.83 12.33 12.67 13.42 13.92 13.58 13.17 13.42 12.92 12.42...
    12.17 11.92 11.58 11.33 11.00 10.67 10.33 9.83 9.50 9.17 9.00 8.75 9.25 NaN...
    9.33 9.67 9.92 9.33 ...
    7.5 7.0 6.5 6.00 5.42 5.0 4.5 ...
    3.42 2.33 NaN...
    1.83 1.00 0.33 -0.25 -1.08 -1.58 -2.00 -2.58 -3.08 -3.83 -4.33 -4.75...
    -5.33 -5.92 -6.33 -7.42 -8.33 -9.42 -11.00 -11.92 -12.42 -12.92 -13.25 -13.58 -14.0...
    8.0 8.83 8.92 8.42 NaN];
along=along';


alatt=[-16 -14.5 -13.33 -12.67 -11.25 -10.33 -9.42 -8.67 -7.25 -6.42...
    -5.75 -4.92 -4.5 -4.08 -3.75 -3.42 -3.08 -2.75 -2.25 -1.83 -1.33 -0.83 -0.5 NaN...
    0.5 1.92 3.08 3.92...
    4.42 4.33 4.25 4.25 4.58 5.92 6.33...
    6.50 6.42 NaN...
    6.33 5.83 5.83 5.5 5.17 5.00 4.75 5.00 5.08 5.25 5.25 5.17...
    5.08 5.00 4.67 4.25 4.5 5.25 6.42 7.08 7.33 7.83 9.17 9.58 10.0...
    4.42 4.5 4.0 4.5 NaN];
alatt=alatt';
 


% alatt=[10 9.58 9.17 7.83 7.33 7.08 6.42 5.25 4.5 4.25 4.67 5.00 5.08 5.17 5.25 5.25 5.08 5.00 4.75 5.00 5.17 5.5 5.83 5.83 6.33 6.42 6.50...
%     6.33 5.92 4.58 4.25 4.25 4.33 4.42 4.42 4.5 4.5 4.0 3.92 3.08 1.92 0.5 -0.5 -0.83 -1.33 -1.83 -2.25 -2.75 -3.08 -3.42 -3.75 -4.08 -4.5 -4.92 -5.75...
%     -6.42 -7.25 -8.67 -9.42 -10.33 -11.25 -12.67 -13.33 -14.5 -16];
%%
figure
plot(lonx_cote,latx_cote,'r-')
hold on
plot(along,alatt,'ko')

figure
plot(lonx_cote,latx_cote,'r-')
hold on
scatter(along,alatt,50,aas,'filled')
%%
save -v7.3 /home/profdam/Downloads/DATASylvain hs_ENSEMBLE hsG_ENSEMBLE hsa2_ENSEMBLE lon_cst lat_cst hsG lona lata long_ENSEMBLE lati_ENSEMBLE lonsecmean latsecmean numbpt npointax lon_css lat_css hs_css
 
toc % time elapsed 1556.209745 ~ 25.9368 minutes 80.078785 seconds ~ 22h50 min
 

