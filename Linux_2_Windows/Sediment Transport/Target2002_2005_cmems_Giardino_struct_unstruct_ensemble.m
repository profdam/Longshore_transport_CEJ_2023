% How to create a Target diagram with with modified axes and data point colors
%
% A fourth example of how to create a Target diagram given one set of
% reference observations and multiple model predictions for the quantity.
%
% This example is a variation on the third example (target3) where now the
% maximum scale for the standard deviation axis is increased, color
% properties are modified for the data points, and color & style properties
% are modified for the axes.
%
% All functions in the Skill Metrics Toolbox are designed to only work with
% one-dimensional arrays, e.g. time series of observations at a selected
% location. The one-dimensional data are read in as data structures via a
% mat file. The latter are stored in data structures in the format:
% ref.data, pred1.data, pred2.dat, and pred3.dat. The plot is written to a
% file in Portable Network Graphics (PNG) format.
%
% The reference data used in this example are cell concentrations of a
% phytoplankton collected from cruise surveys at selected locations and 
% time. The model predictions are from three different simulations that
% have been space-time interpolated to the location and time of the sample
% collection. Details on the contents of the data structures (once loaded)
% can be obtained by simply entering the data structure variable name at 
% the command prompt, e.g. 
% >> ref
% ref = 
%          data: [57x1 double]
%          date: {57x1 cell}
%         depth: [57x1 double]
%      latitude: [57x1 double]
%     longitude: [57x1 double]
%       station: [57x1 double]
%          time: {57x1 cell}
%         units: 'cell/L'
%          jday: [57x1 double]
% Author: Peter A. Rochford
%         Symplectic, LLC
%         www.thesymplectic.com
%         prochford@thesymplectic.com
% Close any previously open graphics windows
% load('F:\ECMWF\ERA-5\Monthly_averaged_1979_2004.mat')
% load('F:\COWCLIP\CSIRO\All_models\validated_years_all_models_historical.mat')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\CMEMS_unstruct_struct_2.mat')
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'hs_cmems', 'hs_struct', 'hs_unstruct')

%%
% close all;
% % Set the figure properties (optional)
% set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
% set(gcf,'DefaultLineLineWidth', 1.5); % linewidth for plots
% set(gcf,'DefaultAxesFontSize',18); % font size of axes text
% 

%%

pred1.data=hs_struct;
pred2.data=hs_unstruct;
ref.data=hs_cmems;

%%
% Calculate statistics for Target diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
target_stats1 = target_statistics(pred1,ref,'data');
target_stats2 = target_statistics(pred2,ref,'data');
 
%%
% Store statistics in arrays
bias = [target_stats1.bias; target_stats2.bias];
rmsd = [target_stats1.rmsd; target_stats2.rmsd];
crmsd = [target_stats1.crmsd; target_stats2.crmsd];
% crmsd = [target_stats1.crmsd(1); target_stats1.crmsd(1); ...
%     target_stats2.crmsd(1); target_stats3.crmsd(1);target_stats4.crmsd(1);target_stats5.crmsd(1);target_stats6.crmsd(1);target_stats7.crmsd(1);target_stats8.crmsd(1)];
% bias = [target_stats1.bias(1); target_stats1.bias(1); ...
%     target_stats2.bias(1); target_stats3.bias(1);target_stats4.bias(1);target_stats5.bias(1);target_stats6.bias(1);target_stats7.bias(1);target_stats8.bias(1)];
% rmsd = [target_stats1.rmsd(1); target_stats1.rmsd(1); ...
%     target_stats2.rmsd(1); target_stats3.rmsd(1);target_stats4.rmsd(1);target_stats5.rmsd(1);target_stats6.rmsd(1);target_stats7.rmsd(1);target_stats8.rmsd(1)];


%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Structured', 'Unstructured'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};

% Check for duplicate statistics
%duplicateStats = check_duplicate_stats(bias,crmsd);

% Report duplicate statistics, if any
%report_duplicate_stats(duplicateStats);

 

% Produce the Target diagram
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%   >> target_diagram
%	>> target_diagram
[hp, ht, axl] = target_diagram(bias,crmsd,rmsd, ...
    'markerLabel',label, 'markerLabelColor', 'r', 'markerColor', 'b', ...
    'markerLegend', 'on', ...
    'ticks',-0.01:0.0:0.40,'limitAxis',0.50, ...
    'circles',[0.08 0.1 0.2 0.3 0.4 0.50], 'circleLineSpec','-r', ...
    'circleLineWidth',2, 'markerSize', 8, 'alpha', 0.0);


%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%  Giardino starts here
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'Giardino_1979_2005_hs', 'hs_giard_struct', 'hs_giard_unstruct')
%load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Giardino_unstruct_struct2.mat', 'hs_giard', 'hs_struct', 'hs_unstruct')
%%
pred1.data=hs_giard_struct;
pred2.data=hs_giard_unstruct;
ref.data=nanmean(Giardino_1979_2005_hs,1);

%%
% Calculate statistics for Target diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
target_stats1 = target_statistics(pred1,ref,'data');
target_stats2 = target_statistics(pred2,ref,'data');
 
%%
% Store statistics in arrays
bias = [target_stats1.bias; target_stats2.bias];
rmsd = [target_stats1.rmsd; target_stats2.rmsd];
crmsd = [target_stats1.crmsd; target_stats2.crmsd];
% crmsd = [target_stats1.crmsd(1); target_stats1.crmsd(1); ...
%     target_stats2.crmsd(1); target_stats3.crmsd(1);target_stats4.crmsd(1);target_stats5.crmsd(1);target_stats6.crmsd(1);target_stats7.crmsd(1);target_stats8.crmsd(1)];
% bias = [target_stats1.bias(1); target_stats1.bias(1); ...
%     target_stats2.bias(1); target_stats3.bias(1);target_stats4.bias(1);target_stats5.bias(1);target_stats6.bias(1);target_stats7.bias(1);target_stats8.bias(1)];
% rmsd = [target_stats1.rmsd(1); target_stats1.rmsd(1); ...
%     target_stats2.rmsd(1); target_stats3.rmsd(1);target_stats4.rmsd(1);target_stats5.rmsd(1);target_stats6.rmsd(1);target_stats7.rmsd(1);target_stats8.rmsd(1)];


%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Structured', 'Unstructured'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};

% Check for duplicate statistics
%duplicateStats = check_duplicate_stats(bias,crmsd);

% Report duplicate statistics, if any
%report_duplicate_stats(duplicateStats);

 

% Produce the Target diagram
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%   >> target_diagram
%	>> target_diagram
[hp, ht, axl] = target_diagram(bias,crmsd,rmsd, ...
    'markerLabel',label, 'markerLabelColor', 'r', 'markerColor', 'b', ...
    'markerLegend', 'on', ...
    'ticks',0.5:0.0:0.20,'limitAxis',0.2, ...
    'circles',[0.05 0.07 0.1 0.13 0.15 0.17 0.2], 'circleLineSpec','-r', ...
    'circleLineWidth',2, 'markerSize', 8, 'alpha', 0.0);


