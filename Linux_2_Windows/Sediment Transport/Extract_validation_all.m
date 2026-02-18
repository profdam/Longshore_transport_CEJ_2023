%Load historical data
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

%% Select GoG from the ensemble
lat=round(lat); lon=round(lon);
ind_lon=find(lon>=-9 & lon<=16);
ind_lat=find(lat>=-3 & lat<=16); %Location of buoy in mid atlantic
Xlong=lon(ind_lon);
Ylat=lat(ind_lat);

DM=DM(ind_lon,ind_lat,:);
TM=TM(ind_lon,ind_lat,:);
HS=HS(ind_lon,ind_lat,:);

%%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %           Regrid into structured grid               %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create strucured grid and Regrid all models at once

%aclat=flipud(Ylat);
qlon=[-8.5:0.1:15.5]; %qlon=qlon'; %0 degrees and 360 degrees (180 east and west are the same). it is continuous
qlat=[-2.5:0.1:15.5]; %qlat=(qlat');
[QLON, QLAT] = ndgrid(qlon, qlat);

%load structured grid from gridgen data
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\structured_grid_gog.mat')
% QLON = lon;
% QLAT = lat;

nhs = size(HS,3);

%% Holder for concatenation
HS_1979_2005= [];
TM_1979_2005= [];
DM_1979_2005= [];


%% Interpolation on the structured grids

for time = 1 : nhs
HS_1979_2005(:,:,time) = interp2(Xlong, Ylat, HS(:,:,time)', QLON, QLAT,'linear');
TM_1979_2005(:,:,time) = interp2(Xlong, Ylat, TM(:,:,time)', QLON, QLAT,'linear');
DM_1979_2005(:,:,time) = interp2(Xlong, Ylat, DM(:,:,time)', QLON, QLAT,'linear');
    
end
Xlong_struct=qlon;Ylat_struct=qlat;
ENSEMBLE_hs_struct=HS_1979_2005;
ENSEMBLE_tm_struct=TM_1979_2005;
ENSEMBLE_dm_struct=DM_1979_2005;

%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %           Regrid into unstructured grid             %
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load unstructured grids
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')
                
nhs = size(HS,3);

%% Holder for concatenation
HS_1979_2005= [];
TM_1979_2005= [];
DM_1979_2005= [];


%% Interpolation on the unstructured grids

for time = 1 : nhs
HS_1979_2005(:,:,time) = interp2(Xlong, Ylat, HS(:,:,time)', lon, lat,'linear');
TM_1979_2005(:,:,time) = interp2(Xlong, Ylat, TM(:,:,time)', lon, lat,'linear');
DM_1979_2005(:,:,time) = interp2(Xlong, Ylat, DM(:,:,time)', lon, lat,'linear');
    
end
Xlong_unstruct=lon;Ylat_unstruct=lat;
ENSEMBLE_hs_unstruct=permute(HS_1979_2005,[1 3 2]);
ENSEMBLE_tm_unstruct=permute(TM_1979_2005,[1 3 2]);
ENSEMBLE_dm_unstruct=permute(DM_1979_2005,[1 3 2]);
                
              
clearvars -EXCEPT ENSEMBLE_dm_unstruct ENSEMBLE_hs_unstruct ENSEMBLE_tm_unstruct...
    Xlong_unstruct Ylat_unstruct...
    ENSEMBLE_dm_struct ENSEMBLE_hs_struct ENSEMBLE_tm_struct...
    Xlong_struct Ylat_struct


%% Validation with observation
%clc;clear;
%load CMEMS data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\CMEMS_Hs_2002_2005_2.mat')
hs_cmems=CMEMS_Hs_2002_2005;
ind_c=~isnan(nanmean(hs_cmems,3));
hs_cmems=nanmean(nanmean(hs_cmems,1),2);
hs_cmems=permute(hs_cmems,[1 3 2]);
lon=double(lon); lat=double(lat);

%clearvars -EXCEPT hs_cmems lon lat ind_c

%load strutured data
% load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\structured_ensemble_gog2.mat', 'ENSEMBLE_hs_hist', 'Xlong', 'Ylat')
hs_struct=ENSEMBLE_hs_struct(:,:,277:end);

[QLON, QLAT] = ndgrid(Xlong_struct, Ylat_struct);
[qlon, qlat] = ndgrid(lon, lat);
qlon=qlon(ind_c);qlat=qlat(ind_c);

HS_hist=[];%TM_hist=[];DM_hist=[];
for i=1:48
hs=hs_struct(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract linear to the coast
 hs_select=griddata(lon_int,lat_int,hs_int,qlon,qlat,'linear');
 
% F=scatteredInterpolant(lon_int,lat_int,hs_int,'linear');
% hs_select=F(qlon,qlat);

%HS_hist=[HS_hist hs_select];
HS_hist=cat(3,HS_hist,hs_select);

end

hs_struct=HS_hist;
hs_struct=nanmean(nanmean(hs_struct,1),2);
hs_struct=permute(hs_struct,[1 3 2]);
%clearvars -EXCEPT hs_cmems hs_struct lon lat 


%load strutured data
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_ensemble_gog.mat', 'ENSEMBLE_hs_hist', 'Xlong', 'Ylat')
hs_unstruct=ENSEMBLE_hs_unstruct(:,277:end);
%[qlon, qlat] = ndgrid(lon, lat);
HS_hist=[];
for i=1:48
hs_select=griddata(Xlong_unstruct,Ylat_unstruct,hs_unstruct(:,i),qlon,qlat,'linear');
HS_hist=cat(3,HS_hist,hs_select);
end
hs_unstruct=HS_hist;
hs_unstruct=nanmean(nanmean(hs_unstruct,1),2);
hs_unstruct=permute(hs_unstruct,[1 3 2]);

% clearvars -EXCEPT hs_cmems hs_struct hs_unstruct...
%     ENSEMBLE_dm_struct ENSEMBLE_tm_struct ENSEMBLE_hs_struct Xlong_struct Ylat_struct...
%     ENSEMBLE_dm_unstruct ENSEMBLE_tm_unstruct ENSEMBLE_hs_unstruct Xlong_unstruct Ylat_unstruct


%% %% Validation with Giardino
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_1979_2005.mat')
% hs_giard=Giardino_1979_2005;
% lon_giard=lon;
% lat_giard=lat;

%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\structured_grid_gog.mat')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\structured_ensemble_gog2.mat', 'ENSEMBLE_hs_hist', 'Xlong', 'Ylat')
hs_giard_struct=ENSEMBLE_hs_struct;
tm_giard_struct=ENSEMBLE_tm_struct;
dm_giard_struct=ENSEMBLE_dm_struct;

[QLON, QLAT] = ndgrid(Xlong_struct, Ylat_struct);
%[qlon, qlat] = ndgrid(lon, lat);

HS_hist=[];TM_hist=[];DM_hist=[];
for i=1:324
hs=hs_giard_struct(:,:,i);
tm=tm_giard_struct(:,:,i);
dm=dm_giard_struct(:,:,i);

ind=~isnan(hs);
hs_int=hs(ind);
tm_int=tm(ind);
dm_int=dm(ind);

lon_int=QLON(ind);
lat_int=QLAT(ind);

%Extract linear to the coast
hs_select=griddata(lon_int,lat_int,hs_int,lon,lat,'linear');
tm_select=griddata(lon_int,lat_int,tm_int,lon,lat,'linear');
dm_select=griddata(lon_int,lat_int,dm_int,lon,lat,'linear');

%HS_hist=[HS_hist hs_select];
HS_hist=cat(3,HS_hist,hs_select);
TM_hist=cat(3,TM_hist,tm_select);
DM_hist=cat(3,DM_hist,dm_select);

end

hs_giard_struct=HS_hist;
hs_giard_struct=nanmean(nanmean(hs_giard_struct,1),2);
hs_giard_struct=permute(hs_giard_struct,[1 3 2]);

tm_giard_struct=TM_hist;
tm_giard_struct=nanmean(nanmean(tm_giard_struct,1),2);
tm_giard_struct=permute(tm_giard_struct,[1 3 2]);

dm_giard_struct=DM_hist;
dm_giard_struct=nanmean(nanmean(dm_giard_struct,1),2);
dm_giard_struct=permute(dm_giard_struct,[1 3 2]);

% lon_struct=Xlong;
% lat_struct=Ylat;
%%
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_ensemble_gog.mat', 'ENSEMBLE_hs_hist', 'Xlong', 'Ylat')
hs_giard_unstruct=ENSEMBLE_hs_unstruct;
tm_giard_unstruct=ENSEMBLE_tm_unstruct;
dm_giard_unstruct=ENSEMBLE_dm_unstruct;

%[qlon, qlat] = ndgrid(lon, lat);
HS_hist=[]; TM_hist=[]; DM_hist=[];

for i=1:324
hs_select=griddata(Xlong_unstruct,Ylat_unstruct,hs_giard_unstruct(:,i),lon,lat,'linear');
tm_select=griddata(Xlong_unstruct,Ylat_unstruct,tm_giard_unstruct(:,i),lon,lat,'linear');
dm_select=griddata(Xlong_unstruct,Ylat_unstruct,dm_giard_unstruct(:,i),lon,lat,'linear');

HS_hist=cat(3,HS_hist,hs_select);
TM_hist=cat(3,TM_hist,tm_select);
DM_hist=cat(3,DM_hist,dm_select);
end
hs_giard_unstruct=HS_hist;
hs_giard_unstruct=nanmean(nanmean(hs_giard_unstruct,1),2);
hs_giard_unstruct=permute(hs_giard_unstruct,[1 3 2]);

tm_giard_unstruct=TM_hist;
tm_giard_unstruct=nanmean(nanmean(tm_giard_unstruct,1),2);
tm_giard_unstruct=permute(tm_giard_unstruct,[1 3 2]);

dm_giard_unstruct=DM_hist;
dm_giard_unstruct=nanmean(nanmean(dm_giard_unstruct,1),2);
dm_giard_unstruct=permute(dm_giard_unstruct,[1 3 2]);

% lon_unstruct=Xlong;
% lat_unstruct=Ylat;

%%
clearvars -EXCEPT hs_giard hs_struct hs_unstruct hs_cmems...
    hs_giard_struct tm_giard_struct dm_giard_struct...
    hs_giard_unstruct tm_giard_unstruct dm_giard_unstruct...
    lon_giard Xlong_struct Xlong_unstruct...
    lat_giard Ylat_struct Ylat_unstruct





%% Load CMEMs data for comparison with regridded data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\CMEMS_Hs_2002_2005_2.mat')
hs_cmems=CMEMS_Hs_2002_2005;
ind_c=~isnan(nanmean(hs_cmems,3));
hs_cmems=nanmean(nanmean(hs_cmems,1),2);
hs_cmems=permute(hs_cmems,[1 3 2]);
lon=double(lon); lat=double(lat);

clearvars -EXCEPT hs_cmems lon lat...
    ENSEMBLE_dm_unstruct ENSEMBLE_hs_unstruct ENSEMBLE_tm_unstruct...
    Xlong_unstruct Ylat_unstruct...
    ENSEMBLE_dm_struct ENSEMBLE_hs_struct ENSEMBLE_tm_struct...
    Xlong_struct Ylat_struct%ind_c

%% Extract similar time and points for structured grid
hs_struct=ENSEMBLE_hs_struct(:,:,277:end);
hs_unstruct=ENSEMBLE_hs_unstruct(:,277:end);

[QLON, QLAT] = ndgrid(Xlong_struct, Ylat_struct);
[qlon, qlat] = ndgrid(double(lon), double(lat));

hs_select_struct=[];
hs_select_unstruct=[];

for time=1:48
hs=hs_struct(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);
HS_hist=griddata(lon_int,lat_int,hs_int,double(qlon),double(qlat),'linear');
hs_select_struct=cat(3,hs_select_struct,HS_hist);
end
%hs_select_struct(:,:,time) = interp2(Xlong_struct, Ylat_struct, hs_struct(:,:,time)', double(qlon),double(qlat),'linear');

for time=1:48
hs=hs_unstruct(:,:,i);
ind=~isnan(hs);
hs_int=hs(ind);
lon_int=QLON(ind);
lat_int=QLAT(ind);
aaa=scatteredInterpolant(Xlong_unstruct,Ylat_unstruct, hs_unstruct(:,1),'linear');

HS_hist=aaa(double(lon),double(lat));

hs_select_unstruct=cat(3,hs_select_unstruct,HS_hist);
end

hs_select_unstruct= scatteredInterpolant(Xlong_unstruct, Ylat_unstruct, hs_unstruct(:,1), double(qlon),double(qlat),'linear');
aaa=scatteredInterpolant(Xlong_unstruct,Ylat_unstruct, hs_unstruct(:,1),'linear');
hs_select_unstruct = aaa(double(qlon(:)),double(qlat(:)));
hs_select_unstruct=reshape(hs_select_unstruct,[13 10]);
%end
%%
hs_struct=nanmean(nanmean(hs_struct,1),2);
hs_struct=permute(hs_struct,[1 3 2]);
clearvars -EXCEPT hs_cmems hs_struct lon lat 

%%
%load unstrutured data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_ensemble_gog.mat', 'ENSEMBLE_hs_hist', 'Xlong', 'Ylat')
hs_unstruct=ENSEMBLE_hs_hist(:,277:end);
[qlon, qlat] = ndgrid(lon, lat);
HS_hist=[];
for i=1:48
hs_select=griddata(Xlong,Ylat,hs_unstruct(:,i),qlon,qlat,'linear');
HS_hist=cat(3,HS_hist,hs_select);
end
hs_unstruct=HS_hist;
hs_unstruct=nanmean(nanmean(hs_unstruct,1),2);
hs_unstruct=permute(hs_unstruct,[1 3 2]);
clearvars -EXCEPT hs_cmems hs_struct hs_unstruct

%% %% Validation with Giardino
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_1979_2005.mat')
hs_giard=Giardino_1979_2005_hs;
tm_giard=Giardino_1979_2005_tm;
dm_giard=Giardino_1979_2005_dm;
lon_giard=lon;
lat_giard=lat;

%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\structured_grid_gog.mat')
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\structured_ensemble_gog2.mat',...
    'ENSEMBLE_hs_hist', 'Xlong', 'Ylat', 'ENSEMBLE_dm_hist', 'ENSEMBLE_tm_hist')
hs_struct=ENSEMBLE_hs_hist;
tm_struct=ENSEMBLE_tm_hist;
dm_struct=ENSEMBLE_dm_hist;

[QLON, QLAT] = ndgrid(Xlong, Ylat);
[qlon, qlat] = ndgrid(lon, lat);

HS_hist=[];TM_hist=[];DM_hist=[];
for i=1:324
% hs=hs_struct(:,:,i);
% ind=~isnan(hs);
% hs_int=hs(ind);
% lon_int=QLON(ind);
% lat_int=QLAT(ind);
% 
% %Extract linear to the coast
% hs_select=griddata(lon_int,lat_int,hs_int,qlon,qlat,'linear');
% %HS_hist=[HS_hist hs_select];
% HS_hist=cat(3,HS_hist,hs_select);
hs_int=reshape(hs_struct(:,:,i),[241*181 1]);
hs_select=griddata(QLON(:),QLAT(:),hs_int(:,1),qlon(:),qlat(:),'linear');
hs_select=reshape(hs_select,[344 344]);

HS_hist=cat(3,HS_hist,hs_select);

tm_int=reshape(tm_struct(:,:,i),[241*181 1]);
tm_select=griddata(QLON(:),QLAT(:),tm_int(:,1),qlon(:),qlat(:),'linear');
tm_select=reshape(tm_select,[344 344]);

TM_hist=cat(3,TM_hist,tm_select);


dm_int=reshape(dm_struct(:,:,i),[241*181 1]);
dm_select=griddata(QLON(:),QLAT(:),dm_int(:,1),qlon(:),qlat(:),'linear');
dm_select=reshape(dm_select,[344 344]);

DM_hist=cat(3,DM_hist,dm_select);

end

hs_struct=HS_hist;
% hs_struct=nanmean(nanmean(hs_struct,1),2);
% hs_struct=permute(hs_struct,[1 3 2]);

tm_struct=TM_hist;
% tm_struct=nanmean(nanmean(tm_struct,1),2);
% tm_struct=permute(tm_struct,[1 3 2]);

dm_struct=DM_hist;
% dm_struct=nanmean(nanmean(dm_struct,1),2);
% dm_struct=permute(dm_struct,[1 3 2]);
lon_struct=Xlong;
lat_struct=Ylat;
