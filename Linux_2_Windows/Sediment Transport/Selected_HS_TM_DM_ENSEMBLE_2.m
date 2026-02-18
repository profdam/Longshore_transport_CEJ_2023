%Historical
%Load data
clc; clear;
%load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/ENSEMBLES_all_time_slices.mat', 'ENSEMBLE_dm_hist', 'ENSEMBLE_hs_hist', 'ENSEMBLE_tm_hist', 'Xlong', 'Ylat');
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_unstruct_struct3.mat', 'dm_unstruct', 'hs_unstruct', 'lat_giard', 'lon_giard', 'tm_unstruct')
ENSEMBLE_hs_hist=hs_unstruct; ENSEMBLE_tm_hist=tm_unstruct; ENSEMBLE_dm_hist=dm_unstruct;
Xlong=lon_giard; Ylat=lat_giard;

clearvars -EXCEPT ENSEMBLE_hs_hist ENSEMBLE_tm_hist ENSEMBLE_dm_hist Xlong Ylat lon_giard lat_giard


% Load Coastline data
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat') 
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat')
%%

[QLON, QLAT] = ndgrid(Xlong, Ylat);

HS_hist=[];TM_hist=[];DM_hist=[];
for i=1:324
hs=ENSEMBLE_hs_hist(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
HS_hist=[HS_hist hs_select];

tm=ENSEMBLE_tm_hist(:,:,i);
ind=~isnan(tm);
tm_int=tm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
TM_hist=[TM_hist tm_select];

dm=ENSEMBLE_dm_hist(:,:,i);
ind=~isnan(dm);
dm_int=dm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
DM_hist=[DM_hist dm_select];

end

clearvars -EXCEPT HS_hist TM_hist DM_hist lon_giard lat_giard

%% Mid21C RCP 4.5
%Load data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog_mid4_5.mat')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_unstruct_struct3.mat', 'lat_giard', 'lon_giard')

ENSEMBLE_hs_Mid_4p5=hs_unstruct; ENSEMBLE_tm_Mid_4p5=tm_unstruct; ENSEMBLE_dm_Mid_4p5=dm_unstruct;
Xlong=lon_giard; Ylat=lat_giard;


% Load Coastline data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat') 

[QLON, QLAT] = ndgrid(Xlong, Ylat);

HS_Mid_4p5=[];TM_Mid_4p5=[];DM_Mid_4p5=[];
for i=1:240
hs=ENSEMBLE_hs_Mid_4p5(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
HS_Mid_4p5=[HS_Mid_4p5 hs_select];

tm=ENSEMBLE_tm_Mid_4p5(:,:,i);
ind=~isnan(tm);
tm_int=tm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
TM_Mid_4p5=[TM_Mid_4p5 tm_select];

dm=ENSEMBLE_dm_Mid_4p5(:,:,i);
ind=~isnan(dm);
dm_int=dm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
DM_Mid_4p5=[DM_Mid_4p5 dm_select];

end

clearvars -EXCEPT HS_hist TM_hist DM_hist...
    HS_Mid_4p5 TM_Mid_4p5 DM_Mid_4p5 lon_giard lat_giard


%% Mid21C RCP 8.5
%Load data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog_mid8_5.mat')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_unstruct_struct3.mat', 'lat_giard', 'lon_giard')

ENSEMBLE_hs_Mid_8p5=hs_unstruct; ENSEMBLE_tm_Mid_8p5=tm_unstruct; ENSEMBLE_dm_Mid_8p5=dm_unstruct;
Xlong=lon_giard; Ylat=lat_giard;


% Load Coastline data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat') 

[QLON, QLAT] = ndgrid(Xlong, Ylat);

HS_Mid_8p5=[];TM_Mid_8p5=[];DM_Mid_8p5=[];
for i=1:240
hs=ENSEMBLE_hs_Mid_8p5(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
HS_Mid_8p5=[HS_Mid_8p5 hs_select];

tm=ENSEMBLE_tm_Mid_8p5(:,:,i);
ind=~isnan(tm);
tm_int=tm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
TM_Mid_8p5=[TM_Mid_8p5 tm_select];

dm=ENSEMBLE_dm_Mid_8p5(:,:,i);
ind=~isnan(dm);
dm_int=dm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
DM_Mid_8p5=[DM_Mid_8p5 dm_select];

end

clearvars -EXCEPT HS_hist TM_hist DM_hist...
    HS_Mid_4p5 TM_Mid_4p5 DM_Mid_4p5...
    HS_Mid_8p5 TM_Mid_8p5 DM_Mid_8p5 lon_giard lat_giard

%% End21C RCP 4.5
%Load data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog_end4_5.mat')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_unstruct_struct3.mat', 'lat_giard', 'lon_giard')

ENSEMBLE_hs_End_4p5=hs_unstruct; ENSEMBLE_tm_End_4p5=tm_unstruct; ENSEMBLE_dm_End_4p5=dm_unstruct;
Xlong=lon_giard; Ylat=lat_giard;


% Load Coastline data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat') 

[QLON, QLAT] = ndgrid(Xlong, Ylat);

HS_End_4p5=[];TM_End_4p5=[];DM_End_4p5=[];
for i=1:240
hs=ENSEMBLE_hs_End_4p5(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
HS_End_4p5=[HS_End_4p5 hs_select];

tm=ENSEMBLE_tm_End_4p5(:,:,i);
ind=~isnan(tm);
tm_int=tm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
TM_End_4p5=[TM_End_4p5 tm_select];

dm=ENSEMBLE_dm_End_4p5(:,:,i);
ind=~isnan(dm);
dm_int=dm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
DM_End_4p5=[DM_End_4p5 dm_select];

end

clearvars -EXCEPT HS_hist TM_hist DM_hist...
        HS_Mid_4p5 TM_Mid_4p5 DM_Mid_4p5...
    HS_Mid_8p5 TM_Mid_8p5 DM_Mid_8p5...
    HS_End_4p5 TM_End_4p5 DM_End_4p5 lon_giard lat_giard


%% End21C RCP 8.5
%Load data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog_end8_5.mat')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_unstruct_struct3.mat', 'lat_giard', 'lon_giard')

ENSEMBLE_hs_End_8p5=hs_unstruct; ENSEMBLE_tm_End_8p5=tm_unstruct; ENSEMBLE_dm_End_8p5=dm_unstruct;
Xlong=lon_giard; Ylat=lat_giard;


% Load Coastline data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat') 

[QLON, QLAT] = ndgrid(Xlong, Ylat);

HS_End_8p5=[];TM_End_8p5=[];DM_End_8p5=[];
for i=1:240
hs=ENSEMBLE_hs_End_8p5(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
HS_End_8p5=[HS_End_8p5 hs_select];

tm=ENSEMBLE_tm_End_8p5(:,:,i);
ind=~isnan(tm);
tm_int=tm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
TM_End_8p5=[TM_End_8p5 tm_select];

dm=ENSEMBLE_dm_End_8p5(:,:,i);
ind=~isnan(dm);
dm_int=dm(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract nearest to the coast
dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
DM_End_8p5=[DM_End_8p5 dm_select];

end

clearvars -EXCEPT HS_hist TM_hist DM_hist...
        HS_Mid_4p5 TM_Mid_4p5 DM_Mid_4p5...
    HS_Mid_8p5 TM_Mid_8p5 DM_Mid_8p5...
        HS_End_4p5 TM_End_4p5 DM_End_4p5...
    HS_End_8p5 TM_End_8p5 DM_End_8p5...
    lon_f lat_f
    

% %% ERA5
% %Load data
% load('/home/profdam/Downloads/INPUT_DATA/ERA-5/Monthly_averaged_1979_2021_correct.mat')
% 
% % Load Coastline data
% load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Coastal_points.mat') 
% 
% ENSEMBLE_hs_ERA5=hs; ENSEMBLE_tm_ERA5=tm; ENSEMBLE_dm_ERA5=dm;
% Xlong=double(Xlong); Ylat=double(Ylat);
% 
% [QLON, QLAT] = ndgrid(Xlong, Ylat);
% HS_ERA5=[];TM_ERA5=[];DM_ERA5=[];
% for i=1:516
% hs=ENSEMBLE_hs_ERA5(:,:,i);
% ind=~isnan(hs);
% hs_int=hs(ind);
% lon_int=QLON(ind);
% lat_int=QLAT(ind);
% 
% %Extract nearest to the coast
% hs_select=griddata(lon_int,lat_int,hs_int,lon_f,lat_f,'nearest');
% HS_ERA5=[HS_ERA5 hs_select];
% 
% tm=ENSEMBLE_tm_ERA5(:,:,i);
% ind=~isnan(tm);
% tm_int=tm(ind);
% lon_int=QLON(ind);
% lat_int=QLAT(ind);
% 
% %Extract nearest to the coast
% tm_select=griddata(lon_int,lat_int,tm_int,lon_f,lat_f,'nearest');
% TM_ERA5=[TM_ERA5 tm_select];
% 
% dm=ENSEMBLE_dm_ERA5(:,:,i);
% ind=~isnan(dm);
% dm_int=dm(ind);
% lon_int=QLON(ind);
% lat_int=QLAT(ind);
% 
% %Extract nearest to the coast
% dm_select=griddata(lon_int,lat_int,dm_int,lon_f,lat_f,'nearest');
% DM_ERA5=[DM_ERA5 dm_select];
% 
% end
% 
% 
% clearvars -EXCEPT HS_hist TM_hist DM_hist...
%         HS_Mid_4p5 TM_Mid_4p5 DM_Mid_4p5...
%     HS_Mid_8p5 TM_Mid_8p5 DM_Mid_8p5...
%         HS_End_4p5 TM_End_4p5 DM_End_4p5...
%     HS_ERA5 TM_ERA5 DM_ERA5...
%         HS_End_8p5 TM_End_8p5 DM_End_8p5...
%     lon_f lat_f
%     
% 
