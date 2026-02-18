%Load data
clc; clear;
load('D:\Review Papers\Sediment Transport\Hs_Dm_Tm_Extracted/All_models_Mid21C_RCP4_5.mat');

%%
dm_ac=permute(dm_ac,[3 2 1]);
dm_bc=permute(dm_bc,[3 2 1]);
dm_cn=permute(dm_cn,[3 2 1]);
dm_gf=permute(dm_gf,[3 2 1]);
dm_ha=permute(dm_ha,[3 2 1]);
dm_in=permute(dm_in,[3 2 1]);
dm_mi=permute(dm_mi,[3 2 1]);
dm_mr=permute(dm_mr,[3 2 1]);


hs_ac=permute(hs_ac,[3 2 1]);
hs_bc=permute(hs_bc,[3 2 1]);
hs_cn=permute(hs_cn,[3 2 1]);
hs_gf=permute(hs_gf,[3 2 1]);
hs_ha=permute(hs_ha,[3 2 1]);
hs_in=permute(hs_in,[3 2 1]);
hs_mi=permute(hs_mi,[3 2 1]);
hs_mr=permute(hs_mr,[3 2 1]);

tm_ac=permute(tm_ac,[3 2 1]);
tm_bc=permute(tm_bc,[3 2 1]);
tm_cn=permute(tm_cn,[3 2 1]);
tm_gf=permute(tm_gf,[3 2 1]);
tm_ha=permute(tm_ha,[3 2 1]);
tm_in=permute(tm_in,[3 2 1]);
tm_mi=permute(tm_mi,[3 2 1]);
tm_mr=permute(tm_mr,[3 2 1]);

%% Select GoG
lat=round(lat); lon=round(lon);
ind_lon=find(lon>=-9 & lon<=16);
ind_lat=find(lat>=-3 & lat<=16); %Location of buoy in mid atlantic
Xlong=lon(ind_lon);
Ylat=lat(ind_lat);

dm_ac=dm_ac(ind_lon,ind_lat,:);
dm_bc=dm_bc(ind_lon,ind_lat,:);
dm_cn=dm_cn(ind_lon,ind_lat,:);
dm_gf=dm_gf(ind_lon,ind_lat,:);
dm_ha=dm_ha(ind_lon,ind_lat,:);
dm_in=dm_in(ind_lon,ind_lat,:);
dm_mi=dm_mi(ind_lon,ind_lat,:);
dm_mr=dm_mr(ind_lon,ind_lat,:);

tm_ac=tm_ac(ind_lon,ind_lat,:);
tm_bc=tm_bc(ind_lon,ind_lat,:);
tm_cn=tm_cn(ind_lon,ind_lat,:);
tm_gf=tm_gf(ind_lon,ind_lat,:);
tm_ha=tm_ha(ind_lon,ind_lat,:);
tm_in=tm_in(ind_lon,ind_lat,:);
tm_mi=tm_mi(ind_lon,ind_lat,:);
tm_mr=tm_mr(ind_lon,ind_lat,:);

hs_ac=hs_ac(ind_lon,ind_lat,:);
hs_bc=hs_bc(ind_lon,ind_lat,:);
hs_cn=hs_cn(ind_lon,ind_lat,:);
hs_gf=hs_gf(ind_lon,ind_lat,:);
hs_ha=hs_ha(ind_lon,ind_lat,:);
hs_in=hs_in(ind_lon,ind_lat,:);
hs_mi=hs_mi(ind_lon,ind_lat,:);
hs_mr=hs_mr(ind_lon,ind_lat,:);

%% Regrid all models at once
%aclat=flipud(Ylat);
% qlon=[-20:0.5:20]; %qlon=qlon'; %0 degrees and 360 degrees (180 east and west are the same). it is continuous
% qlat=[-20:0.5:20]; %qlat=(qlat');
% [QLON, QLAT] = ndgrid(qlon, qlat);
% nhs = size(hs_ac,3);

load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')
QLON = lon;
QLAT = lat;

nhs = size(hs_ac,3);

%%
ACCESS1_0_hs0p5_2026_2045= [];
ACCESS1_0_tm0p5_2026_2045= [];
ACCESS1_0_dm0p5_2026_2045= [];

BCC_CSM1_1_hs0p5_2026_2045= [];
BCC_CSM1_1_tm0p5_2026_2045= [];
BCC_CSM1_1_dm0p5_2026_2045= [];

CNRM_CM5_hs0p5_2026_2045= [];
CNRM_CM5_tm0p5_2026_2045= [];
CNRM_CM5_dm0p5_2026_2045= [];

GFDL_CM3_hs0p5_2026_2045= [];
GFDL_CM3_tm0p5_2026_2045= [];
GFDL_CM3_dm0p5_2026_2045= [];

HADGEM2_ES_hs0p5_2026_2045= [];
HADGEM2_ES_tm0p5_2026_2045= [];
HADGEM2_ES_dm0p5_2026_2045= [];

INM_CM4_hs0p5_2026_2045= [];
INM_CM4_tm0p5_2026_2045= [];
INM_CM4_dm0p5_2026_2045= [];

MIROC5_hs0p5_2026_2045= [];
MIROC5_tm0p5_2026_2045= [];
MIROC5_dm0p5_2026_2045= [];

MRI_CGCM3_hs0p5_2026_2045= [];
MRI_CGCM3_tm0p5_2026_2045= [];
MRI_CGCM3_dm0p5_2026_2045= [];

%%

for time = 1 : nhs
ACCESS1_0_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_ac(:,:,time)', QLON, QLAT);
ACCESS1_0_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_ac(:,:,time)', QLON, QLAT);
ACCESS1_0_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_ac(:,:,time)', QLON, QLAT);
    
BCC_CSM1_1_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_bc(:,:,time)', QLON, QLAT);
BCC_CSM1_1_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_bc(:,:,time)', QLON, QLAT);
BCC_CSM1_1_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_bc(:,:,time)', QLON, QLAT);
    
CNRM_CM5_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_cn(:,:,time)', QLON, QLAT);
CNRM_CM5_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_cn(:,:,time)', QLON, QLAT);
CNRM_CM5_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_cn(:,:,time)', QLON, QLAT);

GFDL_CM3_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_gf(:,:,time)', QLON, QLAT);
GFDL_CM3_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_gf(:,:,time)', QLON, QLAT);
GFDL_CM3_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_gf(:,:,time)', QLON, QLAT);
    
HADGEM2_ES_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_ha(:,:,time)', QLON, QLAT);
HADGEM2_ES_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_ha(:,:,time)', QLON, QLAT);
HADGEM2_ES_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_ha(:,:,time)', QLON, QLAT);

INM_CM4_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_in(:,:,time)', QLON, QLAT);
INM_CM4_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_in(:,:,time)', QLON, QLAT);
INM_CM4_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_in(:,:,time)', QLON, QLAT);

MIROC5_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_mi(:,:,time)', QLON, QLAT);
MIROC5_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_mi(:,:,time)', QLON, QLAT);
MIROC5_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_mi(:,:,time)', QLON, QLAT);

MRI_CGCM3_hs0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, hs_mr(:,:,time)', QLON, QLAT);
MRI_CGCM3_tm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, tm_mr(:,:,time)', QLON, QLAT);
MRI_CGCM3_dm0p5_2026_2045(:,:,time) = interp2(Xlong, Ylat, dm_mr(:,:,time)', QLON, QLAT);
end

Xlong=lon(:,1); Xlong=Xlong'; Ylat=lat(:,1);

%% Produce ENSEMBLE of regrridded data
ENSEMBLE_hs_Mid_4p5 = cat(4,ACCESS1_0_hs0p5_2026_2045,BCC_CSM1_1_hs0p5_2026_2045,CNRM_CM5_hs0p5_2026_2045,GFDL_CM3_hs0p5_2026_2045,HADGEM2_ES_hs0p5_2026_2045,INM_CM4_hs0p5_2026_2045,MIROC5_hs0p5_2026_2045,MRI_CGCM3_hs0p5_2026_2045);
ENSEMBLE_hs_Mid_4p5 =nanmean(ENSEMBLE_hs_Mid_4p5,4);

ENSEMBLE_tm_Mid_4p5 = cat(4,ACCESS1_0_tm0p5_2026_2045,BCC_CSM1_1_tm0p5_2026_2045,CNRM_CM5_tm0p5_2026_2045,GFDL_CM3_tm0p5_2026_2045,HADGEM2_ES_tm0p5_2026_2045,INM_CM4_tm0p5_2026_2045,MIROC5_tm0p5_2026_2045,MRI_CGCM3_tm0p5_2026_2045);
ENSEMBLE_tm_Mid_4p5 =nanmean(ENSEMBLE_tm_Mid_4p5,4);

ENSEMBLE_dm_Mid_4p5 = cat(4,ACCESS1_0_dm0p5_2026_2045,BCC_CSM1_1_dm0p5_2026_2045,CNRM_CM5_dm0p5_2026_2045,GFDL_CM3_dm0p5_2026_2045,HADGEM2_ES_dm0p5_2026_2045,INM_CM4_dm0p5_2026_2045,MIROC5_dm0p5_2026_2045,MRI_CGCM3_dm0p5_2026_2045);
ENSEMBLE_dm_Mid_4p5 =nanmean(ENSEMBLE_dm_Mid_4p5,4);

ENSEMBLE_hs_Mid_4p5 =permute(ENSEMBLE_hs_Mid_4p5 , [1 3 2]);
ENSEMBLE_tm_Mid_4p5 =permute(ENSEMBLE_tm_Mid_4p5 , [1 3 2]);
ENSEMBLE_dm_Mid_4p5 =permute(ENSEMBLE_dm_Mid_4p5 , [1 3 2]);

clearvars -EXCEPT ENSEMBLE_dm_hist ENSEMBLE_hs_hist ENSEMBLE_tm_hist...
    ENSEMBLE_dm_End_4p5 ENSEMBLE_hs_End_4p5 ENSEMBLE_tm_End_4p5...
    ENSEMBLE_dm_Mid_4p5 ENSEMBLE_hs_Mid_4p5 ENSEMBLE_tm_Mid_4p5...
    ENSEMBLE_dm_End_8p5 ENSEMBLE_hs_End_8p5 ENSEMBLE_tm_End_8p5 Xlong Ylat

%%
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat') 

[QLON, QLAT] = ndgrid(Xlong, Ylat);

HS_Mid_4p5=[];TM_Mid_4p5=[];DM_Mid_4p5=[];
for i=1:240
hs=ENSEMBLE_hs_Mid_4p5(:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=Xlong(ind);
lat_int=Ylat(ind); 

%Extract nearest to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
HS_Mid_4p5=[HS_Mid_4p5 hs_select];

tm=ENSEMBLE_tm_Mid_4p5(:,i);
ind=~isnan(tm);
tm_int=tm(ind);
lon_int=Xlong(ind);
lat_int=Ylat(ind); 

%Extract nearest to the coast
tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
TM_Mid_4p5=[TM_Mid_4p5 tm_select];

dm=ENSEMBLE_dm_Mid_4p5(:,i);
ind=~isnan(dm);
dm_int=dm(ind);
lon_int=Xlong(ind);
lat_int=Ylat(ind); 

%Extract nearest to the coast
dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
DM_Mid_4p5=[DM_Mid_4p5 dm_select];

end

clearvars -EXCEPT HS_hist TM_hist DM_hist...
    HS_Mid_4p5 TM_Mid_4p5 DM_Mid_4p5 lon_f lat_f


                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %DO NOT RUN THE CODE BELOW    %
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_1979_2005.mat','lon','lat')


hs_unstruct=ENSEMBLE_hs_Mid_4p5;
tm_unstruct=ENSEMBLE_tm_Mid_4p5;
dm_unstruct=ENSEMBLE_dm_Mid_4p5;

nhs = size(ENSEMBLE_hs_Mid_4p5,2);


[qlon, qlat] = ndgrid(lon, lat);
HS_hist=[]; TM_hist=[]; DM_hist=[];
for i=1:nhs
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


