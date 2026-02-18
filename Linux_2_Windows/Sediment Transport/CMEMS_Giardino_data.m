% WAVE_GLO_PHY_SWH_L4_MY_014_007
%
% GLOBAL OCEAN L4 SIGNIFICANT WAVE HEIGHT FROM REPROCESSED SATELLITE MEASUREMENTS
% 
% Dataset : cmems_obs-wave_glo_phy-swh_my_multi-l4-2deg_P1D
% 
% Protocol : SUBS

clc;clear;
filename=('D:\Linux_2_Windows\Sediment Transport\Scripts_data\cmems_obs-wave_glo_phy-swh_my_multi-l4-2deg_P1D_1662470690827.nc');
time=double(ncread(filename,'time')+datenum(1950,1,1));
date=datevec(time);
hs1=ncread(filename,'VAVH_DAILY_MEAN');
hs=ncread(filename,'VAVH_INST');
lon=ncread(filename,'longitude');
lat=ncread(filename,'latitude');

%% Monthly average
v = double(time); %clear TIME time tm %datenum(1979, 1, 1):datenum(2005, 12, 31); % time vector
%d = HS; %rand(1,length(v)); % data vector

% calculate mean, 90th and 99th percentile values
dateV = datevec(v); % date vector
[~,~,b] = unique(dateV(:,1:2),'rows');
%% HS
aaa=reshape(hs1,[10*13 length(hs)]);
aab=[];
for i=1:130
    d=aaa(i,:);%d=d';
    monthly_d = accumarray(b,d,[],@nanmean);
    %monthly_d_99 = accumarray(b,d,[],@(x) prctile(x, 99));
    aab=[aab;monthly_d];
    %aab=[aab monthly_d_99];

end


CMEMS_Hs_2002_2005=reshape(aab,[48 13 10]);
CMEMS_Hs_2002_2005=permute(CMEMS_Hs_2002_2005,[2 3 1]);

clearvars -EXCEPT CMEMS_Hs_2002_2005 lon lat

%%
clear; close all; clc;


%%
filename=('D:\Linux_2_Windows\Wave_Giardino\waves_west_africa_currentsituation.nc');
%filename=('/home/profdam/Downloads/INPUT_DATA/Wave_Giardino/waves_west_africa_climatechange.nc');
ncdisp(filename)
lat=ncread(filename,'latitude');
lon=ncread(filename,'longitude');
date=ncread(filename,'time'); %aab=datevec(date);
hs=ncread(filename,'wave_height');
tm=ncread(filename,'wave_period');
dm=ncread(filename,'wave_direction');

%% Monthly average
v = double(date); %clear TIME time tm %datenum(1979, 1, 1):datenum(2005, 12, 31); % time vector
%d = HS; %rand(1,length(v)); % data vector

% calculate mean, 90th and 99th percentile values
dateV = datevec(v); % date vector
[~,~,b] = unique(dateV(:,1:2),'rows');
%% HS
aaa_hs=hs'; %reshape(hs,[10*13 length(hs)]);
aaa_tm=tm'; 
aaa_dm=dm'; 

aab_hs=[]; aab_tm=[]; aab_dm=[];
for i=1:344
    d_hs=aaa_hs(i,:);%d=d';
    d_tm=aaa_tm(i,:);
    d_dm=aaa_dm(i,:);
    
    monthly_d_hs = accumarray(b,d_hs,[],@nanmean);
    monthly_d_tm = accumarray(b,d_tm,[],@nanmean);
    monthly_d_dm = accumarray(b,d_dm,[],@nanmean);

    %monthly_d_99 = accumarray(b,d,[],@(x) prctile(x, 99));
    %aab=[aab;monthly_d];
    aab_hs=cat(2,aab_hs,monthly_d_hs);
    aab_tm=cat(2,aab_tm,monthly_d_tm);
    aab_dm=cat(2,aab_dm,monthly_d_dm);

    %aab=[aab monthly_d_99];

end
aab_hs=permute(aab_hs, [2 1]);
aab_tm=permute(aab_tm, [2 1]);
aab_dm=permute(aab_dm, [2 1]);

Giardino_1979_2005_hs=aab_hs(:,1:324);
Giardino_1979_2005_tm=aab_tm(:,1:324);
Giardino_1979_2005_dm=aab_dm(:,1:324);

%Giardino_1979_2005=reshape(aab,[432 344]);
%CMEMS_Hs_2002_2005=permute(CMEMS_Hs_2002_2005,[2 3 1]);

clearvars -EXCEPT Giardino_1979_2005_hs Giardino_1979_2005_dm Giardino_1979_2005_tm lon lat

