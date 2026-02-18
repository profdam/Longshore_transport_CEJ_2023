clear
clc
%% Validation with observation
clc;clear;
%load CMEMS data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\CMEMS_Hs_2002_2005.mat')
hs_cmems=CMEMS_Hs_2002_2005;
ind_c=~isnan(nanmean(hs_cmems,3));
hs_cmems=nanmean(nanmean(hs_cmems,1),2);
hs_cmems=permute(hs_cmems,[1 3 2]);
lon=double(lon); lat=double(lat);

clearvars -EXCEPT hs_cmems lon lat %ind_c

%load strutured data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\structured_ensemble_gog2.mat', 'ENSEMBLE_hs_hist', 'Xlong', 'Ylat')
hs_struct=ENSEMBLE_hs_hist(:,:,277:end);

[QLON, QLAT] = ndgrid(Xlong, Ylat);
[qlon, qlat] = ndgrid(lon, lat);

HS_hist=[];%TM_hist=[];DM_hist=[];
for i=1:48
% hs=hs_struct;
% ind=~isnan(nanmean(hs,3));
% hs_int=hs(ind);
% lon_int=QLON(ind);
% lat_int=QLAT(ind);

%Extract nearest to the coast
%  hs_select=griddata(lon_int,lat_int,hs_int,qlon,qlat,'nearest');
 
% F=scatteredInterpolant(lon_int,lat_int,hs_int,'nearest');
% hs_select=F(qlon,qlat);

%HS_hist=[HS_hist hs_select];
%hs_int=reshape(hs_struct,[241*181 48]);
hs_int=reshape(hs_struct(:,:,i),[241*181 1]);
hs_select=griddata(QLON(:),QLAT(:),hs_int(:),qlon(:),qlat(:),'nearest');
hs_select=reshape(hs_select,[10 13]);

HS_hist=cat(3,HS_hist,hs_select);

end

hs_struct=HS_hist;
hs_struct=nanmean(nanmean(hs_struct,1),2);
hs_struct=permute(hs_struct,[1 3 2]);
clearvars -EXCEPT hs_cmems hs_struct lon lat 


%load strutured data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_ensemble_gog.mat', 'ENSEMBLE_hs_hist', 'Xlong', 'Ylat')
hs_unstruct=ENSEMBLE_hs_hist(:,277:end);
[qlon, qlat] = ndgrid(lon, lat);
HS_hist=[];
for i=1:48
hs_select=griddata(Xlong,Ylat,hs_unstruct(:,i),qlon,qlat,'nearest');
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
% %Extract nearest to the coast
% hs_select=griddata(lon_int,lat_int,hs_int,qlon,qlat,'nearest');
% %HS_hist=[HS_hist hs_select];
% HS_hist=cat(3,HS_hist,hs_select);
hs_int=reshape(hs_struct(:,:,i),[241*181 1]);
hs_select=griddata(QLON(:),QLAT(:),hs_int(:,1),qlon(:),qlat(:),'nearest');
hs_select=reshape(hs_select,[344 344]);

HS_hist=cat(3,HS_hist,hs_select);

tm_int=reshape(tm_struct(:,:,i),[241*181 1]);
tm_select=griddata(QLON(:),QLAT(:),tm_int(:,1),qlon(:),qlat(:),'nearest');
tm_select=reshape(tm_select,[344 344]);

TM_hist=cat(3,TM_hist,tm_select);


dm_int=reshape(dm_struct(:,:,i),[241*181 1]);
dm_select=griddata(QLON(:),QLAT(:),dm_int(:,1),qlon(:),qlat(:),'nearest');
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

%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_grid_gog.mat')
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\unstructured_ensemble_gog.mat',...
    'ENSEMBLE_hs_hist', 'Xlong', 'Ylat', 'ENSEMBLE_dm_hist', 'ENSEMBLE_tm_hist')
hs_unstruct=ENSEMBLE_hs_hist;
tm_unstruct=ENSEMBLE_tm_hist;
dm_unstruct=ENSEMBLE_dm_hist;


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


plot(nanmean(hs_giard,1),'o-r'); hold on; plot(hs_unstruct,'*-k'); hold on; plot(hs_struct,'*-b');
