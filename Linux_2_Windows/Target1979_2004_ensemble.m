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
load('/home/profdam/Documents/PhD Project/Sediment Transport/Figures Sediment Transport/hs_yearly_allmodels.mat');

close all;
% Set the figure properties (optional)
set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
set(gcf,'DefaultLineLineWidth', 1.5); % linewidth for plots
set(gcf,'DefaultAxesFontSize',18); % font size of axes text
 
%% RUN
hs_ac=ACCESS; %nanmean(nanmean(ACCESS1_0_hs0p5_1979_2004(:,:,:),3),2);
hs_bc=BCC_CSM; %nanmean(nanmean(BCC_CSM1_1_hs0p5_1979_2004(:,:,:),3),2);
hs_cn=CNRM_CM5; %nanmean(nanmean(CNRM_CM5_hs0p5_1979_2004(:,:,:),3),2);
hs_gf=GFDL_CM3; %nanmean(nanmean(GFDL_CM3_hs0p5_1979_2004(:,:,:),3),2);
hs_ha=HADGEM2_ES; %nanmean(nanmean(HADGEM2_ES_hs0p5_1979_2004(:,:,:),3),2);
hs_in=INM_CM4; %nanmean(nanmean(INM_CM4_hs0p5_1979_2004(:,:,:),3),2);
hs_mi=MIROC5; %nanmean(nanmean(MIROC5_hs0p5_1979_2004(:,:,:),3),2);
hs_mr=MRI_CGCM3; %nanmean(nanmean(MRI_CGCM3_hs0p5_1979_2004(:,:,:),3),2);
hs_en=ENSEMBLE; %nanmean(nanmean(ENSEMBLE_hs(:,:,:),3),2);
ERA_I_hs_=ERA5; %nanmean(nanmean(ERA5_hs0p5_1979_2004(:,:,:),3),2);


%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat');

hs_ac=ACCESS1_0_hs0p5_1979_2004(:); %nanmean(nanmean(ACCESS1_0_hs0p5_1979_2004(:,:,:),3),2);
hs_bc=BCC_CSM1_1_hs0p5_1979_2004(:); %nanmean(nanmean(BCC_CSM1_1_hs0p5_1979_2004(:,:,:),3),2);
hs_cn=CNRM_CM5_hs0p5_1979_2004(:); %nanmean(nanmean(CNRM_CM5_hs0p5_1979_2004(:,:,:),3),2);
hs_gf=GFDL_CM3_hs0p5_1979_2004(:); %nanmean(nanmean(GFDL_CM3_hs0p5_1979_2004(:,:,:),3),2);
hs_ha=HADGEM2_ES_hs0p5_1979_2004(:); %nanmean(nanmean(HADGEM2_ES_hs0p5_1979_2004(:,:,:),3),2);
hs_in=INM_CM4_hs0p5_1979_2004(:); %nanmean(nanmean(INM_CM4_hs0p5_1979_2004(:,:,:),3),2);
hs_mi=MIROC5_hs0p5_1979_2004(:); %nanmean(nanmean(MIROC5_hs0p5_1979_2004(:,:,:),3),2);
hs_mr=MRI_CGCM3_hs0p5_1979_2004(:); %nanmean(nanmean(MRI_CGCM3_hs0p5_1979_2004(:,:,:),3),2);
hs_en=ENSEMBLE_hs(:); %nanmean(nanmean(ENSEMBLE_hs(:,:,:),3),2);
ERA_I_hs_=ERA5_hs0p5_1979_2004(:); %nanmean(nanmean(ERA5_hs0p5_1979_2004(:,:,:),3),2);

%%
%aap=nanmean(nanmean(hs_(:,:,:),3),2);
ind=~isnan(ERA_I_hs_); ind1=~isnan(hs_ac); ind2=find(ind==1 & ind1==1);
%aarr=ERA_I_hs_(ind2);
aapp1=hs_ac(ind2);aapp2=hs_bc(ind2); aapp3=hs_cn(ind2); aapp4=hs_gf(ind2);
aapp5=hs_ha(ind2);aapp6=hs_in(ind2); aapp7=hs_mi(ind2); aapp8=hs_mr(ind2);aapp9=hs_en(ind2);
pred1.data=aapp1;pred2.data=aapp2;pred3.data=aapp3;pred4.data=aapp4;
pred5.data=aapp5;pred6.data=aapp6;pred7.data=aapp7;pred8.data=aapp8;pred9.data=aapp9;
ref.data=ERA_I_hs_(ind2);
 
%%
% Calculate statistics for Target diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
target_stats1 = target_statistics(pred1,ref,'data');
target_stats2 = target_statistics(pred2,ref,'data');
target_stats3 = target_statistics(pred3,ref,'data');
target_stats4 = target_statistics(pred4,ref,'data');
target_stats5 = target_statistics(pred5,ref,'data');
target_stats6 = target_statistics(pred6,ref,'data');
target_stats7 = target_statistics(pred7,ref,'data');
target_stats8 = target_statistics(pred8,ref,'data');
target_stats9 = target_statistics(pred9,ref,'data');
 
%%
% Store statistics in arrays
bias = [target_stats1.bias; target_stats2.bias; target_stats3.bias;target_stats4.bias;...
    target_stats5.bias; target_stats6.bias;target_stats7.bias; target_stats8.bias;target_stats9.bias];
rmsd = [target_stats1.rmsd; target_stats2.rmsd; target_stats3.rmsd;target_stats4.rmsd; ...
    target_stats5.rmsd; target_stats6.rmsd;target_stats7.rmsd; target_stats8.rmsd;target_stats9.rmsd];
crmsd = [target_stats1.crmsd; target_stats2.crmsd; target_stats3.crmsd;target_stats4.crmsd; ...
    target_stats5.crmsd; target_stats6.crmsd;target_stats7.crmsd; target_stats8.crmsd;target_stats9.crmsd];
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
label = {'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', 'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5',...
    'MRI-CGCM3','ENSEMBLE'};
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
    'circles',[0.08 0.1 0.2 0.3 0.4 0.50], 'circleLineSpec','-.r', ...
    'circleLineWidth',1.5, 'markerSize', 8, 'alpha', 0.0);


%%
% Write plot to file
writepng(gcf,'hs_2004.png');

%%
load('/home/profdam/Documents/PhD Project/Sediment Transport/Figures Sediment Transport/tm_yearly_allmodels.mat');

close all;
% Set the figure properties (optional)
set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
set(gcf,'DefaultLineLineWidth', 1.5); % linewidth for plots
set(gcf,'DefaultAxesFontSize',18); % font size of axes text

%% 

%% RUN
% Read in data from a mat file
tm_ac=ACCESS; %nanmean(nanmean(ACCESS1_0_tm0p5_1979_2004(:,:,:),3),2);
tm_bc=BCC_CSM; %nanmean(nanmean(BCC_CSM1_1_tm0p5_1979_2004(:,:,:),3),2);
tm_cn=CNRM_CM5; %nanmean(nanmean(CNRM_CM5_tm0p5_1979_2004(:,:,:),3),2);
tm_gf=GFDL_CM3; %nanmean(nanmean(GFDL_CM3_tm0p5_1979_2004(:,:,:),3),2);
tm_ha=HADGEM2_ES; %nanmean(nanmean(HADGEM2_ES_tm0p5_1979_2004(:,:,:),3),2);
tm_in=INM_CM4; %nanmean(nanmean(INM_CM4_tm0p5_1979_2004(:,:,:),3),2);
tm_mi=MIROC5; %nanmean(nanmean(MIROC5_tm0p5_1979_2004(:,:,:),3),2);
tm_mr=MRI_CGCM3; %nanmean(nanmean(MRI_CGCM3_tm0p5_1979_2004(:,:,:),3),2);
tm_en=ENSEMBLE; %nanmean(nanmean(ENSEMBLE_tm(:,:,:),3),2);
ERA_I_tm_=ERA5; %nanmean(nanmean(ERA5_tm0p5_1979_2004(:,:,:),3),2);

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat');
tm_ac=ACCESS1_0_tm0p5_1979_2004(:); %nanmean(nanmean(ACCESS1_0_tm0p5_1979_2004(:,:,:),3),2);
tm_bc=BCC_CSM1_1_tm0p5_1979_2004(:); %nanmean(nanmean(BCC_CSM1_1_tm0p5_1979_2004(:,:,:),3),2);
tm_cn=CNRM_CM5_tm0p5_1979_2004(:); %nanmean(nanmean(CNRM_CM5_tm0p5_1979_2004(:,:,:),3),2);
tm_gf=GFDL_CM3_tm0p5_1979_2004(:); %nanmean(nanmean(GFDL_CM3_tm0p5_1979_2004(:,:,:),3),2);
tm_ha=HADGEM2_ES_tm0p5_1979_2004(:); %nanmean(nanmean(HADGEM2_ES_tm0p5_1979_2004(:,:,:),3),2);
tm_in=INM_CM4_tm0p5_1979_2004(:); %nanmean(nanmean(INM_CM4_tm0p5_1979_2004(:,:,:),3),2);
tm_mi=MIROC5_tm0p5_1979_2004(:); %nanmean(nanmean(MIROC5_tm0p5_1979_2004(:,:,:),3),2);
tm_mr=MRI_CGCM3_tm0p5_1979_2004(:); %nanmean(nanmean(MRI_CGCM3_tm0p5_1979_2004(:,:,:),3),2);
tm_en=ENSEMBLE_tm(:); %nanmean(nanmean(ENSEMBLE_tm(:,:,:),3),2);
ERA_I_tm_=ERA5_tm0p5_1979_2004(:); %nanmean(nanmean(ERA5_tm0p5_1979_2004(:,:,:),3),2);

%%
%aap=nanmean(nanmean(tm_(:,:,:),3),2);
ind=~isnan(ERA_I_tm_); ind1=~isnan(tm_ac); ind2=find(ind==1 & ind1==1);
%aarr=ERA_I_tm_(ind2);
aapp1=tm_ac(ind2);aapp2=tm_bc(ind2); aapp3=tm_cn(ind2); aapp4=tm_gf(ind2);
aapp5=tm_ha(ind2);aapp6=tm_in(ind2); aapp7=tm_mi(ind2); aapp8=tm_mr(ind2);aapp9=tm_en(ind2);
pred1.data=aapp1;pred2.data=aapp2;pred3.data=aapp3;pred4.data=aapp4;
pred5.data=aapp5;pred6.data=aapp6;pred7.data=aapp7;pred8.data=aapp8;pred9.data=aapp9;
ref.data=ERA_I_tm_(ind2);
  
%%
% Calculate statistics for Target diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
target_stats1 = target_statistics(pred1,ref,'data');
target_stats2 = target_statistics(pred2,ref,'data');
target_stats3 = target_statistics(pred3,ref,'data');
target_stats4 = target_statistics(pred4,ref,'data');
target_stats5 = target_statistics(pred5,ref,'data');
target_stats6 = target_statistics(pred6,ref,'data');
target_stats7 = target_statistics(pred7,ref,'data');
target_stats8 = target_statistics(pred8,ref,'data');
target_stats9 = target_statistics(pred9,ref,'data');
 
%%
% Store statistics in arrays
bias = [target_stats1.bias; target_stats2.bias; target_stats3.bias;target_stats4.bias; ...
    target_stats5.bias; target_stats6.bias;target_stats7.bias; target_stats8.bias;target_stats9.bias];
rmsd = [target_stats1.rmsd; target_stats2.rmsd; target_stats3.rmsd;target_stats4.rmsd;...
    target_stats5.rmsd; target_stats6.rmsd;target_stats7.rmsd; target_stats8.rmsd;target_stats9.rmsd];
crmsd = [target_stats1.crmsd; target_stats2.crmsd; target_stats3.crmsd;target_stats4.crmsd;...
    target_stats5.crmsd; target_stats6.crmsd;target_stats7.crmsd; target_stats8.crmsd;target_stats9.crmsd];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', 'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5',...
    'MRI-CGCM3','ENSEMBLE'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};
 
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
% %   >> target_diagram
% [hp, ht, axl] = target_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label, 'markerLabelColor', 'r', ...
%     'tickRMS',0.01:0.05:0.20,'tickRMSangle',115, ...
%     'colRMS','m', 'styleRMS', ':', 'widthRMS', 0.5, ...
%     'tickSTD',0.0:0.05:0.60, 'limSTD',0.6, ...
%     'colSTD','b', 'styleSTD', '-.', 'widttmTD', 1.0, ...
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',14, 'alpha', 0.0);
[hp, ht, axl] = target_diagram(bias,crmsd,rmsd, ...
    'markerLabel',label, 'markerLabelColor', 'r', 'markerColor', 'b', ...
    'markerLegend', 'on', ...
    'ticks',-0.01:0.0:1.50,'limitAxis',2.00, ...
    'circles',[0.1 0.30 0.5 0.7 0.9 1.1 1.3 1.5 1.7], 'circleLineSpec','-.r', ...
    'circleLineWidth',1.7, 'markerSize', 8, 'alpha', 0.0);
 
%% 
% Write plot to file
writepng(gcf,'tm_2004.png');
 

 
%% RUN

%%
load('/home/profdam/Documents/PhD Project/Sediment Transport/Figures Sediment Transport/dm_yearly_allmodels.mat');

close all;
% Set the figure properties (optional)
set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
set(gcf,'DefaultLineLineWidth', 1.5); % linewidth for plots
set(gcf,'DefaultAxesFontSize',18); % font size of axes text


%% RUN
% Read in data from a mat file
dm_ac=ACCESS; %nanmean(nanmean(ACCESS1_0_dm0p5_1979_2004(:,:,:),3),2);
dm_bc=BCC_CSM; %nanmean(nanmean(BCC_CSM1_1_dm0p5_1979_2004(:,:,:),3),2);
dm_cn=CNRM_CM5; %nanmean(nanmean(CNRM_CM5_dm0p5_1979_2004(:,:,:),3),2);
dm_gf=GFDL_CM3; %nanmean(nanmean(GFDL_CM3_dm0p5_1979_2004(:,:,:),3),2);
dm_ha=HADGEM2_ES; %nanmean(nanmean(HADGEM2_ES_dm0p5_1979_2004(:,:,:),3),2);
dm_in=INM_CM4; %nanmean(nanmean(INM_CM4_dm0p5_1979_2004(:,:,:),3),2);
dm_mi=MIROC5; %nanmean(nanmean(MIROC5_dm0p5_1979_2004(:,:,:),3),2);
dm_mr=MRI_CGCM3; %nanmean(nanmean(MRI_CGCM3_dm0p5_1979_2004(:,:,:),3),2);
dm_en=ENSEMBLE; %nanmean(nanmean(ENSEMBLE_dm(:,:,:),3),2);
ERA_I_dm_=ERA5; %nanmean(nanmean(ERA5_dm0p5_1979_2004(:,:,:),3),2);

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat');
dm_ac=ACCESS1_0_dm0p5_1979_2004(:); %nanmean(nanmean(ACCESS1_0_dm0p5_1979_2004(:,:,:),3),2);
dm_bc=BCC_CSM1_1_dm0p5_1979_2004(:); %nanmean(nanmean(BCC_CSM1_1_dm0p5_1979_2004(:,:,:),3),2);
dm_cn=CNRM_CM5_dm0p5_1979_2004(:); %nanmean(nanmean(CNRM_CM5_dm0p5_1979_2004(:,:,:),3),2);
dm_gf=GFDL_CM3_dm0p5_1979_2004(:); %nanmean(nanmean(GFDL_CM3_dm0p5_1979_2004(:,:,:),3),2);
dm_ha=HADGEM2_ES_dm0p5_1979_2004(:); %nanmean(nanmean(HADGEM2_ES_dm0p5_1979_2004(:,:,:),3),2);
dm_in=INM_CM4_dm0p5_1979_2004(:); %nanmean(nanmean(INM_CM4_dm0p5_1979_2004(:,:,:),3),2);
dm_mi=MIROC5_dm0p5_1979_2004(:); %nanmean(nanmean(MIROC5_dm0p5_1979_2004(:,:,:),3),2);
dm_mr=MRI_CGCM3_dm0p5_1979_2004(:); %nanmean(nanmean(MRI_CGCM3_dm0p5_1979_2004(:,:,:),3),2);
dm_en=ENSEMBLE_dm(:); %nanmean(nanmean(ENSEMBLE_dm(:,:,:),3),2);
ERA_I_dm_=ERA5_dm0p5_1979_2004(:); %nanmean(nanmean(ERA5_dm0p5_1979_2004(:,:,:),3),2);

%%
%aap=nanmean(nanmean(dm_(:,:,:),3),2);
ind=~isnan(ERA_I_dm_); ind1=~isnan(dm_ac); ind2=find(ind==1 & ind1==1);
%aarr=ERA_I_dm_(ind2);
aapp1=dm_ac(ind2);aapp2=dm_bc(ind2); aapp3=dm_cn(ind2); aapp4=dm_gf(ind2);
aapp5=dm_ha(ind2);aapp6=dm_in(ind2); aapp7=dm_mi(ind2); aapp8=dm_mr(ind2);aapp9=dm_en(ind2);
pred1.data=aapp1;pred2.data=aapp2;pred3.data=aapp3;pred4.data=aapp4;
pred5.data=aapp5;pred6.data=aapp6;pred7.data=aapp7;pred8.data=aapp8;pred9.data=aapp9;
ref.data=ERA_I_dm_(ind2);
 
 
%%
% Calculate statistics for Target diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
target_stats1 = target_statistics(pred1,ref,'data');
target_stats2 = target_statistics(pred2,ref,'data');
target_stats3 = target_statistics(pred3,ref,'data');
target_stats4 = target_statistics(pred4,ref,'data');
target_stats5 = target_statistics(pred5,ref,'data');
target_stats6 = target_statistics(pred6,ref,'data');
target_stats7 = target_statistics(pred7,ref,'data');
target_stats8 = target_statistics(pred8,ref,'data');
target_stats9 = target_statistics(pred9,ref,'data');
 
%%
% Store statistics in arrays
bias = [target_stats1.bias; target_stats2.bias; target_stats3.bias;target_stats4.bias;...
    target_stats5.bias; target_stats6.bias;target_stats7.bias; target_stats8.bias;target_stats9.bias];
rmsd = [target_stats1.rmsd; target_stats2.rmsd; target_stats3.rmsd;target_stats4.rmsd;...
    target_stats5.rmsd; target_stats6.rmsd;target_stats7.rmsd; target_stats8.rmsd;target_stats9.rmsd];
crmsd = [target_stats1.crmsd; target_stats2.crmsd; target_stats3.crmsd;target_stats4.crmsd; ...
    target_stats5.crmsd; target_stats6.crmsd;target_stats7.crmsd; target_stats8.crmsd;target_stats9.crmsd];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', 'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5',...
    'MRI-CGCM3','ENSEMBLE'};
%label = {'Non-Dimensional Observation', 'M1', 'M2', 'M3','M4','M5','M6','M7'};
 
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
% %   >> target_diagram
% [hp, ht, axl] = target_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label, 'markerLabelColor', 'r', ...
%     'tickRMS',0.01:0.05:0.20,'tickRMSangle',115, ...
%     'colRMS','m', 'styleRMS', ':', 'widthRMS', 0.5, ...
%     'tickSTD',0.0:0.05:0.60, 'limSTD',0.6, ...
%     'colSTD','b', 'styleSTD', '-.', 'widtdmTD', 1.0, ...
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',14, 'alpha', 0.0);
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',14, 'alpha', 0.0);
[hp, ht, axl] = target_diagram(bias,crmsd,rmsd, ...
    'markerLabel',label, 'markerLabelColor', 'r', 'markerColor', 'b', ...
    'markerLegend', 'on', ...
    'ticks',33.0:0:45,'limitAxis',45, ...
    'circles',[5 15 25 33 35 37 39 41 43 45 50], 'circleLineSpec','-.r', ...
    'circleLineWidth',1.5, 'markerSize', 8, 'alpha', 0.0);

%% 
% Write plot to file
writepng(gcf,'dm_2004.png');
 
 
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
