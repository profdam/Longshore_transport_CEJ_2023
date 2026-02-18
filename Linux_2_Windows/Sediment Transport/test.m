load('/home/profdam/Documents/FVCOM/fvcom43-master/FVCOM_mesh.mat')
Mobj = add_coriolis(Mobj);
Mobj = add_river_nodes_list(Mobj, [10063,10064,10065,10066,10072,10073,10074,10075,10076,10077,10078,10080,10081,10082,10084,10085,10086,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10114,10115,10116,10117,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280], 'Congo');




%%
for i=1:length(congo)
    aab(i)=find(lon==congo(i,1) & lat==congo(i,2));
end

aalon=lon(aab);aalat=lat(aab);


filename=('/home/profdam/Downloads/INPUT_DATA/River_discharge/2018.nc');
lonn=ncread(filename,'lon');
latt=ncread(filename,'lat');
dist=ncread(filename,'dis24');
dista=double(nanmean(dist,3));

add_var_FVCOM_river('/home/profdam/Downloads/INPUT_DATA/River_discharge/2018.nc','medium_sand','medium sand','kg-m^-3',50)%sand_ts;



clear all;close all;clc;

%% Load the FVCOM unstructured mesh
load('/home/profdam/Documents/FVCOM/fvcom43-master/GoG_grid_bathy_data.mat', 'lat', 'lon')


%% Regrid SSH data to be FVCOM consistent

filename='/home/profdam/Downloads/INPUT_DATA/SSH/c3s_obs-sl_glo_phy-ssh_my_twosat-l4-duacs-0.25deg_P1D_2018_2020.nc';
lon_ssh=ncread(filename,'longitude');lon_ssh=double(lon_ssh(2:end,:));
lat_ssh=ncread(filename,'latitude');lat_ssh=double(lat_ssh);
%time=ncread(filename,'time')+datenum(1950,1,1);time=double(time);
ssh= ncread(filename,'adt');ssh=ssh(2:end,:,:);
ssha=nanmean(ssh,3);ssha=ssha';
[X Y]=meshgrid(lon_ssh,lat_ssh);
%ssh_gog=scatteredInterpolant(X(:),Y(:),ssha(:));
%F = scatteredInterpolant(X(:),Y(:),Z(:));
%zGrid = ssh_gog(lon,lat);
%OR
ssh_gog1=griddata(X(:),Y(:),ssha(:),lon,lat);

%% Cleaning the open boundary to be more circular
alon=round(lon,2);alat=round(lat,2);
ind=find(alat==(-15) & alat==(-15));
aalon=lon(ind);aalat=lat(ind);

lonlat=[lon lat];
ind=find(lonlat(:,1)==-15 & lonlat(:,2)==-15);

plot(lon,lat,'.k'); hold on; plot(aalon,aalat,'.r','linewidth',20);

%%
filename='/home/profdam/Downloads/INPUT_DATA/River_discharge/2015_.nc';
time=ncread(filename,'time')/24+datenum(1980,1,1);time=double(time);
date=datevec(time);


Mobj = read_sms_mesh('2dm','/home/profdam/Documents/FVCOM/fvcom43-master/tst_gog_grd3.2dm','coordinate','spherical','project','true','addCoriolis','true');


Mobj = read_sms_mesh('2dm','/home/profdam/Documents/FVCOM/fvcom43-master/tst_gog_grd2.2dm','project','true','addCoriolis','true');
varlist= {'ssh', 'salinity', 'temperature', 'u', 'v'};
%modeltime = [55561, 55562]; % time period in Modified Julian Days
%hycom = get_HYCOM_forcing(Mobj, modeltime, varlist);
start_date=[1992, 10, 02, 00, 00, 00];
Mobj = interp_HYCOM2FVCOM(Mobj, hycom, start_date, varlist)

datadir='/media/profdam/P.DAM/ECMWF/ERA-Interim/2004/ERA_Interim_2004';
varlist={'swh','mwp','mwd'};
startDate=[2004, 01, 01, 00, 00, 00];
endDate=[2004, 09, 31, 00, 00, 00];
era = read_ERA_wind(Mobj, startDate, endDate, datadir, varlist);



Mobj =add_river_nodes_graphic(Mobj,'Potomac')
Mobj = add_obc_nodes_graphic(Mobj,'OpenOcean')

lon=Mobj.x;
lat=Mobj.y;
 
geoaxes
[lat,lon] = ginput(4);
plot(lon,lat,'.r');

fileprefix - Output netCDF file prefix (plus path) will be
      fileprefix_{wnd,hfx,evap}.nc if fver is '3.1.0', otherwise output
      files will be fileprefix_wnd.nc.
data =ncread('/home/profdam/Downloads/INPUT_DATA/ReanalysisSalt_Temp/Temp2016-2019/global-reanalysis-phy-001-031-grepv2-mnstd-daily_temp2017.nc', 'thetao_mean');
data=nanmean(nanmean(data,3),4);
lat=ncread('/home/profdam/Downloads/INPUT_DATA/ReanalysisSalt_Temp/Temp2016-2019/global-reanalysis-phy-001-031-grepv2-mnstd-daily_temp2017.nc', 'latitude');
lon=ncread('/home/profdam/Downloads/INPUT_DATA/ReanalysisSalt_Temp/Temp2016-2019/global-reanalysis-phy-001-031-grepv2-mnstd-daily_temp2017.nc', 'longitude');
dep=ncread('/home/profdam/Downloads/INPUT_DATA/ReanalysisSalt_Temp/Temp2016-2019/global-reanalysis-phy-001-031-grepv2-mnstd-daily_temp2017.nc', 'depth');
time=ncread('/home/profdam/Downloads/INPUT_DATA/ReanalysisSalt_Temp/Temp2016-2019/global-reanalysis-phy-001-031-grepv2-mnstd-daily_temp2017.nc', 'time');


infos = 'Additional remarks to be written to the "infos" netCDF variable';
fver = '3.1.6';



%%
load('/home/profdam/Downloads/INPUT_DATA/ENSEMBLE.mat')

time=1:312;
qlon=[-20:0.25:20]; %0 degrees and 360 degrees (180 east and west are the same). it is continuous
qlat=[-20:0.25:20];
[QLON, QLAT] = ndgrid(lon, lat);
nair = size(ENSEMBLE_hs,3);
new_hs= zeros(size(lon,1), 1, nair);
new_tm= zeros(size(QLON,1), size(QLON,2), nair);
new_dm= zeros(size(QLON,1), size(QLON,2), nair);

for time = 1 : nair
    new_hs(:,:,time) = interp2(Xlong, Ylat, ENSEMBLE_hs(:,:,time).', lon, lat);
    %new_tm(:,:,time) = interp2(Xlong, Ylat, ENSEMBLE_tm(:,:,time).', QLON, QLAT);
    %new_dm(:,:,time) = interp2(Xlong, Ylat, ENSEMBLE_dm(:,:,time).', QLON, QLAT);
end
%for time = 1 : nair; surf(QLON, QLAT, new(:,:,time), 'edgecolor', 'none'); drawnow limitrate; end

ENSEMBLE_hs=new_hs;ENSEMBLE_tm=new_tm; ENSEMBLE_dm=new_dm; Xlong=qlon;Ylat=qlat;
clear QLON QLAT new_hs new_tm new_dm nair qlat qlon time


%%

filename='/home/profdam/Downloads/INPUT_DATA/SSH/c3s_obs-sl_glo_phy-ssh_my_twosat-l4-duacs-0.25deg_P1D_2018_2020.nc';
lon_ssh=ncread(filename,'longitude');lon_ssh=double(lon_ssh(2:end,:));
lat_ssh=ncread(filename,'latitude');lat_ssh=double(lat_ssh);
time=ncread(filename,'time');%+datenum(1950,1,1);time=double(time);
ssh= ncread(filename,'adt');ssh=ssh(2:end,:,:);
ssha=nanmean(ssh,3);ssha=ssha';
[X Y]=meshgrid(lon_ssh,lat_ssh);
ssh_gog=scatteredInterpolant(X(:),Y(:),ssha(:));
%F = scatteredInterpolant(X(:),Y(:),Z(:));
zGrid = ssh_gog(lon,lat);
%OR
ssh_gog1=griddata(X(:),Y(:),ssha(:),lon,lat);


ssh_gog=scatteredInterpolant(lon_ssh,lat_ssh,ssha,lon,lat);

lon_sst=ncread(filename,'longitude');
lat_sst=ncread(filename,'latitude');
sst= ncread(filename,'thetao_mean');
ssta=sst(:,:,1:2,:);
ssta=nanmean(nanmean(ssta,3),4);


sst_gog= griddata(lon_sst,lat_sst,ssta,lon,lat);
sst_gog=TriScatteredInterp(lon,lat,ssta);

[Y X]=meshgrid(lat,lon);
sst_gog=interp2(lat_sst,lon_sst,ssta,Y,X);
figure;pcolor(lon,lat,sst_gog'); shading flat;colormap(jet);colorbar; caxis([12 30])


%%
X = -1:0.2:1;
Y = -1:0.2:1;
M = rand(11,11);

 coord=repmat(1:11,11,1);
 XYZmat=cat(3,X(coord),Y(coord'),M);
 
  Xtemp=X(coord);
 Ytemp=Y(coord');
 XYZmat=[Xtemp(:)';Ytemp(:)';M(:)'];

 
 
lon=ncread('/home/profdam/Downloads/INPUT_DATA/GEBCO_25_Feb_2022_f0994a0ab3d7/gebco_2021_n30.0_s-40.0_w-65.0_e20.0.nc','lon');
lat=ncread('/home/profdam/Downloads/INPUT_DATA/GEBCO_25_Feb_2022_f0994a0ab3d7/gebco_2021_n30.0_s-40.0_w-65.0_e20.0.nc','lat');
depth=ncread('/home/profdam/Downloads/INPUT_DATA/GEBCO_25_Feb_2022_f0994a0ab3d7/gebco_2021_n30.0_s-40.0_w-65.0_e20.0.nc','elevation');
depth=double(depth);
lon1x = -15; lon2x = 15; lat1y = -15; lat2y = 15; %gog
indlon = find(lon<=lon2x & lon>=lon1x); indlat = find(lat<=lat2y & lat>=lat1y);
lon1=lon(indlon); lat1=lat(indlat); depth1=depth(indlon,indlat);
pcolor(lon1,lat1,depth1'); shading flat;colorbar 

[X Y]=meshgrid(lon1,lat1);
%ssh_gog=scatteredInterpolant(X(:),Y(:),ssha(:));
%F = scatteredInterpolant(X(:),Y(:),Z(:));
%zGrid = ssh_gog(lon,lat);
%OR
dep_gog=griddata(X(:),Y(:),depth1(:),lon,lat);



load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
D=0;
%D=0;
% lonx_coteind=find(lonx_cotei<=(nanmax(lonx)+D)& lonx_cotei>=(nanmin(lonx)-D)...
%     & latx_cotei <=(nanmax(latx)+D)& latx_cotei >=(nanmin(latx)-D));

%lonx=aalon;latx=aalat;
lonx_coteind=find(lonx_cotei<=20 & lonx_cotei>=-20 & latx_cotei <=20 & latx_cotei >=-20);

% lonx_coteind=find(lonx_cotei<=(nanmax(lonx)+D/cosd(max(abs(latx)))) & lonx_cotei>=(nanmin(lonx)-D/cosd(max(abs(latx))))...
%     & latx_cotei <=(nanmax(latx)+D)& latx_cotei >=(nanmin(latx)-D));
 
lonx_cote=lonx_cotei(lonx_coteind);
latx_cote=latx_cotei(lonx_coteind);
% clear Area k ncst


[X Y]=meshgrid(Xlong,Ylat);X=double(X);Y=double(Y);
%ssh_gog=scatteredInterpolant(X(:),Y(:),ssha(:));
%F = scatteredInterpolant(X(:),Y(:),Z(:));
%zGrid = ssh_gog(lon,lat);
%OR

hs_2004=ENSEMBLE_hs(:,:,312); %hs_2004=hs_2004';
hs_select=griddata(X(:),Y(:),hs_2004(:),lonx_cote,latx_cote);
F = griddedInterpolant(X(:),Y(:),hs_2004(:));
hs_select1 = F(lonx_cote,latx_cote);

B=fillmissing(hs_select,'nearest');

dt = delaunayTriangulation(X(:),Y(:));
plot(lonx_cote,latx_cote,'.r')
axis equal
hold on
triplot(dt);
hold off



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hs_2004=ENSEMBLE_hs(:,:,312); %hs_2004=hs_2004'
nanLocations = isnan(hs_2004);
nanLinearIndexes = find(nanLocations);
nonNanLinearIndexes = setdiff(1:numel(hs_2004), nanLinearIndexes);
% Get the x,y,z of all other locations that are non nan.
[xGood, yGood] = ind2sub(size(hs_2004), nonNanLinearIndexes);
for index = 1 : length(nanLinearIndexes);
  thisLinearIndex = nanLinearIndexes(index);
  % Get the x,y,z location
  [x,y] = ind2sub(size(hs_2004), thisLinearIndex);
  % Get distances of this location to all the other locations
   distances = sqrt((x-xGood).^2 + (y - yGood) .^ 2); % + (z - zGood) .^ 2);
  [sortedDistances, sortedIndexes] = sort(distances, 'ascend');
  % The closest non-nan value will be located at index sortedIndexes(1)
  indexOfClosest = sortedIndexes(1);
  % Get the u value there.
  goodValue = hs_2004(xGood(indexOfClosest), yGood(indexOfClosest)); %, zGood(indexOfClosest));
  % Replace the bad nan value in u with the good value.
  hs_2004(x,y) = goodValue;
end
% u should be fixed now - no nans in it.
% Double check.  Sum of nans should be zero now.
nanLocations = isnan(hs_2004);
numberOfNans = sum(nanLocations(:))

load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
lonx_coteind=find(lonx_cotei<=20 & lonx_cotei>=-20 & latx_cotei <=20 & latx_cotei >=-20);
lonx_cote=lonx_cotei(lonx_coteind);
latx_cote=latx_cotei(lonx_coteind);

[X Y]=meshgrid(Xlong,Ylat);X=double(X);Y=double(Y);
hs_select=griddata(X(:),Y(:),hs_2004(:),lonx_cote,latx_cote);


%lon_f=final_select(:,1); lat_f=final_select(:,2);
indd=[];
for i=1:length(lat_f)
    ind=find(lonx_cote==lon_f(i) & latx_cote==lat_f(i));
    if length(ind)>1
        ind=ind(1);
    end
    indd=[indd ind];
end
hs_f=hs_select(indd);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hs_2004=ENSEMBLE_hs(:,:,312); %hs_2004=hs_2004'
tm_2004=ENSEMBLE_tm(:,:,312); 
dm_2004=ENSEMBLE_dm(:,:,312); 
nanLocations = isnan(ENSEMBLE_hs);
nanLinearIndexes = find(nanLocations);
nonNanLinearIndexes = setdiff(1:numel(ENSEMBLE_hs), nanLinearIndexes);
% Get the x,y,z of all other locations that are non nan.
[xGood, yGood, zGood] = ind2sub(size(ENSEMBLE_hs), nonNanLinearIndexes);
for index = 1 : length(nanLinearIndexes);
  thisLinearIndex = nanLinearIndexes(index);
  % Get the x,y,z location
  [x,y,z] = ind2sub(size(ENSEMBLE_hs), thisLinearIndex);
  % Get distances of this location to all the other locations
   distances = sqrt((x-xGood).^2 + (y - yGood) .^ 2 + (z - zGood) .^ 2); % + (z - zGood) .^ 2);
  [sortedDistances, sortedIndexes] = sort(distances, 'ascend');
  % The closest non-nan value will be located at index sortedIndexes(1)
  indexOfClosest = sortedIndexes(1);
  % Get the u value there.
  goodValue_hs = ENSEMBLE_hs(xGood(indexOfClosest), yGood(indexOfClosest), zGood(indexOfClosest)); %, zGood(indexOfClosest));
  goodValue_tm = ENSEMBLE_tm(xGood(indexOfClosest), yGood(indexOfClosest), zGood(indexOfClosest)); %, zGood(indexOfClosest));
  goodValue_dm = ENSEMBLE_dm(xGood(indexOfClosest), yGood(indexOfClosest), zGood(indexOfClosest)); %, zGood(indexOfClosest));

  % Replace the bad nan value in u with the good value.
  ENSEMBLE_hs(x,y,z) = goodValue_hs;
  ENSEMBLE_tm(x,y,z) = goodValue_tm;
  ENSEMBLE_dm(x,y,z) = goodValue_dm;

end
% u should be fixed now - no nans in it.
% Double check.  Sum of nans should be zero now.
nanLocations = isnan(hs_2004);
numberOfNans = sum(nanLocations(:))


hs = fillmissing(ENSEMBLE_hs,'linear','EndValues','nearest');
tm = fillmissing(ENSEMBLE_tm,'linear','EndValues','nearest');
dm = fillmissing(ENSEMBLE_dm,'linear','EndValues','nearest');

     
hs_2004=hs(:,:,300); %hs_2004=hs_2004'
tm_2004=tm(:,:,300);
dm_2004=dm(:,:,300);


load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
lonx_coteind=find(lonx_cotei<=20 & lonx_cotei>=-20 & latx_cotei <=20 & latx_cotei >=-20);
lonx_cote=lonx_cotei(lonx_coteind);
latx_cote=latx_cotei(lonx_coteind);

[X Y]=meshgrid(Xlong,Ylat);X=double(X);Y=double(Y);
hs_select=griddata(X(:),Y(:),hs_2004(:),lonx_cote,latx_cote,'nearest');
tm_select=griddata(X(:),Y(:),tm_2004(:),lonx_cote,latx_cote,'nearest');
dm_select=griddata(X(:),Y(:),dm_2004(:),lonx_cote,latx_cote,'nearest');

%mesh(X,Y,hs_2004), hold on, plot3(lonx_cote,latx_cote,hs_select,'o'), hold off


load('/home/profdam/Documents/PhD Project/Scripts/Adapted/Final_hs_select.mat', 'lat_f', 'lon_f')%lon_f=final_select(:,1); lat_f=final_select(:,2);
indd=[];
for i=1:length(lat_f)
    ind=find(lonx_cote==lon_f(i) & latx_cote==lat_f(i));
    if length(ind)>1
        ind=ind(1);
    end
    indd=[indd ind];
end
hs_f=hs_select(indd);
tm_f=tm_select(indd);
dm_f=dm_select(indd);

 

lonf=lon_f-1; latf=lat_f-1
inp =1; 
figure
m_proj('mercator','lon',[-20-inp 20+inp],'lat',[-20-inp 20+inp])
m_scatter(lonf,latf,70,hs_f','fill')
colormap('jet')
colorbar
cmin=min(hs_f);
cmax=max(hs_f);
caxis([cmin cmax]);
m_coast('patch',[.6 .6 .6])
% m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
m_grid('box','on')
title('HS')
xlabel('Longitude')
ylabel('Latitude')
 


z=hs_2004;
cmin=min(min(hs_2004)); cmax=max(max(hs_2004)); int=0.1; n= round((cmax-cmin)/int);
[X Y]=meshgrid(double(Xlong),double(Ylat));
z11=griddata(double(Xlong),double(Ylat),z',X,Y);
%m_proj('mercator','longitude',[-20 20],'latitude',[-20 20]);
m_proj('miller','lat',[-20 20],'lon',[-20 20]);% GoG lat and lon
hold on
m_pcolor(X,Y,z11); shading flat;
m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%m_stipple(X,Y,significant');
m_gshhs_h('patch',[0.5 0.5 0.5])
%m_usercoast('coast_name','color','k','linewidth',2);
m_coast('line','color',[0.5 0.5 0.5],'linewidth',6);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
clb=colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax);
caxis([cmin cmax]);
set(get(clb,'label'),'string','Chl A (mg.m^-^3 per year)');
%inflon1=-8;suplon1=9;inflat1=-5;suplat1=10;
%m_line([inflon1 suplon1 suplon1 inflon1 inflon1],[inflat1 inflat1 suplat1 suplat1 inflat1],'color','r','linestyle','-','linewidth',2);
title('Winter Mean Chl-Level in the GoG between 1993-2020','FontSize',13,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',13,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',13,'FontName','Times News Roman','FontWeight','Bold');












clear; clc
load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
D=2; 
% lonx_coteind=find(lonx_cotei<=(nanmax(lonx)+D/cosd(max(abs(latx)))) & lonx_cotei>=(nanmin(lonx)-D/cosd(max(abs(latx))))...
%     & latx_cotei <=(nanmax(latx)+D)& latx_cotei >=(nanmin(latx)-D));
lonx_coteind=find(lonx_cotei<=20 & lonx_cotei>=-20 & latx_cotei <=20 & latx_cotei >=-20);
 
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
load('/home/profdam/Documents/PhD Project/Scripts/Adapted/ENSEMBLE.mat')

[X1 Y1]=meshgrid(Xlong,Ylat);X=double(X1);Y=double(Y1);
lonx=X1(:);latx=Y1(:);
D=2;
lonx_cote=lon_f;
latx_cote=lat_f;
coastal_dist = NaN(1,length(latx_cote)); 
 
for j=1:length(lonx_cote)
    j;
    find_latlon= find(lonx>= lonx_cote(j)-D ...
        &  lonx<= lonx_cote(j)+D...
        & latx>= latx_cote(j)-D ...
        & latx<= latx_cote(j)+D);
 
    if isempty(find_latlon)==0
        X=lonx(find_latlon);
        Y=latx(find_latlon);
            % coastal_dist(j) =nanmin(deg2km(distance(latx(j),lonx(j),Y,X)));
        p2pdist=[];
        for icoast=1:length(find_latlon)
            p2pdist(icoast)=m_lldist([lonx_cote(j) X(icoast)],[latx_cote(j) Y(icoast)]);
        end
        ind=find(p2pdist==nanmin(p2pdist));
        if length(ind)>1
            ind=ind(1);
        end
        lon_c(j)=X(ind);lat_c(j)=Y(ind);
        ind2=find(X1==lon_c(j) & Y1=lat_c(j))

        coastal_dist(j) =nanmin(p2pdist);
    end
end


hs_2004=ENSEMBLE_hs(:,:,312); %hs_2004=hs_2004'
hs_select=griddata(double(X1(:)),double(Y1(:)),hs_2004(:),double(lon_c),double(lat_c),'nearest');

%%
load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
%load('/home/profdam/Downloads/DATASylvain/CoastlineHR.mat')
lonx_cotei = LONX_COTEB; clear LONX_COTEB LONX_COTEA %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; clear LATX_COTEB LATX_COTEA %ncst(:,2); %LATX_COTEB; 
D=2;
%D=0;
% lonx_coteind=find(lonx_cotei<=(nanmax(lonx)+D)& lonx_cotei>=(nanmin(lonx)-D)...
%     & latx_cotei <=(nanmax(latx)+D)& latx_cotei >=(nanmin(latx)-D));
 
lonx_coteind=find(lonx_cotei<=20 & lonx_cotei>= -20 & latx_cotei <=20 & latx_cotei >=-20);
 
lonx_cote=lonx_cotei(lonx_coteind);
latx_cote=latx_cotei(lonx_coteind);

def=lonx_coteind;
lonx_cote_reg=lonx_cote; latx_cote_reg=latx_cote;
%global loop to compute hs gradients
for i=1:length(def)
    
    %defind=12;
    defind=i;
%      figure
%      hold on
    %m_plot(lona(ship_shore),lata(ship_shore),'r+','markersize',10)
%      m_plot(lonx_cote_reg(defind),latx_cote_reg(defind),'r+','markersize',10)
    %Mr=5;
   
    Mr=2; %Radius of the circle (in Ã‚Â°) to select the coastline which direction will be estimated
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
    ang_coast(i)=atand(p(1));
    %tangline = [lon_shore min(lona); lat_shore min(lata)]; %min(lonx_cote) min(latx_cote)min(coast_fit X=[lona lata];
    
    %compute cross-shore direction to the coastline
    lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
    laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
%     m_plot(lonx_cote_sel,coast_fit,'r-')
end


%%
%     %m_plot(tangline(1,:), tangline(2,:),'k')
%       m_plot(lonx_norm,laty_norm ,'k')   % plot du crosshore section
    
    %select ENSEMBLE points in a rectangle around cross-shore axis
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
        %create points every 0.25Ã‚Â° along cross-shore axis
        lon_CSS=lonx_cote_reg(defind)+off*(0:0.5:2)*abs(cosd(ang_coast+90));
        lat_CSS=latx_cote_reg(defind)+(lon_CSS-lonx_cote_reg(defind))*tand(ang_coast+90);
%          m_plot(lon_CSS,lat_CSS,'r.','markersize',10)
%          m_coast('patch',[.6 .6 .6])
%          m_gshhs_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
%          m_grid('box','on')
         
        %regrid ENSEMBLE data around cross-shore axis
        if length(unique(lona(in)))>1 & length(unique(lata(in)))>1
            [lona2,lata2]=meshgrid(unique(lona(in)),unique(lata(in)));
            hsa2=nan(size(lona2));
            for iin=1:length(in)
                hsa2(lona2==lona(in(iin)) & lata2==lata(in(iin)))=hsa(in(iin));
            end
            
%             numb = length(find(isfinite(hsa2)));
            %interpolate ENSEMBLE points every 0.25Ã‚Â° along cross-shore axis
            hs_CSS=interp2(lona2,lata2,hsa2,lon_CSS,lat_CSS);
            CSS_coord=(0:0.5:2); % je dois calculer plutot la distance
%             
%             css_coord = ac_distance(lat_CSS,lon_CSS,latx_cote_reg(defind),lonx_cote_reg(defind)); % distance insert by ND 
%            
            def_CSS=find(isfinite(hs_CSS));
            %compute the coastal gradient by linear fit with at least 4
            %points
            if length(def_CSS)>=3 % reduire le nombre de points Ã¯Â¿Â½ 1
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
lon_css = [lon_css lon_CSS]; 
lat_css = [lat_css lat_CSS];
hs_mean = [hs_mean nanmean(hs_CSS)];
lon_mean = [lon_mean nanmean(lon_CSS)];
lat_mean = [lat_mean nanmean(lat_CSS)];
    else
        continue
    end
   
end
 



 