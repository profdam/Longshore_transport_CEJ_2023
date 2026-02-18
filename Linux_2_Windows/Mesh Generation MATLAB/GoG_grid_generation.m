% Example_1_NZ: Mesh the South Island of New Zealand
clearvars; clc;

addpath(genpath('../utilities/'))
addpath(genpath('../datasets/'))
addpath(genpath('../m_map/'))

%% STEP 1: set mesh extents and set parameters for mesh.
bbox = [-10 15;		% lon_min lon_max
        -6 15]; 		% lat_min lat_max
min_el    = 1e3;  		% minimum resolution in meters.
max_el    = 100e3; 		% maximum resolution in meters. 
max_el_ns = 5e3;        % maximum resolution nearshore in meters.
grade     = 0.35; 		% mesh grade in decimal percent.
R         = 3;    		% number of elements to resolve feature width.
%% STEP 2: specify geographical datasets and process the geographical data 
%% to be used later with other OceanMesh classes...
%coastline = 'C:\Users\Prof. DAM\Downloads\MPhil Project\FVCOM\OceanMesh2D-Projection\gshhg-shp-2.3.7\GSHHS_shp\f\GSHHS_f_L1';
%coastline = 'C:\Users\Prof. DAM\Downloads\MPhil Project\FVCOM\OceanMesh2D-Projection\gshhg-shp-2.3.7\GSHHS_shp\l\GSHHS_l_L1'
coastline=̀̀̀̀̀̀̀̀̀̀̀̀̀̂/home/profdam/Documents/Mesh Generation MATLAB´
gdat = geodata('shp',coastline,'bbox',bbox,'h0',min_el);
plot(gdat,'shp')
%% STEP 3: create an edge function class
fh = edgefx('geodata',gdat,...
            'fs',R,'max_el_ns',max_el_ns,...
            'max_el',max_el,'g',grade);
%% STEP 4: Pass your edgefx class object along with some meshing options and
% build the mesh...
mshopts = meshgen('ef',fh,'bou',gdat,'plot_on',1,'nscreen',5,'proj','trans');
mshopts = mshopts.build; 

%% STEP 5: Plot it and write a triangulation fort.14 compliant file to disk.
% Get out the msh class and put on nodestrings
m = mshopts.grd;
m = make_bc(m,'auto',gdat,'distance'); % make the boundary conditions
plot(m,'bd',1);
% if you want to write into fort.14...
%write(m,'Gog');
%nccreate('myfile.nc','GoG');
% ncwrite('myfile.nc','GoG',6577);
% ncwrite('GoG',m,m)
%% STEP 6: Example of plotting a subdomain with bcs
bbox_s =  [172   176;
           -42   -39];
plot(m,'bd',1,[],bbox_s)