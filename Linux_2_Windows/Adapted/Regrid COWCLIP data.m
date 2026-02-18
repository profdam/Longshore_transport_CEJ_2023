% Flip models to agree with ERA5

ACCESS1_0_dm_1979_2004=fliplr(ACCESS1_0_dm_1979_2004);
ACCESS1_0_tm_1979_2004=fliplr(ACCESS1_0_tm_1979_2004);
ACCESS1_0_hs_1979_2004=fliplr(ACCESS1_0_hs_1979_2004);

BCC_CSM1_1_dm_1979_2004=fliplr(BCC_CSM1_1_dm_1979_2004);
BCC_CSM1_1_tm_1979_2004=fliplr(BCC_CSM1_1_tm_1979_2004);
BCC_CSM1_1_hs_1979_2004=fliplr(BCC_CSM1_1_hs_1979_2004);

CNRM_CM5_dm_1979_2004=fliplr(CNRM_CM5_dm_1979_2004);
CNRM_CM5_tm_1979_2004=fliplr(CNRM_CM5_tm_1979_2004);
CNRM_CM5_hs_1979_2004=fliplr(CNRM_CM5_hs_1979_2004);

GFDL_CM3_dm_1979_2004=fliplr(GFDL_CM3_dm_1979_2004);
GFDL_CM3_tm_1979_2004=fliplr(GFDL_CM3_tm_1979_2004);
GFDL_CM3_hs_1979_2004=fliplr(GFDL_CM3_hs_1979_2004);

HADGEM2_ES_dm_1979_2004=fliplr(HADGEM2_ES_dm_1979_2004);
HADGEM2_ES_tm_1979_2004=fliplr(HADGEM2_ES_tm_1979_2004);
HADGEM2_ES_hs_1979_2004=fliplr(HADGEM2_ES_hs_1979_2004);

INM_CM4_dm_1979_2004=fliplr(INM_CM4_dm_1979_2004);
INM_CM4_tm_1979_2004=fliplr(INM_CM4_tm_1979_2004);
INM_CM4_hs_1979_2004=fliplr(INM_CM4_hs_1979_2004);

MIROC5_dm_1979_2004=fliplr(MIROC5_dm_1979_2004);
MIROC5_tm_1979_2004=fliplr(MIROC5_tm_1979_2004);
MIROC5_hs_1979_2004=fliplr(MIROC5_hs_1979_2004);

MRI_CGCM3_dm_1979_2004=fliplr(MRI_CGCM3_dm_1979_2004);
MRI_CGCM3_tm_1979_2004=fliplr(MRI_CGCM3_tm_1979_2004);
MRI_CGCM3_hs_1979_2004=fliplr(MRI_CGCM3_hs_1979_2004);



%% Regrid all models at once
clear
load('/media/profdam/P.DAM/COWCLIP/CSIRO/All_models/COWCLIP_ERA5_Original_all_models_historical.mat')
aclat=flipud(Ylat);
qlon=[-20:0.5:20]; qlon=qlon'; %0 degrees and 360 degrees (180 east and west are the same). it is continuous
qlat=[-20:0.5:20]; qlat=flipud(qlat');
[QLON, QLAT] = ndgrid(qlon, qlat);
nhs = size(ACCESS1_0_dm_1979_2004,3);


ACCESS1_0_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
ACCESS1_0_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
ACCESS1_0_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

BCC_CSM1_1_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
BCC_CSM1_1_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
BCC_CSM1_1_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

CNRM_CM5_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
CNRM_CM5_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
CNRM_CM5_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

GFDL_CM3_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
GFDL_CM3_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
GFDL_CM3_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

HADGEM2_ES_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
HADGEM2_ES_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
HADGEM2_ES_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

INM_CM4_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
INM_CM4_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
INM_CM4_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

MIROC5_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
MIROC5_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
MIROC5_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

MRI_CGCM3_dm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
MRI_CGCM3_tm0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);
MRI_CGCM3_hs0p5_1979_2004= zeros(size(QLON,1), size(QLON,2), nhs);

for time = 1 : nhs
ACCESS1_0_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, ACCESS1_0_dm_1979_2004(:,:,time)', QLON, QLAT);
ACCESS1_0_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, ACCESS1_0_tm_1979_2004(:,:,time)', QLON, QLAT);
ACCESS1_0_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, ACCESS1_0_hs_1979_2004(:,:,time)', QLON, QLAT);
    
BCC_CSM1_1_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, BCC_CSM1_1_dm_1979_2004(:,:,time)', QLON, QLAT);
BCC_CSM1_1_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, BCC_CSM1_1_tm_1979_2004(:,:,time)', QLON, QLAT);
BCC_CSM1_1_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, BCC_CSM1_1_hs_1979_2004(:,:,time)', QLON, QLAT);
    
    CNRM_CM5_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, CNRM_CM5_dm_1979_2004(:,:,time)', QLON, QLAT);
    CNRM_CM5_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, CNRM_CM5_tm_1979_2004(:,:,time)', QLON, QLAT);
    CNRM_CM5_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, CNRM_CM5_hs_1979_2004(:,:,time)', QLON, QLAT);

    
GFDL_CM3_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, GFDL_CM3_dm_1979_2004(:,:,time)', QLON, QLAT);
GFDL_CM3_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, GFDL_CM3_tm_1979_2004(:,:,time)', QLON, QLAT);
GFDL_CM3_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, GFDL_CM3_hs_1979_2004(:,:,time)', QLON, QLAT);
    
HADGEM2_ES_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, HADGEM2_ES_dm_1979_2004(:,:,time)', QLON, QLAT);
HADGEM2_ES_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, HADGEM2_ES_tm_1979_2004(:,:,time)', QLON, QLAT);
HADGEM2_ES_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, HADGEM2_ES_hs_1979_2004(:,:,time)', QLON, QLAT);

INM_CM4_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, INM_CM4_dm_1979_2004(:,:,time)', QLON, QLAT);
INM_CM4_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, INM_CM4_tm_1979_2004(:,:,time)', QLON, QLAT);
INM_CM4_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, INM_CM4_hs_1979_2004(:,:,time)', QLON, QLAT);


MIROC5_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, MIROC5_dm_1979_2004(:,:,time)', QLON, QLAT);
MIROC5_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, MIROC5_tm_1979_2004(:,:,time)', QLON, QLAT);
MIROC5_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, MIROC5_hs_1979_2004(:,:,time)', QLON, QLAT);


MRI_CGCM3_dm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, MRI_CGCM3_dm_1979_2004(:,:,time)', QLON, QLAT);
MRI_CGCM3_tm0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, MRI_CGCM3_tm_1979_2004(:,:,time)', QLON, QLAT);
MRI_CGCM3_hs0p5_1979_2004(:,:,time) = interp2(Xlong, aclat, MRI_CGCM3_hs_1979_2004(:,:,time)', QLON, QLAT);
end


%% Produce ENSEMBLE of regrridded data
ENSEMBLE_hs = cat(4,ACCESS1_0_hs0p5_1979_2004,BCC_CSM1_1_hs0p5_1979_2004,CNRM_CM5_hs0p5_1979_2004,GFDL_CM3_hs0p5_1979_2004,HADGEM2_ES_hs0p5_1979_2004,INM_CM4_hs0p5_1979_2004,MIROC5_hs0p5_1979_2004,MRI_CGCM3_hs0p5_1979_2004);
ENSEMBLE_hs=nanmean(ENSEMBLE_hs,4);

ENSEMBLE_tm = cat(4,ACCESS1_0_tm0p5_1979_2004,BCC_CSM1_1_tm0p5_1979_2004,CNRM_CM5_tm0p5_1979_2004,GFDL_CM3_tm0p5_1979_2004,HADGEM2_ES_tm0p5_1979_2004,INM_CM4_tm0p5_1979_2004,MIROC5_tm0p5_1979_2004,MRI_CGCM3_tm0p5_1979_2004);
ENSEMBLE_tm=nanmean(ENSEMBLE_tm,4);

%ENSEMBLE_dm = cat(4,ACCESS1_0_dm0p5_1979_2004,BCC_CSM1_1_dm0p5_1979_2004,CNRM_CM5_dm0p5_1979_2004,GFDL_CM3_dm0p5_1979_2004,HADGEM2_ES_dm0p5_1979_2004,INM_CM4_dm0p5_1979_2004,MIROC5_dm0p5_1979_2004,MRI_CGCM3_dm0p5_1979_2004);
ENSEMBLE_dm = cat(4,ACCESS1_0_dm0p5_1979_2004,BCC_CSM1_1_dm0p5_1979_2004,CNRM_CM5_dm0p5_1979_2004,GFDL_CM3_dm0p5_1979_2004,HADGEM2_ES_dm0p5_1979_2004,INM_CM4_dm0p5_1979_2004,MIROC5_dm0p5_1979_2004,MRI_CGCM3_dm0p5_1979_2004);
ENSEMBLE_dm=nanmean(ENSEMBLE_dm,4);
