%% Read and Extract variables from ERA5_1979_2019_Monthly averaged reanalysis.nc
clc;clear;
myDir = '/home/profdam/Downloads/INPUT_DATA/ERA-5/Daily by Month'; %ERA-5'; %gets directory
myFiles = dir(fullfile(myDir,'*.nc')); %gets all .nc files in struct
%f_wave_period=[]; f_wave_height=[]; f_wave_direction=[]; f_wind_spv10=[]; f_wind_spu10=[];
HS =[]; DM=[]; TM=[];TIME=[]; %long=[];lat=[];
for i = 1:12 %length(myFiles)
%Read NETCDF files
baseFileName = myFiles(i).name;
fullFileName = fullfile(myDir, baseFileName);
fprintf(1, 'Now reading %s\n', fullFileName);
%ncdisp(fullFileName);
%%For single files
%fullFileName= 'F:\ECMWF\1980_adaptor.mars.internal-1608192478.5641263-31724-7-25904c3d-f1ee-4682-ad23-74f90132cbe0.nc'
%fullFileName= 'F:\ECMWF\ERA5_1979_2019_Monthly averaged reanalysis by hour of day.nc'
%ncdisp (fullFileName)
Xlong=ncread(fullFileName,'longitude');
Ylat=ncread(fullFileName,'latitude');
time=ncread(fullFileName,'time')/24+datenum(1900,1,1);
tm=ncread(fullFileName,'mwp');
% hs=ncread(fullFileName,'swh'); 
% dm=ncread(fullFileName,'mwd');
 TIME=[TIME;time];
% HS=cat(3,HS,hs);
% DM=cat(3,DM,dm);
TM=cat(3,TM,tm);

% tmp=ncread(fullFileName,'pp1d');
%DATE=datevec(double(time));
%tm=permute(tm,[1 2 4 3]);
%hs=permute(hs,[1 2 4 3]);
%dm=permute(dm,[1 2 4 3]);
%tmp=permute(tmp,[1 2 4 3]);

% tm=ncread(fullFileName,'mwp');tm=permute(tm,[1 2 4 3]);
% hs=ncread(fullFileName,'swh'); hs=permute(hs,[1 2 4 3]);
% dm=ncread(fullFileName,'mwd'); dm=permute(dm,[1 2 4 3]);
% tmp=ncread(fullFileName,'pp1d');tmp=permute(tmp,[1 2 4 3]);
% 
% tm=nanmean(tm,4);
% hs=nanmean(hs,4);
% dm=nanmean(dm,4);
% tmp=nanmean(tmp,4);
% 

%v10=ncread(fullFileName,'v10'); 
%u10=ncread(fullFileName,'u10');

%% Concatenate the variables
% f_wave_period=[f_wave_period wave_period]; f_wave_height=[f_wave_height wave_height]; 
% f_wave_direction=[f_wave_direction wave_direction]; f_wind_spv10=[f_wind_spv10 wind_spv10]; 
% f_wind_spu10=[f_wind_spu10 wind_spu10];
%% Concatenate using cat
% f_wave_period=cat(3, f_wave_period, wave_period); f_wave_height=cat(3, f_wave_height, wave_height); 
% f_wave_direction=cat(3, f_wave_direction, wave_direction); f_wind_spv10=cat (3, f_wind_spv10, wind_spv10); 
% f_wind_spu10=cat(3, f_wind_spu10, wind_spu10);
end


%% 99th Percentile
v = double(TIME); %clear TIME time tm %datenum(1979, 1, 1):datenum(2005, 12, 31); % time vector
%d = HS; %rand(1,length(v)); % data vector

% calculate mean, 90th and 99th percentile values
dateV = datevec(v); % date vector
[~,~,b] = unique(dateV(:,1:2),'rows');
%% TM
aaa=reshape(TM,[61*61 length(TM)]);
aab=[];
for i=1:3721 %length(aaa)
    d=aaa(i,:);%d=d';
    %monthly_d = accumarray(b,d,[],@mean);
    monthly_d_99 = accumarray(b,d,[],@(x) prctile(x, 99));
    %aab=[aab;monthly_d];
    aab=[aab monthly_d_99];

end

aac=reshape(aab,[325 61 61]);aac=permute(aac,[2 3 1]);

%% HS
aaa=reshape(HS,[61*61 length(HS)]);
aab=[];
for i=1:3721 %length(aaa)
    d=aaa(i,:);%d=d';
    %monthly_d = accumarray(b,d,[],@mean);
    monthly_d_99 = accumarray(b,d,[],@(x) prctile(x, 99));
    %aab=[aab;monthly_d];
    aab=[aab monthly_d_99];

end


aac=reshape(aab,[325 61 61]);aac=permute(aac,[2 3 1]);

%% DM
aaa=reshape(DM,[61*61 length(DM)]);
aab=[];
for i=1:3721 %length(aaa)
    d=aaa(i,:);%d=d';
    %monthly_d = accumarray(b,d,[],@mean);
    monthly_d_99 = accumarray(b,d,[],@(x) prctile(x, 99));
    %aab=[aab;monthly_d];
    aab=[aab monthly_d_99];

end


aac=reshape(aab,[325 61 61]);aac=permute(aac,[2 3 1]);

%%
v = double(TIME);%datenum(1979, 1, 1):datenum(2005, 12, 31); % time vector
d = tm; %rand(1,length(v)); % data vector

% calculate mean, 90th and 99th percentile values
dateV = datevec(v); % date vector
[~,~,b] = unique(dateV(:,1:2),'rows');
monthly_v = accumarray(b,v,[],@mean);
monthly_d = accumarray(b,d,[],@mean);

monthly_v_90 = accumarray(b,v,[],@(x) prctile(x, 90));
monthly_v_99 = accumarray(b,v,[],@(x) prctile(x, 99));
monthly_d_90 = accumarray(b,d,[],@(x) prctile(x, 90));
monthly_d_99 = accumarray(b,d,[],@(x) prctile(x, 99));

%% Mean
aaa=reshape(tm,[61*61 length(tm)]);
aab=[];
for i=1:3725 %length(aaa)
    d=aaa(i,:);
    monthly_d = accumarray(b,d,[],@mean);
    aab=[aab;monthly_d];
end


aac=reshape(aab,[325 61 61]);aac=permute(aac,[2 3 1]);


