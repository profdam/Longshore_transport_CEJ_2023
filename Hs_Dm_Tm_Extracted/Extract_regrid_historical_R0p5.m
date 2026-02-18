%Load data
clc; clear;
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/All_models_historical.mat');

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
ind_lon=find(lon>=-20 & lon<=20);
ind_lat=find(lat>=-20 & lat<=20); %Location of buoy in mid atlantic
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
qlon=[-20:0.5:20]; %qlon=qlon'; %0 degrees and 360 degrees (180 east and west are the same). it is continuous
qlat=[-20:0.5:20]; %qlat=(qlat');
[QLON, QLAT] = ndgrid(qlon, qlat);
nhs = size(hs_ac,3);

%%
ACCESS1_0_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
ACCESS1_0_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
ACCESS1_0_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

BCC_CSM1_1_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
BCC_CSM1_1_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
BCC_CSM1_1_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

CNRM_CM5_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
CNRM_CM5_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
CNRM_CM5_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

GFDL_CM3_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
GFDL_CM3_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
GFDL_CM3_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

HADGEM2_ES_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
HADGEM2_ES_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
HADGEM2_ES_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

INM_CM4_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
INM_CM4_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
INM_CM4_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

MIROC5_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
MIROC5_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
MIROC5_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

MRI_CGCM3_hs0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
MRI_CGCM3_tm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);
MRI_CGCM3_dm0p5_1979_2005= zeros(size(QLON,1), size(QLON,2), nhs);

%%

for time = 1 : nhs
ACCESS1_0_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_ac(:,:,time)', QLON, QLAT);
ACCESS1_0_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_ac(:,:,time)', QLON, QLAT);
ACCESS1_0_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_ac(:,:,time)', QLON, QLAT);
    
BCC_CSM1_1_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_bc(:,:,time)', QLON, QLAT);
BCC_CSM1_1_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_bc(:,:,time)', QLON, QLAT);
BCC_CSM1_1_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_bc(:,:,time)', QLON, QLAT);
    
CNRM_CM5_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_cn(:,:,time)', QLON, QLAT);
CNRM_CM5_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_cn(:,:,time)', QLON, QLAT);
CNRM_CM5_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_cn(:,:,time)', QLON, QLAT);

GFDL_CM3_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_gf(:,:,time)', QLON, QLAT);
GFDL_CM3_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_gf(:,:,time)', QLON, QLAT);
GFDL_CM3_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_gf(:,:,time)', QLON, QLAT);
    
HADGEM2_ES_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_ha(:,:,time)', QLON, QLAT);
HADGEM2_ES_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_ha(:,:,time)', QLON, QLAT);
HADGEM2_ES_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_ha(:,:,time)', QLON, QLAT);

INM_CM4_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_in(:,:,time)', QLON, QLAT);
INM_CM4_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_in(:,:,time)', QLON, QLAT);
INM_CM4_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_in(:,:,time)', QLON, QLAT);

MIROC5_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_mi(:,:,time)', QLON, QLAT);
MIROC5_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_mi(:,:,time)', QLON, QLAT);
MIROC5_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_mi(:,:,time)', QLON, QLAT);

MRI_CGCM3_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_mr(:,:,time)', QLON, QLAT);
MRI_CGCM3_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_mr(:,:,time)', QLON, QLAT);
MRI_CGCM3_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_mr(:,:,time)', QLON, QLAT);
end

%% Not needed for historical
% 
% for time = 1 : 228
% BCC_CSM1_1_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_bc(:,:,time)', QLON, QLAT);
% BCC_CSM1_1_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_bc(:,:,time)', QLON, QLAT);
% BCC_CSM1_1_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_bc(:,:,time)', QLON, QLAT);
% 
% HADGEM2_ES_hs0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, hs_ha(:,:,time)', QLON, QLAT);
% HADGEM2_ES_tm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, tm_ha(:,:,time)', QLON, QLAT);
% HADGEM2_ES_dm0p5_1979_2005(:,:,time) = interp2(Xlong, Ylat, dm_ha(:,:,time)', QLON, QLAT);
% 
% end