% How to create a Taylor diagram with with modified axes and data point colors
%
% A fourth example of how to create a Taylor diagram given one set of
% reference observations and multiple model predictions for the quantity.
%
% This example is a variation on the third example (taylor3) where now the
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
%% CMEMS struct and unstruct
clc;clear;
%load CMEMS data
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'hs_cmems', 'hs_struct', 'hs_unstruct')

%%
% close all;
% % Set the figure properties (optional)
% set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
% set(gcf,'DefaultLineLineWidth', 1.5); % linewidth for plots
% set(gcf,'DefaultAxesFontSize',18); % font size of axes text
 

%%
pred1.data=hs_struct;
pred2.data=hs_unstruct;
ref.data=hs_cmems;
 
%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');

%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);taylor_stats2.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); taylor_stats2.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); taylor_stats2.ccoef(2)];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'Structured', 'Unstructured'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};
 
% Produce the Taylor diagram
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%   >> taylor_diagram
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'k', ...
    'rmslabelformat','%.2f','tickRMS',0.1:0.02:0.2,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
    'colRMS','r', 'styleRMS', '-', 'widthRMS', 2.0,'titleRMS','on','titleRMSDangle',120, ...
    'tickSTD',0.1:0.02:0.19, 'limSTD',0.2, ...
    'colSTD','b', 'styleSTD', '-', 'widthSTD', 2.0,'colOBS','k','markerObs','o','widthObs',2,...
    'styleOBS','-','colCOR','k', 'styleCOR', '--', 'widthCOR', 2.0,...
    'colormap','off','titleOBS','Observation','markerSize',10, 'alpha', 0.0);


% [hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'b', ...
%     'rmslabelformat','%.2f','tickRMS',0.1:0.02:0.2,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
%     'colRMS','r', 'styleRMS', '-', 'widthRMS', 1.0,'titleRMS','on', ...
%     'tickSTD',0.1:0.05:0.30, 'limSTD',0.3, ...
%     'colSTD','b', 'styleSTD', '-', 'widthSTD', 1.0,'colOBS','k','markerObs','o','widthObs',2,...
%     'styleOBS','-','colCOR','k', 'styleCOR', '--', 'widthCOR', 2.0,...
%     'colormap','off','titleOBS','Observation','markerSize',16, 'alpha', 0.0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Giardino starts here

load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'Giardino_1979_2005_hs', 'hs_giard_struct', 'hs_giard_unstruct')
%%
pred1.data=hs_giard_struct;
pred2.data=hs_giard_unstruct;
ref.data=nanmean(Giardino_1979_2005_hs,1);
 
%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');

%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);taylor_stats2.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); taylor_stats2.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); taylor_stats2.ccoef(2)];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'Structured', 'Unstructured'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};
 
% Produce the Taylor diagram
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%   >> taylor_diagram
%
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'k', ...
    'rmslabelformat','%.2f','tickRMS',0.04:0.01:0.09,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
    'colRMS','r', 'styleRMS', '-', 'widthRMS', 2.0,'titleRMS','on','titleRMSDangle',100, ...
    'tickSTD',0.1:0.02:0.19, 'limSTD',0.2, ...
    'colSTD','b', 'styleSTD', '-', 'widthSTD', 2.0,'colOBS','k','markerObs','o','widthObs',2,...
    'styleOBS','-','colCOR','k', 'styleCOR', '--', 'widthCOR', 2.0,...
    'colormap','off','titleOBS','Observation','markerSize',10, 'alpha', 0.0);

%% Giardino TM
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'Giardino_1979_2005_tm', 'tm_giard_struct', 'tm_giard_unstruct')
%%
pred1.data=tm_giard_struct;
pred2.data=tm_giard_unstruct;
ref.data=nanmean(Giardino_1979_2005_tm,1);
 
%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');

%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);taylor_stats2.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); taylor_stats2.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); taylor_stats2.ccoef(2)];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'Structured', 'Unstructured'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};
 
% Produce the Taylor diagram
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%   >> taylor_diagram
%
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'k', ...
    'rmslabelformat','%.2f','tickRMS',0.1:0.05:0.45,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
    'colRMS','r', 'styleRMS', '-', 'widthRMS', 2.0,'titleRMS','on','titleRMSDangle',100, ...
    'tickSTD',0.1:0.05:0.6, 'limSTD',0.6, ...
    'colSTD','b', 'styleSTD', '-', 'widthSTD', 2.0,'colOBS','k','markerObs','o','widthObs',2,...
    'styleOBS','-','colCOR','k', 'styleCOR', '--', 'widthCOR', 2.0,...
    'colormap','off','titleOBS','Observation','markerSize',10, 'alpha', 0.0);

%% Giardino DM
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Validation_all_data.mat', 'Giardino_1979_2005_dm', 'dm_giard_struct', 'dm_giard_unstruct')
%%
pred1.data=dm_giard_struct;
pred2.data=dm_giard_unstruct;
ref.data=nanmean(Giardino_1979_2005_dm,1);
 
%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');

%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);taylor_stats2.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); taylor_stats2.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); taylor_stats2.ccoef(2)];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'Structured', 'Unstructured'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};
 
% Produce the Taylor diagram
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%   >> taylor_diagram
%
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'k', ...
    'rmslabelformat','%.2f','tickRMS',1:0.5:3.5,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
    'colRMS','r', 'styleRMS', '-', 'widthRMS', 2.0,'titleRMS','on','titleRMSDangle',100, ...
    'tickSTD',1:0.5:3.5, 'limSTD',4, ...
    'colSTD','b', 'styleSTD', '-', 'widthSTD', 2.0,'colOBS','k','markerObs','o','widthObs',2,...
    'styleOBS','-','colCOR','k', 'styleCOR', '--', 'widthCOR', 2.0,...
    'colormap','off','titleOBS','Observation','markerSize',10, 'alpha', 0.0);

