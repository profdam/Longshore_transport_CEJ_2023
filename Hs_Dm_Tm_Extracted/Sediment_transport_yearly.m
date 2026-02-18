%% Load Sediment transport data
clc; clear;
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Sediment_transport.mat')


%% Historical
Q_hist=Q_hist';
n=1:12:324;
Q_hist_=[];
for i=1:length(n)
    m=n(i);
    Q_hist_n=Q_hist(:,[m:m+11]);
    Q_hist_y=nanmean(Q_hist_n,2);
    Q_hist_=[Q_hist_ Q_hist_y];
end
    
clearvars -EXCEPT Q_hist_ %Q_Mid_4p5 Q_Mid_8p5 Q_End_4p5 Q_End_8p5 lon_f lat_f

%% Mid RCP 4.5    
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Sediment_transport.mat')


Q_Mid_4p5=Q_Mid_4p5';
n=1:12:240;
Q_Mid_4p5_=[];
for i=1:length(n)
    m=n(i);
    Q_Mid_4p5_n=Q_Mid_4p5(:,[m:m+11]);
    Q_Mid_4p5_y=nanmean(Q_Mid_4p5_n,2);
    Q_Mid_4p5_=[Q_Mid_4p5_ Q_Mid_4p5_y];
end
    
clearvars -EXCEPT Q_hist_  Q_Mid_4p5_ %Q_Mid_8p5 Q_End_4p5 Q_End_8p5 lon_f lat_f

    
%% Mid RCP 8.5    
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Sediment_transport.mat')


Q_Mid_8p5=Q_Mid_8p5';
n=1:12:240;
Q_Mid_8p5_=[];
for i=1:length(n)
    m=n(i);
    Q_Mid_8p5_n=Q_Mid_8p5(:,[m:m+11]);
    Q_Mid_8p5_y=nanmean(Q_Mid_8p5_n,2);
    Q_Mid_8p5_=[Q_Mid_8p5_ Q_Mid_8p5_y];
end
    
clearvars -EXCEPT  Q_hist_  Q_Mid_4p5_ Q_Mid_8p5_ %Q_Mid_8p5 Q_End_4p5 Q_End_8p5 lon_f lat_f


%% End RCP 4.5    
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Sediment_transport.mat')


Q_End_4p5=Q_End_4p5';
n=1:12:240;
Q_End_4p5_=[];
for i=1:length(n)
    m=n(i);
    Q_End_4p5_n=Q_End_4p5(:,[m:m+11]);
    Q_End_4p5_y=nanmean(Q_End_4p5_n,2);
    Q_End_4p5_=[Q_End_4p5_ Q_End_4p5_y];
end
    
clearvars -EXCEPT Q_hist_  Q_Mid_4p5_ Q_Mid_8p5_ Q_End_4p5_ %Q_End_4p5 Q_End_4p5 Q_End_8p5 lon_f lat_f


%% End RCP 8.5    
load('/home/profdam/Downloads/INPUT_DATA/CSIRO/Hs_Dm_Tm_Extracted/Sediment_transport.mat')


Q_End_8p5=Q_End_8p5';
n=1:12:240;
Q_End_8p5_=[];
for i=1:length(n)
    m=n(i);
    Q_End_8p5_n=Q_End_8p5(:,[m:m+11]);
    Q_End_8p5_y=nanmean(Q_End_8p5_n,2);
    Q_End_8p5_=[Q_End_8p5_ Q_End_8p5_y];
end
    
clearvars -EXCEPT Q_hist_  Q_Mid_4p5_ Q_Mid_8p5_ Q_End_4p5_ Q_End_8p5_ lon_f lat_f

%%

    
Q_End_8p5_1979=Q_End_8p5(:,[1:12]); 
Q_End_8p5_1980=Q_End_8p5(:,[13:24]); 
Q_End_8p5_1981=Q_End_8p5(:,[25:36]);
Q_End_8p5_1982=Q_End_8p5(:,[37:48]); 
Q_End_8p5_1983=Q_End_8p5(:,[49:60]);
Q_End_8p5_1984=Q_End_8p5(:,[61:72]);
Q_End_8p5_1985=Q_End_8p5(:,[73:84]);
Q_End_8p5_1986=Q_End_8p5(:,[85:96]);
Q_End_8p5_1987=Q_End_8p5(:,[97:108]);
Q_End_8p5_1988=Q_End_8p5(:,[109:120]);
Q_End_8p5_1989=Q_End_8p5(:,[121:132]);
Q_End_8p5_1990=Q_End_8p5(:,[133:144]);
Q_End_8p5_1991=Q_End_8p5(:,[145:156]);
Q_End_8p5_1992=Q_End_8p5(:,[157:168]);
Q_End_8p5_1993=Q_End_8p5(:,[169:180]);
Q_End_8p5_1994=Q_End_8p5(:,[181:192]);
Q_End_8p5_1995=Q_End_8p5(:,[193:204]);
Q_End_8p5_1996=Q_End_8p5(:,[205:216]);
Q_End_8p5_1997=Q_End_8p5(:,[217:228]);
Q_End_8p5_1998=Q_End_8p5(:,[229:240]);
Q_End_8p5_1999=Q_End_8p5(:,[241:252]);
Q_End_8p5_2000=Q_End_8p5(:,[253:264]);
Q_End_8p5_2001=Q_End_8p5(:,[265:276]);
Q_End_8p5_2002=Q_End_8p5(:,[277:288]);
Q_End_8p5_2003=Q_End_8p5(:,[289:300]);
Q_End_8p5_2004=Q_End_8p5(:,[301:312]);
Q_End_8p5_2005=Q_End_8p5(:,[313:324]);
