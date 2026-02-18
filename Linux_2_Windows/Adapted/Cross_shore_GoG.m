%read SSS SMOS climatology
tic
clear
close all; clc;

%%
% define parameters
load('/home/profdam/Downloads/DATASylvain/ENSEMBLE.mat')
DD = 250;  % distance to the coast
lend = 0; % length to which NaN is added to have the same size for satellites points
D = 2;
%%
%====select regional area coordinates
lon1x = -15; lon2x = 15; lat1y = -15; lat2y = 15; %gog


% indlon = find(lon<=lon2x & lon>=lon1x); indlat = find(lat<=lat2y & lat>=lat1y);

%%

[nx1,ny1,nt]=size(ENSEMBLE_hs);
SSSG_SMOS = []; lon_SMOS = []; lat_SMOS =[]; sss_SMOS =[];  sssa2_SMOS =[]; 
cont = 0; lonsec_mean =[]; latsec_mean = []; 
ss_mean=[]; lon_mean = []; lat_mean = [];
for ip = 1%:nt
    ip;
ENSEMBLE_hs_mean = nanmean(ENSEMBLE_hs,3); %squeeze(ENSEMBLE_hs(:,:,ip));
lon_smos = Xlong; lat_smos =Ylat;

%rearrange lon,lat,SSS as vectors
[lat2_smos,lon2_smos]=meshgrid(lat_smos,lon_smos);

[nx,ny]=size(ENSEMBLE_hs_mean);

lon1_smos=reshape(lon2_smos,nx*ny,1);
lat1_smos=reshape(lat2_smos,nx*ny,1);
sss1_smos=reshape(ENSEMBLE_hs_mean,nx*ny,1);

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
load('/home/profdam/Downloads/DATASylvain/Coastal_reformed.mat')
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
sssax=sss(coastal_distx);
lonax=lonx(coastal_distx);
latax=latx(coastal_distx);
distax=coastal_dist(coastal_distx);

clear coastal_distx fullFileName j D X Y lonx_coteind

%%Plot Coastal distance
%  figure
%  m_proj('mercator','lon',[min(lonax) max(lonax)],'lat',[min(latax) max(latax)])
%  m_scatter(lonax,latax,15,sssax,'fill')
%  colormap('jet')
%  colorbar
%  cmin=min(sssax);
%  cmax=max(sssax);
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

% %title('SSS')
% xlabel('Longitude')
% ylabel('Latitude')
% 
%% Selecting a region
%***RUN THE LOOP BELOW FOR A SMALL REGION FIRST AND EVEN POINT BY POINT TO UNDERSTAND
%HOW IT WORKS FIRST AND GET PLOTS TO ILLUSTRATE THE METHODOLOGY BEFORE GOING GLOBAL


%== define a global area or a selected one

% % %% regional area 
def=find(lonax>=lon1x & lonax<=lon2x & latax>=lat1y & latax<=lat2y); %Northeast Br
lona=lonax(def); lata=latax(def); dista=distax(def); sssa=sssax(def);
%== coastal line coord  
def=find(lonx_cote>=lon1x & lonx_cote<=lon2x & latx_cote>=lat1y & latx_cote<=lat2y);
lonx_cote_reg=lonx_cote(def); latx_cote_reg=latx_cote(def);


% % global area selction =============
% %%== coorddinate of smos data
% def=find(lonax>=-180 & lonax<=180 & latax>=-90 & latax<=90); %GLOBAL
% lona=lonax(def); lata=latax(def); dista=distax(def); sssa=sssax(def);
% %=== coordinate of coastline
% def=find(lonx_cote>=-180 & lonx_cote<=180 & latx_cote>=-90 & latx_cote<=90); %GLOBAL
% lonx_cote_reg=lonx_cote(def); latx_cote_reg=latx_cote(def);


%%Plot Coastal distance close to the selected point
inp =1; 
% figure
% m_proj('mercator','lon',[min(lona)-inp max(lona)+inp],'lat',[min(lata)-inp max(lata)+inp])
% m_scatter(lona,lata,15,sssa,'fill')
% colormap('jet')
% colorbar
% cmin=min(sssa);
% cmax=max(sssa);
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
sss_css =[]; lat_css =[]; lon_css =[];
%global loop to compute SSS gradients
for i=1:length(def)
    
    %defind=12;
    defind=i;
%      figure
%      hold on
    %m_plot(lona(ship_shore),lata(ship_shore),'r+','markersize',10)
%      m_plot(lonx_cote_reg(defind),latx_cote_reg(defind),'r+','markersize',10)
    %Mr=5;
   
    Mr=2; %Radius of the circle (in °) to select the coastline which direction will be estimated
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
    
    %select SMOS points in a rectangle around cross-shore axis
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
        %create points every 0.25° along cross-shore axis
        lon_CSS=lonx_cote_reg(defind)+off*(0:0.5:2)*abs(cosd(ang_coast+90));
        lat_CSS=latx_cote_reg(defind)+(lon_CSS-lonx_cote_reg(defind))*tand(ang_coast+90);
%          m_plot(lon_CSS,lat_CSS,'r.','markersize',10)
%          m_coast('patch',[.6 .6 .6])
%          m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
%          m_grid('box','on')
         
        %regrid SMOS data around cross-shore axis
        if length(unique(lona(in)))>1 & length(unique(lata(in)))>1
            [lona2,lata2]=meshgrid(unique(lona(in)),unique(lata(in)));
            sssa2=nan(size(lona2));
            for iin=1:length(in)
                sssa2(lona2==lona(in(iin)) & lata2==lata(in(iin)))=sssa(in(iin));
            end
            
%             numb = length(find(isfinite(sssa2)));
            %interpolate SMOS points every 0.25° along cross-shore axis
            SSS_CSS=interp2(lona2,lata2,sssa2,lon_CSS,lat_CSS);
            CSS_coord=(0:0.5:2); % je dois calculer plutot la distance
%             
%             css_coord = ac_distance(lat_CSS,lon_CSS,latx_cote_reg(defind),lonx_cote_reg(defind)); % distance insert by ND 
%            
            def_CSS=find(isfinite(SSS_CSS));
            %compute the coastal gradient by linear fit with at least 4
            %points
            if length(def_CSS)>=3 % reduire le nombre de points � 1
                nptax = length(def_CSS);
                numb = length(find(isfinite(sssa2)));
                 p=polyfit(CSS_coord(def_CSS),SSS_CSS(def_CSS),1);
%                   p=polyfit(css_coord(def_CSS),SSS_CSS(def_CSS),1); % ND
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
    if exist('SSS_CSS','var')~=0
sss_css = [sss_css SSS_CSS];
lon_css = [lon_css lon_CSS]; 
lat_css = [lat_css lat_CSS];
ss_mean = [ss_mean nanmean(SSS_CSS)];
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

SSSG_SMOS(:,cont) = Sgrad_cst;

% sssa2_SMOS(:,:,cont) = sssa2;


% clear SSS_CSS
clear sss_smos_mean
clear Sgrad_cst
clear sssa
clear sssa2 numb
clear Sgrad_cst1
clear sssx1
clear sssx2 latsec_mean lonsec_mean
end
long_smos = nanmean(lonsecmean,2); lati_smos = nanmean(latsecmean,2);
SSSG = nanmean(SSSG_SMOS,2);
%%
% m_proj('mercator','lon',[0 15],'lat',[-8 8]);
% m_proj('mercator','lon',[min(lon_css) max(lon_css)],'lat',[min(lat_css) max(lat_css)]);
m_proj('mercator','lon',[lon1x lon2x],'lat',[lat1y lat2y]);

figure
m_scatter(lon_css,lat_css,50,sss_css,'fill')
hold on
colormap(jet)
m_plot(lon_css,lat_css,'.k')
m_coast('color',[.1 .1 .1])
m_grid('box','on')
caxis([31 38])
colorbar
caxis([31 38])


%%
aa=isfinite(sss_css); aas=sss_css(aa); aalon=lon_css(aa); aalat=lat_css(aa);

aa=isfinite(ss_mean); aas=ss_mean(aa); aalon=lon_mean(aa); aalat=lat_mean(aa);

m_proj('mercator','lon',[lon1x lon2x],'lat',[lat1y lat2y]);

figure
m_scatter(lon_mean,lat_mean,50,ss_mean,'fill')
hold on
colormap(jet)
%m_plot(lon_css,lat_css,'.k')
m_coast('color',[.1 .1 .1])
m_grid('box','on')
caxis([min(ss_mean) max(ss_mean)])
colorbar
%caxis([31 38])

%%
save -v7.3 /home/profdam/Downloads/DATASylvain sss_SMOS SSSG_SMOS sssa2_SMOS lon_cst lat_cst SSSG lona lata long_smos lati_smos lonsecmean latsecmean numbpt npointax lon_css lat_css sss_css

toc % time elapsed 1556.209745 ~ 25.9368 minutes 80.078785 seconds ~ 22h50 min

