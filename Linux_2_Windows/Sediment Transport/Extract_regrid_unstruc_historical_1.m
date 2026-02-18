%Load data
clc; clear;
load('D:\Review Papers\Sediment Transport\Hs_Dm_Tm_Extracted/All_models_historical.mat');

%% Create ensemble and Change time to the last dimension (lon lat time)dm_ac=permute(dm_ac,[3 2 1]);
DM=cat(4,dm_ac,dm_bc,dm_cn,dm_gf,dm_ha,dm_in,dm_mi,dm_mr);
DM=nanmean(DM,4);
DM=permute(DM,[3 2 1]);

HS=cat(4,hs_ac,hs_bc,hs_cn,hs_gf,hs_ha,hs_in,hs_mi,hs_mr);
HS=nanmean(HS,4);
HS=permute(HS,[3 2 1]);

TM=cat(4,tm_ac,tm_bc,tm_cn,tm_gf,tm_ha,tm_in,tm_mi,tm_mr);
TM=nanmean(TM,4);
TM=permute(TM,[3 2 1]);

%% Select GoG
lat=round(lat); lon=round(lon);
ind_lon=find(lon>=-9 & lon<=16);
ind_lat=find(lat>=-3 & lat<=16); %Location of buoy in mid atlantic
Xlong=lon(ind_lon);
Ylat=lat(ind_lat);

DM=DM(ind_lon,ind_lat,:);
TM=TM(ind_lon,ind_lat,:);
HS=HS(ind_lon,ind_lat,:);

%% Regrid all models at once
%load structured grid from gridgen data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')
QLON = lon;
QLAT = lat;

nhs = size(HS,3);

%%
HS_1979_2005= [];
TM_1979_2005= [];
DM_1979_2005= [];


%%

for time = 1 : nhs
HS_1979_2005(:,:,time) = interp2(Xlong, Ylat, HS(:,:,time)', QLON, QLAT,'nearest');
TM_1979_2005(:,:,time) = interp2(Xlong, Ylat, TM(:,:,time)', QLON, QLAT,'nearest');
DM_1979_2005(:,:,time) = interp2(Xlong, Ylat, DM(:,:,time)', QLON, QLAT,'nearest');
    
end
Xlong=lon(:,1); Xlong=Xlong'; Ylat=lat(:,1);

clearvars -EXCEPT HS_1979_2005 TM_1979_2005 DM_1979_2005...
ACCESS1_0_dm0p5_1979_2005 ACCESS1_0_hs0p5_1979_2005 ACCESS1_0_tm0p5_1979_2005...
    BCC_CSM1_1_dm0p5_1979_2005 BCC_CSM1_1_hs0p5_1979_2005 BCC_CSM1_1_tm0p5_1979_2005...
    CNRM_CM5_dm0p5_1979_2005 CNRM_CM5_hs0p5_1979_2005 CNRM_CM5_tm0p5_1979_2005...
    GFDL_CM3_dm0p5_1979_2005 GFDL_CM3_hs0p5_1979_2005 GFDL_CM3_tm0p5_1979_2005...
    HADGEM2_ES_dm0p5_1979_2005 HADGEM2_ES_hs0p5_1979_2005 HADGEM2_ES_tm0p5_1979_2005...
    INM_CM4_dm0p5_1979_2005 INM_CM4_hs0p5_1979_2005 INM_CM4_tm0p5_1979_2005...
    MIROC5_dm0p5_1979_2005 MIROC5_hs0p5_1979_2005 MIROC5_tm0p5_1979_2005...
    MRI_CGCM3_dm0p5_1979_2005 MRI_CGCM3_hs0p5_1979_2005 MRI_CGCM3_tm0p5_1979_2005...
    Xlong Ylat

%% Create the ensemble

ENSEMBLE_hs_hist=permute(HS_1979_2005, [1 3 2]);
ENSEMBLE_tm_hist=permute(TM_1979_2005, [1 3 2]);
ENSEMBLE_dm_hist=permute(DM_1979_2005, [1 3 2]);

clearvars -EXCEPT ENSEMBLE_dm_hist ENSEMBLE_hs_hist ENSEMBLE_tm_hist Xlong Ylat

%%
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat')
%%

%[QLON, QLAT] = ndgrid(Xlong, Ylat);

HS_hist=[];TM_hist=[];DM_hist=[];
for i=1:324
hs=ENSEMBLE_hs_hist(:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=Xlong(ind); 
lat_int=Ylat(ind); 

%Extract nearest to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
HS_hist=[HS_hist hs_select];

tm=ENSEMBLE_tm_hist(:,i);
ind=~isnan(tm);
tm_int=tm(ind);
lon_int=Xlong(ind); 
lat_int=Ylat(ind); 

%Extract nearest to the coast
tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
TM_hist=[TM_hist tm_select];

dm=ENSEMBLE_dm_hist(:,i);
ind=~isnan(dm);
dm_int=dm(ind);
lon_int=Xlong(ind); 
lat_int=Ylat(ind); 

%Extract nearest to the coast
dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
DM_hist=[DM_hist dm_select];

end

clearvars -EXCEPT HS_hist TM_hist DM_hist lon_f lat_f



                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %DO NOT RUN THE CODE BELOW    %
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')

% %load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')
% load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_ensemble_gog.mat',...
%     'ENSEMBLE_hs_hist', 'Xlong', 'Ylat', 'ENSEMBLE_dm_hist', 'ENSEMBLE_tm_hist')
hs_unstruct=ENSEMBLE_hs_hist;
tm_unstruct=ENSEMBLE_tm_hist;
dm_unstruct=ENSEMBLE_dm_hist;

nhs = size(ENSEMBLE_hs_hist,2);


[qlon, qlat] = ndgrid(lon, lat);
HS_hist=[]; TM_hist=[]; DM_hist=[];
for i=1:324
hs_select=griddata(Xlong,Ylat,hs_unstruct(:,i),qlon,qlat,'nearest');
HS_hist=cat(3,HS_hist,hs_select);

tm_select=griddata(Xlong,Ylat,tm_unstruct(:,i),qlon,qlat,'nearest');
TM_hist=cat(3,TM_hist,tm_select);

dm_select=griddata(Xlong,Ylat,dm_unstruct(:,i),qlon,qlat,'nearest');
DM_hist=cat(3,DM_hist,dm_select);

end
hs_unstruct=HS_hist;
% hs_unstruct=nanmean(nanmean(hs_unstruct,1),2);
% hs_unstruct=permute(hs_unstruct,[1 3 2]);

tm_unstruct=TM_hist;
% tm_unstruct=nanmean(nanmean(tm_unstruct,1),2);
% tm_unstruct=permute(tm_unstruct,[1 3 2]);

dm_unstruct=DM_hist;
% dm_unstruct=nanmean(nanmean(dm_unstruct,1),2);
% dm_unstruct=permute(dm_unstruct,[1 3 2]);

lon_unstruct=Xlong;
lat_unstruct=Ylat;


clearvars -EXCEPT hs_giard hs_struct hs_unstruct...
    tm_giard tm_struct tm_unstruct...
    dm_giard dm_struct dm_unstruct...
    lon_giard lon_struct lon_unstruct...
    lat_giard lat_struct lat_unstruct

