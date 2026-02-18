%Load selected ensemble data: hist
clc;clear;
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_Hist.mat')


% Historical
n=1:12:324;
DM_hist_=[]; HS_hist_=[]; TM_hist_=[];

for i=1:length(n)
    m=n(i);
    
    HS_hist_n=HS_hist(:,[m:m+11]);
    HS_hist_y=nanmean(HS_hist_n,2);
    HS_hist_=[HS_hist_ HS_hist_y];
    
    TM_hist_n=TM_hist(:,[m:m+11]);
    TM_hist_y=nanmean(TM_hist_n,2);
    TM_hist_=[TM_hist_ TM_hist_y];
    
    DM_hist_n=DM_hist(:,[m:m+11]);
    DM_hist_y=nanmean(DM_hist_n,2);
    DM_hist_=[DM_hist_ DM_hist_y];
end
    
clearvars -EXCEPT DM_hist_ HS_hist_  TM_hist_ lon_f lat_f %Q_Mid_4p5 Q_Mid_8p5 Q_End_4p5 Q_End_8p5 lon_f lat_f

%% Mid RCP 4.5    
%Load selected ensemble data: Mid_4p5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE.mat', 'DM_Mid_4p5', 'HS_Mid_4p5', 'TM_Mid_4p5', 'lat_f', 'lon_f')

n=1:12:240;
DM_Mid_4p5_=[]; HS_Mid_4p5_=[]; TM_Mid_4p5_=[];

for i=1:length(n)
    m=n(i);
    
    HS_Mid_4p5_n=HS_Mid_4p5(:,[m:m+11]);
    HS_Mid_4p5_y=nanmean(HS_Mid_4p5_n,2);
    HS_Mid_4p5_=[HS_Mid_4p5_ HS_Mid_4p5_y];
    
    TM_Mid_4p5_n=TM_Mid_4p5(:,[m:m+11]);
    TM_Mid_4p5_y=nanmean(TM_Mid_4p5_n,2);
    TM_Mid_4p5_=[TM_Mid_4p5_ TM_Mid_4p5_y];
    
    DM_Mid_4p5_n=DM_Mid_4p5(:,[m:m+11]);
    DM_Mid_4p5_y=nanmean(DM_Mid_4p5_n,2);
    DM_Mid_4p5_=[DM_Mid_4p5_ DM_Mid_4p5_y];
end

clearvars -EXCEPT DM_hist_ HS_hist_  TM_hist_ ...
    DM_Mid_4p5_ HS_Mid_4p5_  TM_Mid_4p5_ 
    
%% Mid RCP 8.5    
%Load selected ensemble data: Mid_8p5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE.mat', 'DM_Mid_8p5', 'HS_Mid_8p5', 'TM_Mid_8p5', 'lat_f', 'lon_f')


n=1:12:240;
DM_Mid_8p5_=[]; HS_Mid_8p5_=[]; TM_Mid_8p5_=[];

for i=1:length(n)
    m=n(i);
    
    HS_Mid_8p5_n=HS_Mid_8p5(:,[m:m+11]);
    HS_Mid_8p5_y=nanmean(HS_Mid_8p5_n,2);
    HS_Mid_8p5_=[HS_Mid_8p5_ HS_Mid_8p5_y];
    
    TM_Mid_8p5_n=TM_Mid_8p5(:,[m:m+11]);
    TM_Mid_8p5_y=nanmean(TM_Mid_8p5_n,2);
    TM_Mid_8p5_=[TM_Mid_8p5_ TM_Mid_8p5_y];
    
    DM_Mid_8p5_n=DM_Mid_8p5(:,[m:m+11]);
    DM_Mid_8p5_y=nanmean(DM_Mid_8p5_n,2);
    DM_Mid_8p5_=[DM_Mid_8p5_ DM_Mid_8p5_y];
end

clearvars -EXCEPT  DM_hist_ HS_hist_  TM_hist_ ...
    DM_Mid_4p5_ HS_Mid_4p5_  TM_Mid_4p5_ ...
DM_Mid_8p5_ HS_Mid_8p5_  TM_Mid_8p5_     


%% End RCP 4.5    
%Load selected ensemble data: End_4p5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE.mat', 'DM_End_4p5', 'HS_End_4p5', 'TM_End_4p5', 'lat_f', 'lon_f')


n=1:12:240;
DM_End_4p5_=[]; HS_End_4p5_=[]; TM_End_4p5_=[];

for i=1:length(n)
    m=n(i);
    
    HS_End_4p5_n=HS_End_4p5(:,[m:m+11]);
    HS_End_4p5_y=nanmean(HS_End_4p5_n,2);
    HS_End_4p5_=[HS_End_4p5_ HS_End_4p5_y];
    
    TM_End_4p5_n=TM_End_4p5(:,[m:m+11]);
    TM_End_4p5_y=nanmean(TM_End_4p5_n,2);
    TM_End_4p5_=[TM_End_4p5_ TM_End_4p5_y];
    
    DM_End_4p5_n=DM_End_4p5(:,[m:m+11]);
    DM_End_4p5_y=nanmean(DM_End_4p5_n,2);
    DM_End_4p5_=[DM_End_4p5_ DM_End_4p5_y];
end

clearvars -EXCEPT  DM_hist_ HS_hist_  TM_hist_ ...
    DM_Mid_4p5_ HS_Mid_4p5_  TM_Mid_4p5_ ...
DM_Mid_8p5_ HS_Mid_8p5_  TM_Mid_8p5_ ...    
DM_End_4p5_ HS_End_4p5_  TM_End_4p5_     


%% End RCP 8.5    
%Load selected ensemble data: End_8p5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE.mat', 'DM_End_8p5', 'HS_End_8p5', 'TM_End_8p5', 'lat_f', 'lon_f')


n=1:12:240;
DM_End_8p5_=[]; HS_End_8p5_=[]; TM_End_8p5_=[];

for i=1:length(n)
    m=n(i);
    
    HS_End_8p5_n=HS_End_8p5(:,[m:m+11]);
    HS_End_8p5_y=nanmean(HS_End_8p5_n,2);
    HS_End_8p5_=[HS_End_8p5_ HS_End_8p5_y];
    
    TM_End_8p5_n=TM_End_8p5(:,[m:m+11]);
    TM_End_8p5_y=nanmean(TM_End_8p5_n,2);
    TM_End_8p5_=[TM_End_8p5_ TM_End_8p5_y];
    
    DM_End_8p5_n=DM_End_8p5(:,[m:m+11]);
    DM_End_8p5_y=nanmean(DM_End_8p5_n,2);
    DM_End_8p5_=[DM_End_8p5_ DM_End_8p5_y];
end
clearvars -EXCEPT  DM_hist_ HS_hist_  TM_hist_ ...
    DM_Mid_4p5_ HS_Mid_4p5_  TM_Mid_4p5_ ...
DM_Mid_8p5_ HS_Mid_8p5_  TM_Mid_8p5_ ...    
DM_End_4p5_ HS_End_4p5_  TM_End_4p5_ ...
DM_End_8p5_ HS_End_8p5_  TM_End_8p5_... 
lon_f lat_f

%% ERA5
%Load selected ensemble data: ERA5
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Selected_HS_TM_DM_ENSEMBLE_ERA5.mat', 'DM_ERA5', 'HS_ERA5', 'TM_ERA5', 'lat_f', 'lon_f')


n=1:12:516;
DM_ERA5_=[]; HS_ERA5_=[]; TM_ERA5_=[];

for i=1:length(n)
    m=n(i);
    
    HS_ERA5_n=HS_ERA5(:,[m:m+11]);
    HS_ERA5_y=nanmean(HS_ERA5_n,2);
    HS_ERA5_=[HS_ERA5_ HS_ERA5_y];
    
    TM_ERA5_n=TM_ERA5(:,[m:m+11]);
    TM_ERA5_y=nanmean(TM_ERA5_n,2);
    TM_ERA5_=[TM_ERA5_ TM_ERA5_y];
    
    DM_ERA5_n=DM_ERA5(:,[m:m+11]);
    DM_ERA5_y=nanmean(DM_ERA5_n,2);
    DM_ERA5_=[DM_ERA5_ DM_ERA5_y];
end



clearvars -EXCEPT  DM_hist_ HS_hist_  TM_hist_ ...
    DM_Mid_4p5_ HS_Mid_4p5_  TM_Mid_4p5_ ...
DM_Mid_8p5_ HS_Mid_8p5_  TM_Mid_8p5_ ...    
DM_End_4p5_ HS_End_4p5_  TM_End_4p5_ ...
DM_End_8p5_ HS_End_8p5_  TM_End_8p5_... 
DM_ERA5_ HS_ERA5_  TM_ERA5_... 
lon_f lat_f
