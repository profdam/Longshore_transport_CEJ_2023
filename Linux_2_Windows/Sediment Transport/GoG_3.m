% Example_2_NY: Mesh the New York region in high resolution
clearvars; clc; clear;

addpath(genpath('D:\Linux_2_Windows\OceanMesh2D-Projection/utilities/'))
addpath(genpath('D:\Linux_2_Windows\OceanMesh2D-Projection/datasets/'))
addpath(genpath('D:\Linux_2_Windows\OceanMesh2D-Projection/m_map/'))

%% STEP 1: Set mesh extents and set parameters for mesh.
bbox = [-8.5 15.5;		% lon_min lon_max
        -2.5 15.5]; 		% lat_min lat_max
min_el    = 1e3;  		% minimum resolution in meters.
max_el    = 100e3; 		% maximum resolution in meters. 
max_el_ns = 5e3;        % maximum resolution nearshore in meters.
dt        = 2;          % Encourage mesh to be stable at a 2 s timestep
grade     = 0.35;       % Mesh grade in decimal percent.
R         = 3;          % Number of elements to resolve feature width.
%% STEP 2: Specify geographical datasets and process the geographical data 
%% to be used later with other OceanMesh classes.
coastline = 'D:\Linux_2_Windows\gshhg-shp-2.3.7\GSHHS_shp\f/GSHHS_f_L1';
%dem       = 'D:\Linux_2_Windows\OceanMesh2D-Projection/datasets/RTopo-2.0.1_30_water_depth.nc';
dem       = 'D:\GEBCO\GEBCO_25_Aug_2022_27a223bddf91\gebco_2022_n15.0_s-15.0_w-15.0_e15.0.nc';
gdat = geodata('shp',coastline,...
               'dem',dem,...
               'bbox',bbox,...
               'h0',min_el); 
%% STEP 3: Create an edge function class.
fh = edgefx('geodata',gdat,...
            'fs',R,'max_el_ns',max_el_ns,...
            'max_el',max_el,'dt',dt,'g',grade);
%% STEP 4: Pass your edgefx class object along with some meshing options and
% build the mesh...
mshopts = meshgen('ef',fh,'bou',gdat,'proj','utm','plot_on',1);
mshopts = mshopts.build; 
%% STEP 5: Plot it and write a triangulation fort.14 compliant file to disk.
% Get out the msh class and put on bathy and nodestrings
m = mshopts.grd;
m = interp(m,gdat,'mindepth',1); % interpolate bathy to the mesh with minimum depth of 1 m
m = make_bc(m,'delete',gdat,'depth',5);  % make the nodestring boundary conditions 
                                 % with min depth of 5 m on open boundary
plot(m,'bd'); plot(m,'blog');    % plot triangulation, and bathy on log scale

                                 %write(m,'NY_HR');                % write to ADCIRC compliant ascii file

%% Convert lat/lon vectors into UTM coordinates (WGS84)

lon=m.p(:,1);
lat=m.p(:,2);
bath=m.b;
nodes=m.t;
[x,y,utmzone] = deg2utm(lat,lon);

%% Preparing in SMS consistent manner
% Nodes of Triangles

a = 1 : 16960;a=a'; %10618 17486
B = repmat(nan,[1, length(a)]);
for k = 1:length(B)
  if isnan(B(k))
    C{k} = 'E3T';
  end
end
AA=string(C); AA=AA';

%% Vertices without bathymethry

a = 1 : 10280;a=a'; %10618
B = repmat(nan,[1, length(a)]);
for k = 1:length(B)
  if isnan(B(k))
    C{k} = 'ND';
  end
end
AA=string(C); AA=AA';

%% Open boundary points

a = 1 : 56;a=a'; %10618
B = repmat(nan,[1, length(a)]);
for k = 1:length(B)
  if isnan(B(k))
    C{k} = 'NS';
  end
end
AA=string(C); AA=AA';


%% Extracting the open boundary

aa=m.p(:,1);
ab=m.p(:,2);
aaa=round(aa,2);
aab=round(ab,2);
aind=find(aaa<=-15 | aab<=-15);
xlon=aa(aind);ylat=ab(aind);
plot(m,'bd'); hold on; plot(xlon,ylat,'dm')

%%
indlon=[7889;8159;8158;8128;7869;7612;7611;7307;6983;6676;6676;6676;6985;7309;7614;7874;4407;4408;4793;4792;4407;4407;...
3768;4138;4534;4887;5230;5560;5881;6219;6227;6595;6596;6228;6229;5892;5886;5570;5569;5243;4903;4556;4170;3809;3460;3150;...
2945;2786;2787;2794;2953;2955;2796;2672;2559;2564;2677;2801;2959;3155;3156;3159;3161;3162;2943;2942;2941;2785;2720;2599;...
2480;2354;2238;2122;2006;1900;1806;1704;1845;1846;1847;1940;2038;2147;2148;2149;2157;2152;2155;2156;2154;2153;2051];

indlon=[1,2051,1704,98,273,669,721,729,1285,1360,2317,2658,3063,6520,7874,6986,8158,7897,7903,9674]
aalon=lat(indlon);
aalat=lat(indlon);

plot(m,'bd'); % plot triangulation, and bathy on log scale
hold on
plot(aalon,aalat,'ro');
