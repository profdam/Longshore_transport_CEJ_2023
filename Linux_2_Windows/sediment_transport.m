clear; close all; clc;


%%
filename=('D:\Linux_2_Windows\Wave_Giardino\waves_west_africa_currentsituation.nc');
%filename=('/home/profdam/Downloads/INPUT_DATA/Wave_Giardino/waves_west_africa_climatechange.nc');
ncdisp(filename)
lat=ncread(filename,'latitude');
lon=ncread(filename,'longitude');
date=ncread(filename,'time'); aab=datevec(date);
hs=ncread(filename,'wave_height');
tm=ncread(filename,'wave_period');
dm=ncread(filename,'wave_direction');



%%
hs_2014=hs(51101:end,:);
tm_2014=tm(51101:end,:);
dm_2014=dm(51101:end,:);

hs_f=nanmean(hs_2014,1);
tm_f=nanmean(tm_2014,1);
dm_f=nanmean(dm_2014,1);
lon_f=lon';
lat_f=lat';
%%
%global loop to compute hs gradients
ANGLE=[]; ANGG=[]; angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=2; %Radius of the circle (in Â°) to select the coastline which direction will be estimated


shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<1);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
ANGG=[ANGG ang_coast];
if ang_coast<0
ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end
ANGLE=ANGLE';
if dm_f<180 & dm_f>90
    abb=dm_f+189;
%abb=abs((dm_f-90))+270;
elseif dm_f>180 & dm_f<270
    abb=(dm_f-180);
else
    abb=(dm_f-180);
    %abb=abs((dm_f-270))+90;
end
    
    
%abb=dm_f-180;
abb=abs(abb);
abc=abs(angg'-abb);

%%
Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_f=[Thetab_f Thetab];
Hb_f=[Hb_f Hb];
hb_f=[hb_f hb];
R_f=[R_f R];
S_f=[S_f S];
V_f=[V_f V];
end

%%
omega=Hb_f.^2.*V_f;
omega1=Hb_f.^2.*S_f;
omega2=Hb_f.^2.*R_f;


% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
    transport1 = 0.023.*(omega1);%% %% p�riodes calmes
    transport2 = 0.023.*(omega2);%% %% p�riodes calmes

else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
    transport1 = 0.00225 + (0.008.*(omega1)); %% p�riodes de tempete
    transport2 = 0.00225 + (0.008.*(omega2)); %% p�riodes de tempete

end

%%
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q=transport./conversion;
Q1=S_f./conversion;
Q2=R_f./conversion;

%%
cmin=-14 %min(Q) %-14*10^4; 
cmax=8 %max(Q) %8*10^4; 
int=1; n= round((cmax-cmin)/int);

figure;
worldmap([-5 20],[-8 20])
scatterm(lat_f,lon_f,50,Q,'filled');%colorbar;
colormap(jet(n)); 
hold on
bordersm
labelbordersm
clb=colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax);
caxis([cmin cmax]);
set(get(clb,'label'),'string','Longshore sediment transport (m^3 per year)');



%%
aas=find((aab(:,1))==1993 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==1993 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_1993= chl(:,:,aas);
chl_winter_1993= chl(:,:,aaw);

aas=find((aab(:,1))==1994 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==1994 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_1994= chl(:,:,aas);
chl_winter_1994= chl(:,:,aaw);

aas=find((aab(:,1))==1995 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==1995 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_1995= chl(:,:,aas);
chl_winter_1995= chl(:,:,aaw);

aas=find((aab(:,1))==1996 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==1996 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_1996= chl(:,:,aas);
chl_winter_1996= chl(:,:,aaw);

aas=find((aab(:,1))==1997 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==1997 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_1997= chl(:,:,aas);
chl_winter_1997= chl(:,:,aaw);

aas=find((aab(:,1))==1998 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==1998 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_1998= chl(:,:,aas);
chl_winter_1998= chl(:,:,aaw);

aas=find((aab(:,1))==1999 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==1999 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_1999= chl(:,:,aas);
chl_winter_1999= chl(:,:,aaw);

aas=find((aab(:,1))==2000 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2000 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2000= chl(:,:,aas);
chl_winter_2000= chl(:,:,aaw);

aas=find((aab(:,1))==2001 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2001 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2001= chl(:,:,aas);
chl_winter_2001= chl(:,:,aaw);

aas=find((aab(:,1))==2002 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2002 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2002= chl(:,:,aas);
chl_winter_2002= chl(:,:,aaw);

aas=find((aab(:,1))==2003 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2003 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2003= chl(:,:,aas);
chl_winter_2003= chl(:,:,aaw);

aas=find((aab(:,1))==2004 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2004 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2004= chl(:,:,aas);
chl_winter_2004= chl(:,:,aaw);

aas=find((aab(:,1))==2005 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2005 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2005= chl(:,:,aas);
chl_winter_2005= chl(:,:,aaw);

aas=find((aab(:,1))==2006 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2006 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2006= chl(:,:,aas);
chl_winter_2006= chl(:,:,aaw);

aas=find((aab(:,1))==2007 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2007 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2007= chl(:,:,aas);
chl_winter_2007= chl(:,:,aaw);

aas=find((aab(:,1))==2008 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2008 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2008= chl(:,:,aas);
chl_winter_2008= chl(:,:,aaw);

aas=find((aab(:,1))==2009 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2009 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2009= chl(:,:,aas);
chl_winter_2009= chl(:,:,aaw);

aas=find((aab(:,1))==2010 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2010 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2010= chl(:,:,aas);
chl_winter_2010= chl(:,:,aaw);

aas=find((aab(:,1))==2011 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2011 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2011= chl(:,:,aas);
chl_winter_2011= chl(:,:,aaw);

aas=find((aab(:,1))==2012 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2012 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2012= chl(:,:,aas);
chl_winter_2012= chl(:,:,aaw);

aas=find((aab(:,1))==2013 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2013 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2013= chl(:,:,aas);
chl_winter_2013= chl(:,:,aaw);

aas=find((aab(:,1))==2014 & ((aab(:,2))==4 | (aab(:,2))==5 | (aab(:,2))==6 | (aab(:,2))==7 | (aab(:,2))==8 | (aab(:,2))==9 | (aab(:,2))==10));
aaw=find((aab(:,1))==2014 & ((aab(:,2))==1 | (aab(:,2))==2 | (aab(:,2))==3 | (aab(:,2))==11 | (aab(:,2))==12));
chl_summer_2014= chl(:,:,aas);
chl_winter_2014= chl(:,:,aaw);

