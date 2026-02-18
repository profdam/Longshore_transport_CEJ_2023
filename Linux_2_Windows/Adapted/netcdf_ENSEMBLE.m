%% begin programm
clc;
clear;
close all;

%% read simulation files
dir_out_mat = '/home/profdam/Downloads/DATASylvain/Test';

    
%% create filename, varname,etc
filename = 'ENSEMBLE.nc';

varname1 = 'ENSEMBLE_hs';
varname2 = 'ENSEMBLE_tm';
varname3 = 'ENSEMBLE_dm';
varname4 = 'Ylat';
varname5 = 'Xlong';

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nccreate([dir_out_mat filename],varname1,...
    'Dimensions',{'longitude' length(Xlong) 'latitude' length(Ylat) 'time' 312},...
     'Datatype','double',...
    'Format','netcdf4',...
    'FillValue','disable',...
    'ChunkSize',[length(Xlong) length(Ylat) 312]);

nccreate([dir_out_mat filename],varname2,...
    'Dimensions',{'longitude' length(Xlong) 'latitude' length(Ylat) 'time' 312},...
     'Datatype','double',...
    'Format','netcdf4',...
    'FillValue','disable',...
    'ChunkSize',[length(Xlong) length(Ylat) 312]);

nccreate([dir_out_mat filename],varname3,...
    'Dimensions',{'longitude' length(Xlong) 'latitude' length(Ylat) 'time' 312},...
     'Datatype','double',...
    'Format','netcdf4',...
    'FillValue','disable',...
    'ChunkSize',[length(Xlong) length(Ylat) 312]);

nccreate([dir_out_mat filename],varname5,...
    'Dimensions',{'longitude' length(Xlong)},...
     'Datatype','double',...
    'Format','netcdf4',...
    'FillValue','disable',...
    'ChunkSize',[length(Xlong)]);

nccreate([dir_out_mat filename],varname4,...
    'Dimensions',{'latitude' length(Ylat)},...
     'Datatype','double',...
    'Format','netcdf4',...
    'FillValue','disable',...
    'ChunkSize',[length(Ylat)]);



%% Create a value attribute for variable
ncwriteatt([dir_out_mat filename],varname1,'standard_name','ENSEMBLE_hs');
ncwriteatt([dir_out_mat filename],varname1,'long_name','Significant Wave Height');
ncwriteatt([dir_out_mat filename],varname1,'units','metres');

ncwriteatt([dir_out_mat filename],varname2,'standard_name','ENSEMBLE_tm');
ncwriteatt([dir_out_mat filename],varname2,'long_name','Mean Wave Period');
ncwriteatt([dir_out_mat filename],varname2,'units','seconds');

ncwriteatt([dir_out_mat filename],varname3,'standard_name','ENSEMBLE_dm');
ncwriteatt([dir_out_mat filename],varname3,'long_name','Mean Wave Direction');
ncwriteatt([dir_out_mat filename],varname3,'units','Degree North');

ncwriteatt([dir_out_mat filename],varname4,'standard_name','latitude');
ncwriteatt([dir_out_mat filename],varname4,'long_name','Latitude');
ncwriteatt([dir_out_mat filename],varname4,'units','degrees_north');

ncwriteatt([dir_out_mat filename],varname5,'standard_name','longitude');
ncwriteatt([dir_out_mat filename],varname5,'long_name','Longitude');
ncwriteatt([dir_out_mat filename],varname5,'units','degrees_east');


%% Create a global attribute
ncwriteatt([dir_out_mat filename],'/','written_and_modified_by','Adeola');
ncwriteatt([dir_out_mat filename],'/','contact','dahunsi.adeola@yahoo.com');
%ncwriteatt([dir_out_mat filename],'/','creation_date',datestr(now));
ncwriteatt([dir_out_mat filename],'/','creation_date',datevec('25-Feb-2022 14:27:19'));

%% write a value of varname
ncwrite([dir_out_mat filename],varname1,ENSEMBLE_hs);
ncwrite([dir_out_mat filename],varname2,ENSEMBLE_tm);
ncwrite([dir_out_mat filename],varname3,ENSEMBLE_dm);
ncwrite([dir_out_mat filename],varname4,Ylat);
ncwrite([dir_out_mat filename],varname5,Xlong);


%% checking of last operation
clc;
ncdisp([dir_out_mat filename]);
