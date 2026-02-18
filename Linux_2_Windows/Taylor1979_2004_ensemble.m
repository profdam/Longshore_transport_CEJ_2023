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
%load('F:\ECMWF\ERA-5\Monthly_averaged_1979_2004.mat')

%load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ENSEMBLE_hs', 'Xlong', 'Ylat');

close all;
% Set the figure properties (optional)
set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
set(gcf,'DefaultLineLineWidth', 1.5); % linewidth for plots
set(gcf,'DefaultAxesFontSize',18); % font size of axes text
 
%% RUN
% load('/home/profdam/Documents/PhD Project/Sediment Transport/Figures Sediment Transport/hs_yearly_allmodels.mat');
% 
% hs_ac=ACCESS; %nanmean(nanmean(ACCESS1_0_hs0p5_1979_2004(:,:,:),3),2);
% hs_bc=BCC_CSM; %nanmean(nanmean(BCC_CSM1_1_hs0p5_1979_2004(:,:,:),3),2);
% hs_cn=CNRM_CM5; %nanmean(nanmean(CNRM_CM5_hs0p5_1979_2004(:,:,:),3),2);
% hs_gf=GFDL_CM3; %nanmean(nanmean(GFDL_CM3_hs0p5_1979_2004(:,:,:),3),2);
% hs_ha=HADGEM2_ES; %nanmean(nanmean(HADGEM2_ES_hs0p5_1979_2004(:,:,:),3),2);
% hs_in=INM_CM4; %nanmean(nanmean(INM_CM4_hs0p5_1979_2004(:,:,:),3),2);
% hs_mi=MIROC5; %nanmean(nanmean(MIROC5_hs0p5_1979_2004(:,:,:),3),2);
% hs_mr=MRI_CGCM3; %nanmean(nanmean(MRI_CGCM3_hs0p5_1979_2004(:,:,:),3),2);
% hs_en=ENSEMBLE; %nanmean(nanmean(ENSEMBLE_hs(:,:,:),3),2);
% ERA_I_hs_=ERA5; %nanmean(nanmean(ERA5_hs0p5_1979_2004(:,:,:),3),2);
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
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');
taylor_stats3 = taylor_statistics(pred3,ref,'data');
taylor_stats4 = taylor_statistics(pred4,ref,'data');
taylor_stats5 = taylor_statistics(pred5,ref,'data');
taylor_stats6 = taylor_statistics(pred6,ref,'data');
taylor_stats7 = taylor_statistics(pred7,ref,'data');
taylor_stats8 = taylor_statistics(pred8,ref,'data');
taylor_stats9 = taylor_statistics(pred9,ref,'data');

%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);...
    taylor_stats2.sdev(2); taylor_stats3.sdev(2); taylor_stats4.sdev(2);...
    taylor_stats5.sdev(2); taylor_stats6.sdev(2); taylor_stats7.sdev(2); ...
    taylor_stats8.sdev(2);taylor_stats9.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); ...
    taylor_stats2.crmsd(2); taylor_stats3.crmsd(2);taylor_stats4.crmsd(2);...
    taylor_stats5.crmsd(2);taylor_stats6.crmsd(2);taylor_stats7.crmsd(2);...
    taylor_stats8.crmsd(2);taylor_stats9.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); ...
    taylor_stats2.ccoef(2); taylor_stats3.ccoef(2);taylor_stats4.ccoef(2);...
    taylor_stats5.ccoef(2);taylor_stats6.ccoef(2);taylor_stats7.ccoef(2);...
    taylor_stats8.ccoef(2);taylor_stats9.ccoef(2)];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', ...
    'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3','ENSEMBLE'};
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
% [hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'b', ...
%     'rmslabelformat','%.2f','tickRMS',0.01:0.02:0.20,'tickRMSangle',115,'showlabelsRMS', 'on', ...
%     'colRMS','r', 'styleRMS', '-', 'widthRMS', 1.0,'titleRMS','on', ...
%     'tickSTD',0.0:0.05:0.20, 'limSTD',0.2, ...
%     'colSTD','b', 'styleSTD', '-', 'widthSTD', 1.0,'colOBS','k','markerObs','o','widthObs',2,...
%     'styleOBS','-','markerSize',16,'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,...
%     'colormap','off','titleOBS','ERA5','markerSize',7, 'alpha', 0.0);

[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'b', ...
    'rmslabelformat','%.2f','tickRMS',0.2:0.02:0.40,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
    'colRMS','r', 'styleRMS', '-', 'widthRMS', 1.0,'titleRMS','on', ...
    'tickSTD',0.2:0.05:0.50, 'limSTD',0.5, ...
    'colSTD','b', 'styleSTD', '-', 'widthSTD', 1.0,'colOBS','k','markerObs','o','widthObs',2,...
    'styleOBS','-','markerSize',16,'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,...
    'colormap','off','titleOBS','ERA5','markerSize',7, 'alpha', 0.0);
%%
% Write plot to file
writepng(gcf,'hs_2004.png');
 

%% RUN
% tm_ac=nanmean(nanmean(ACCESS1_0_tm0p5_1979_2004(:,:,:),3),2);
% tm_bc=nanmean(nanmean(BCC_CSM1_1_tm0p5_1979_2004(:,:,:),3),2);
% tm_cn=nanmean(nanmean(CNRM_CM5_tm0p5_1979_2004(:,:,:),3),2);
% tm_gf=nanmean(nanmean(GFDL_CM3_tm0p5_1979_2004(:,:,:),3),2);
% tm_ha=nanmean(nanmean(HADGEM2_ES_tm0p5_1979_2004(:,:,:),3),2);
% tm_in=nanmean(nanmean(INM_CM4_tm0p5_1979_2004(:,:,:),3),2);
% tm_mi=nanmean(nanmean(MIROC5_tm0p5_1979_2004(:,:,:),3),2);
% tm_mr=nanmean(nanmean(MRI_CGCM3_tm0p5_1979_2004(:,:,:),3),2);
% tm_en=nanmean(nanmean(ENSEMBLE_tm(:,:,:),3),2); 
% ERA_I_tm_=nanmean(nanmean(ERA5_tm0p5_1979_2004(:,:,:),3),2);
%aap=nanmean(nanmean(tm_(:,:,:),3),2);
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
ind=~isnan(ERA_I_tm_); ind1=~isnan(tm_ac); ind2=find(ind==1 & ind1==1);
%aarr=ERA_I_tm_(ind2);
aapp1=tm_ac(ind2);aapp2=tm_bc(ind2); aapp3=tm_cn(ind2); aapp4=tm_gf(ind2);
aapp5=tm_ha(ind2);aapp6=tm_in(ind2); aapp7=tm_mi(ind2); aapp8=tm_mr(ind2);aapp9=tm_en(ind2);
pred1.data=aapp1;pred2.data=aapp2;pred3.data=aapp3;pred4.data=aapp4;
pred5.data=aapp5;pred6.data=aapp6;pred7.data=aapp7;pred8.data=aapp8;pred9.data=aapp9;
ref.data=ERA_I_tm_(ind2);
  
%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');
taylor_stats3 = taylor_statistics(pred3,ref,'data');
taylor_stats4 = taylor_statistics(pred4,ref,'data');
taylor_stats5 = taylor_statistics(pred5,ref,'data');
taylor_stats6 = taylor_statistics(pred6,ref,'data');
taylor_stats7 = taylor_statistics(pred7,ref,'data');
taylor_stats8 = taylor_statistics(pred8,ref,'data');
taylor_stats9 = taylor_statistics(pred9,ref,'data');

%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);...
    taylor_stats2.sdev(2); taylor_stats3.sdev(2); taylor_stats4.sdev(2);...
    taylor_stats5.sdev(2); taylor_stats6.sdev(2); taylor_stats7.sdev(2);...
    taylor_stats8.sdev(2);taylor_stats9.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); ...
    taylor_stats2.crmsd(2); taylor_stats3.crmsd(2);taylor_stats4.crmsd(2);...
    taylor_stats5.crmsd(2);taylor_stats6.crmsd(2);taylor_stats7.crmsd(2);...
    taylor_stats8.crmsd(2);taylor_stats9.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); ...
    taylor_stats2.ccoef(2); taylor_stats3.ccoef(2);taylor_stats4.ccoef(2);...
    taylor_stats5.ccoef(2);taylor_stats6.ccoef(2);taylor_stats7.ccoef(2);...
    taylor_stats8.ccoef(2);taylor_stats9.ccoef(2)];
%% 
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', ...
    'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3','ENSEMBLE'};
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
% %   >> taylor_diagram
% [hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label, 'markerLabelColor', 'r', ...
%     'tickRMS',0.01:0.05:0.20,'tickRMSangle',115, ...
%     'colRMS','m', 'styleRMS', ':', 'widthRMS', 0.5, ...
%     'tickSTD',0.0:0.05:0.60, 'limSTD',0.6, ...
%     'colSTD','b', 'styleSTD', '-.', 'widthsTD', 1.0, ...
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',14, 'alpha', 0.0);
% [hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'b', ...
%     'rmslabelformat','%.2f','tickRMS',0.01:0.05:0.40,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
%     'colRMS','r', 'styleRMS', '-', 'widthRMS', 1.0,'titleRMS','off', ...
%     'tickSTD',0.0:0.05:0.60, 'limSTD',0.6, ...
%     'colSTD','b', 'styleSTD', '-', 'widthSTD', 1.0,'colOBS','k','markerObs','o',...
%     'widthObs',2,'styleOBS','-','markerSize',16,...
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5',...
%     'markerSize',7, 'alpha', 0.0);
 
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'b', ...
    'rmslabelformat','%.2f','tickRMS',0.6:0.05:0.9,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
    'colRMS','r', 'styleRMS', '-', 'widthRMS', 1.0,'titleRMS','off', ...
    'tickSTD',0.4:0.05:0.90, 'limSTD',0.9, ...
    'colSTD','b', 'styleSTD', '-', 'widthSTD', 1.0,'colOBS','k','markerObs','o',...
    'widthObs',2,'styleOBS','-','markerSize',16,...
    'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5',...
    'markerSize',7, 'alpha', 0.0);

 
%% SKIP
% Write plot to file
writepng(gcf,'tm_2004.png');
 

 
 
%% RUN
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
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');
taylor_stats3 = taylor_statistics(pred3,ref,'data');
taylor_stats4 = taylor_statistics(pred4,ref,'data');
taylor_stats5 = taylor_statistics(pred5,ref,'data');
taylor_stats6 = taylor_statistics(pred6,ref,'data');
taylor_stats7 = taylor_statistics(pred7,ref,'data');
taylor_stats8 = taylor_statistics(pred8,ref,'data');
taylor_stats9 = taylor_statistics(pred9,ref,'data');
 
%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);...
    taylor_stats2.sdev(2); taylor_stats3.sdev(2); taylor_stats4.sdev(2);...
    taylor_stats5.sdev(2); taylor_stats6.sdev(2); taylor_stats7.sdev(2);...
    taylor_stats8.sdev(2);taylor_stats9.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); ...
    taylor_stats2.crmsd(2); taylor_stats3.crmsd(2);taylor_stats4.crmsd(2);...
    taylor_stats5.crmsd(2);taylor_stats6.crmsd(2);taylor_stats7.crmsd(2);...
    taylor_stats8.crmsd(2);taylor_stats9.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); ...
    taylor_stats2.ccoef(2); taylor_stats3.ccoef(2);taylor_stats4.ccoef(2);...
    taylor_stats5.ccoef(2);taylor_stats6.ccoef(2);taylor_stats7.ccoef(2);...
    taylor_stats8.ccoef(2);taylor_stats9.ccoef(2)];

%%
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', 'GFDL-CM3',...
    'HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3','ENSEMBLE'};
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
% [hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label, 'markerLabelColor', 'r', ...
%     'tickRMS',2.0:1:20.0,'tickRMSangle',128, ...
%     'colRMS','m', 'styleRMS', ':', 'widthRMS', 0.50, ...
%     'tickSTD',1.0:1.0:17.0, 'limSTD',18.0, ...
%     'colSTD','b', 'styleSTD', '-.', 'widthsTD', 1.0, ...
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',14, 'alpha', 0.0);
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor','k','markerColor', 'b', ...
    'tickRMS',33:1:45,'tickRMSangle',-25,'showlabelsRMS', 'on', ...
    'colRMS','r', 'styleRMS', '-', 'widthRMS', 1.0,'titleRMS','off', ...
    'tickSTD',27:1.0:43, 'limSTD',43, ...
    'colSTD','b', 'styleSTD', '-', 'widthSTD', 1.0,'colOBS','k','markerObs','o',...
    'widthObs',2,'styleOBS','-','markerSize',16,...
    'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5',...
    'markerSize',7, 'alpha', 0.0);

 
%% SKIP
% Write plot to file
writepng(gcf,'dm_2004.png');
 
 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
load('F:\ECMWF\ERA-5\Monthly_averaged_1979_2004.mat')
load('F:\COWCLIP\CSIRO\All_models\validated_years_all_models_historical.mat')
close all;
% Set the figure properties (optional)
set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
set(gcf,'DefaultLineLineWidth', 1.5); % linewidth for plots
set(gcf,'DefaultAxesFontSize',18); % font size of axes text

%%
% Read in data from a mat file
hs_ac=permute(ACCESS1_0_hs0p5_1979_2004,[2 1 3]);hs__ac=nanmean(nanmean(hs_ac(:,:,:),3),2);
hs_bc=permute(BCC_CSM1_1_hs0p5_1979_2004,[2 1 3]);hs__bc=nanmean(nanmean(hs_bc(:,:,:),3),2);
hs_cn=permute(CNRM_CM5_hs0p5_1979_2004,[2 1 3]);hs__cn=nanmean(nanmean(hs_cn(:,:,:),3),2);
hs_gf=permute(GFDL_CM3_hs0p5_1979_2004,[2 1 3]);hs__gf=nanmean(nanmean(hs_gf(:,:,:),3),2);
hs_ha=permute(HadGEM2_ES_hs0p5_1979_2004,[2 1 3]);hs__ha=nanmean(nanmean(hs_ha(:,:,:),3),2);
hs_in=permute(INM_CM4_hs0p5_1979_2004,[2 1 3]);hs__in=nanmean(nanmean(hs_in(:,:,:),3),2);
hs_mi=permute(MIROC5_hs0p5_1979_2004,[2 1 3]);hs__mi=nanmean(nanmean(hs_mi(:,:,:),3),2);
hs_mr=permute(MRI_CGCM3_hs0p5_1979_2004,[2 1 3]);hs__mr=nanmean(nanmean(hs_mr(:,:,:),3),2);
 
ERA_I_hs_=nanmean(nanmean(ERA5_hs0p5_1979_2004(:,:,:),3),2);
%aap=nanmean(nanmean(hs_(:,:,:),3),2);
ind=~isnan(ERA_I_hs_); ind1=~isnan(hs__ac); ind2=find(ind==1 & ind1==1);
%aarr=ERA_I_hs_(ind2);
aapp1=hs__ac(ind2);aapp2=hs__bc(ind2); aapp3=hs__cn(ind2); aapp4=hs__gf(ind2);
aapp5=hs__ha(ind2);aapp6=hs__in(ind2); aapp7=hs__mi(ind2); aapp8=hs__mr(ind2);
pred1.data=aapp1;pred2.data=aapp2;pred3.data=aapp3;pred4.data=aapp4;
pred5.data=aapp5;pred6.data=aapp6;pred7.data=aapp7;pred8.data=aapp8;
ref.data=ERA_I_hs_(ind2);
 
%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');
taylor_stats3 = taylor_statistics(pred3,ref,'data');
taylor_stats4 = taylor_statistics(pred4,ref,'data');
taylor_stats5 = taylor_statistics(pred5,ref,'data');
taylor_stats6 = taylor_statistics(pred6,ref,'data');
taylor_stats7 = taylor_statistics(pred7,ref,'data');
taylor_stats8 = taylor_statistics(pred8,ref,'data');
 
%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);...
    taylor_stats2.sdev(2); taylor_stats3.sdev(2); taylor_stats4.sdev(2); taylor_stats5.sdev(2); taylor_stats6.sdev(2); taylor_stats7.sdev(2); taylor_stats8.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); ...
    taylor_stats2.crmsd(2); taylor_stats3.crmsd(2);taylor_stats4.crmsd(2);taylor_stats5.crmsd(2);taylor_stats6.crmsd(2);taylor_stats7.crmsd(2);taylor_stats8.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); ...
    taylor_stats2.ccoef(2); taylor_stats3.ccoef(2);taylor_stats4.ccoef(2);taylor_stats5.ccoef(2);taylor_stats6.ccoef(2);taylor_stats7.ccoef(2);taylor_stats8.ccoef(2)];
 
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', 'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3'};
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
    'markerLabel',label,'markerLegend', 'on','markerLabelColor', 'r', ...
    'tickRMS',0.0:0.05:0.20,'tickRMSangle',115,'showlabelsRMS', 'on', ...
    'colRMS','m', 'styleRMS', ':', 'widthRMS', 2.0,'titleRMS','on', ...
    'tickSTD',0.0:0.05:0.20, 'limSTD',0.2, ...
    'colSTD','b', 'styleSTD', '-.', 'widthSTD', 1.0,'colOBS','b','markerObs','o','markerSize',16,...
    'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',7, 'alpha', 0.0);
% Write plot to file
writepng(gcf,'hs_2004.png');
 
%% Wave period
 
% Read in data from a mat file
tm_ac=permute(ACCESS1_0_tm0p5_1979_2004,[2 1 3]);tm__ac=nanmean(nanmean(tm_ac(:,:,:),3),2);
tm_bc=permute(BCC_CSM1_1_tm0p5_1979_2004,[2 1 3]);tm__bc=nanmean(nanmean(tm_bc(:,:,:),3),2);
tm_cn=permute(CNRM_CM5_tm0p5_1979_2004,[2 1 3]);tm__cn=nanmean(nanmean(tm_cn(:,:,:),3),2);
tm_gf=permute(GFDL_CM3_tm0p5_1979_2004,[2 1 3]);tm__gf=nanmean(nanmean(tm_gf(:,:,:),3),2);
tm_ha=permute(HadGEM2_ES_tm0p5_1979_2004,[2 1 3]);tm__ha=nanmean(nanmean(tm_ha(:,:,:),3),2);
tm_in=permute(INM_CM4_tm0p5_1979_2004,[2 1 3]);tm__in=nanmean(nanmean(tm_in(:,:,:),3),2);
tm_mi=permute(MIROC5_tm0p5_1979_2004,[2 1 3]);tm__mi=nanmean(nanmean(tm_mi(:,:,:),3),2);
tm_mr=permute(MRI_CGCM3_tm0p5_1979_2004,[2 1 3]);tm__mr=nanmean(nanmean(tm_mr(:,:,:),3),2);
 
ERA_I_tm_=nanmean(nanmean(ERA5_tm0p5_1979_2004(:,:,:),3),2);
%aap=nanmean(nanmean(tm_(:,:,:),3),2);
ind=~isnan(ERA_I_tm_); ind1=~isnan(tm__ac); ind2=find(ind==1 & ind1==1);
%aarr=ERA_I_tm_(ind2);
aapp1=tm__ac(ind2);aapp2=tm__bc(ind2); aapp3=tm__cn(ind2); aapp4=tm__gf(ind2);
aapp5=tm__ha(ind2);aapp6=tm__in(ind2); aapp7=tm__mi(ind2); aapp8=tm__mr(ind2);
pred1.data=aapp1;pred2.data=aapp2;pred3.data=aapp3;pred4.data=aapp4;
pred5.data=aapp5;pred6.data=aapp6;pred7.data=aapp7;pred8.data=aapp8;
ref.data=ERA_I_tm_(ind2);
 
 
%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');
taylor_stats3 = taylor_statistics(pred3,ref,'data');
taylor_stats4 = taylor_statistics(pred4,ref,'data');
taylor_stats5 = taylor_statistics(pred5,ref,'data');
taylor_stats6 = taylor_statistics(pred6,ref,'data');
taylor_stats7 = taylor_statistics(pred7,ref,'data');
taylor_stats8 = taylor_statistics(pred8,ref,'data');
 
%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);...
    taylor_stats2.sdev(2); taylor_stats3.sdev(2); taylor_stats4.sdev(2); taylor_stats5.sdev(2); taylor_stats6.sdev(2); taylor_stats7.sdev(2); taylor_stats8.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); ...
    taylor_stats2.crmsd(2); taylor_stats3.crmsd(2);taylor_stats4.crmsd(2);taylor_stats5.crmsd(2);taylor_stats6.crmsd(2);taylor_stats7.crmsd(2);taylor_stats8.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); ...
    taylor_stats2.ccoef(2); taylor_stats3.ccoef(2);taylor_stats4.ccoef(2);taylor_stats5.ccoef(2);taylor_stats6.ccoef(2);taylor_stats7.ccoef(2);taylor_stats8.ccoef(2)];
 
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', 'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3'};
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
% %   >> taylor_diagram
% [hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label, 'markerLabelColor', 'r', ...
%     'tickRMS',0.01:0.05:0.20,'tickRMSangle',115, ...
%     'colRMS','m', 'styleRMS', ':', 'widthRMS', 0.5, ...
%     'tickSTD',0.0:0.05:0.60, 'limSTD',0.6, ...
%     'colSTD','b', 'styleSTD', '-.', 'widthsTD', 1.0, ...
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',14, 'alpha', 0.0);

[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor', 'r', ...
    'tickRMS',0.01:0.05:0.40,'tickRMSangle',115,'showlabelsRMS', 'on', ...
    'colRMS','m', 'styleRMS', '-.', 'widthRMS', 1,'titleRMS','on', ...
    'tickSTD',0.0:0.05:0.60, 'limSTD',0.6, ...
    'colSTD','b', 'styleSTD', '-.', 'widthSTD', 1.0,'colOBS','b','markerObs','o','markerSize',16,...
    'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',10, 'alpha', 0.0);



% Write plot to file
writepng(gcf,'tm_2004.png');
 
%%
%% Wave direction
 
% Read in data from a mat file
dm_ac=permute(ACCESS1_0_dm0p5_1979_2004,[2 1 3]);dm__ac=nanmean(nanmean(dm_ac(:,:,:),3),2);
dm_bc=permute(BCC_CSM1_1_dm0p5_1979_2004,[2 1 3]);dm__bc=nanmean(nanmean(dm_bc(:,:,:),3),2);
dm_cn=permute(CNRM_CM5_dm0p5_1979_2004,[2 1 3]);dm__cn=nanmean(nanmean(dm_cn(:,:,:),3),2);
dm_gf=permute(GFDL_CM3_dm0p5_1979_2004,[2 1 3]);dm__gf=nanmean(nanmean(dm_gf(:,:,:),3),2);
dm_ha=permute(HadGEM2_ES_dm0p5_1979_2004,[2 1 3]);dm__ha=nanmean(nanmean(dm_ha(:,:,:),3),2);
dm_in=permute(INM_CM4_dm0p5_1979_2004,[2 1 3]);dm__in=nanmean(nanmean(dm_in(:,:,:),3),2);
dm_mi=permute(MIROC5_dm0p5_1979_2004,[2 1 3]);dm__mi=nanmean(nanmean(dm_mi(:,:,:),3),2);
dm_mr=permute(MRI_CGCM3_dm0p5_1979_2004,[2 1 3]);dm__mr=nanmean(nanmean(dm_mr(:,:,:),3),2);
 
ERA_I_dm_=nanmean(nanmean(ERA5_dm0p5_1979_2004(:,:,:),3),2);
%aap=nanmean(nanmean(dm_(:,:,:),3),2);
ind=~isnan(ERA_I_dm_); ind1=~isnan(dm__ac); ind2=find(ind==1 & ind1==1);
%aarr=ERA_I_dm_(ind2);
aapp1=dm__ac(ind2);aapp2=dm__bc(ind2); aapp3=dm__cn(ind2); aapp4=dm__gf(ind2);
aapp5=dm__ha(ind2);aapp6=dm__in(ind2); aapp7=dm__mi(ind2); aapp8=dm__mr(ind2);
pred1.data=aapp1;pred2.data=aapp2;pred3.data=aapp3;pred4.data=aapp4;
pred5.data=aapp5;pred6.data=aapp6;pred7.data=aapp7;pred8.data=aapp8;
ref.data=ERA_I_dm_(ind2);
 



%%
% Calculate statistics for Taylor diagram
% The first array element corresponds to the reference series for the
% while the second is that for the predicted series.
taylor_stats1 = taylor_statistics(pred1,ref,'data');
taylor_stats2 = taylor_statistics(pred2,ref,'data');
taylor_stats3 = taylor_statistics(pred3,ref,'data');
taylor_stats4 = taylor_statistics(pred4,ref,'data');
taylor_stats5 = taylor_statistics(pred5,ref,'data');
taylor_stats6 = taylor_statistics(pred6,ref,'data');
taylor_stats7 = taylor_statistics(pred7,ref,'data');
taylor_stats8 = taylor_statistics(pred8,ref,'data');
 
%%
% Store statistics in arrays
sdev = [taylor_stats1.sdev(1); taylor_stats1.sdev(2);...
    taylor_stats2.sdev(2); taylor_stats3.sdev(2); taylor_stats4.sdev(2); taylor_stats5.sdev(2); taylor_stats6.sdev(2); taylor_stats7.sdev(2); taylor_stats8.sdev(2)];
crmsd = [taylor_stats1.crmsd(1); taylor_stats1.crmsd(2); ...
    taylor_stats2.crmsd(2); taylor_stats3.crmsd(2);taylor_stats4.crmsd(2);taylor_stats5.crmsd(2);taylor_stats6.crmsd(2);taylor_stats7.crmsd(2);taylor_stats8.crmsd(2)];
ccoef = [taylor_stats1.ccoef(1); taylor_stats1.ccoef(2); ...
    taylor_stats2.ccoef(2); taylor_stats3.ccoef(2);taylor_stats4.ccoef(2);taylor_stats5.ccoef(2);taylor_stats6.ccoef(2);taylor_stats7.ccoef(2);taylor_stats8.ccoef(2)];
 
% Specify labels for points in a cell array (M1 for model prediction 1,
% etc.). Note that a label needs to be specified for the reference even
% though it is not used.
label = {'Non-Dimensional Observation', 'ACCESS1-0', 'BCC-CSM1-1', 'CNRM-CM5', 'GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3'};
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
% [hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
%     'markerLabel',label, 'markerLabelColor', 'r', ...
%     'tickRMS',2.0:1:20.0,'tickRMSangle',128, ...
%     'colRMS','m', 'styleRMS', ':', 'widthRMS', 0.50, ...
%     'tickSTD',1.0:1.0:17.0, 'limSTD',18.0, ...
%     'colSTD','b', 'styleSTD', '-.', 'widthsTD', 1.0, ...
%     'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',14, 'alpha', 0.0);

[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,'markerLegend', 'on','markerLabelColor', 'r', ...
    'tickRMS',2.0:1:8.0,'tickRMSangle',128,'showlabelsRMS', 'on', ...
    'colRMS','m', 'styleRMS', '-', 'widthRMS', 0.5,'titleRMS','on', ...
    'tickSTD',1.0:1.0:16.0, 'limSTD',18.0, ...
    'colSTD','b', 'styleSTD', '-.', 'widthSTD', 1.0,'colOBS','b','markerObs','o','markerSize',16,...
    'colCOR','k', 'styleCOR', '--', 'widthCOR', 1.0,'colormap','off','titleOBS','ERA5','markerSize',5, 'alpha', 0.0);
% Write plot to file


% Write plot to file
writepng(gcf,'dm_2004.png');


