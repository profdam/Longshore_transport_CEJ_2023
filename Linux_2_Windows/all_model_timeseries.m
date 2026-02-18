load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ENSEMBLE_hs', 'Xlong', 'Ylat');

%%  
%Step 1
hs1979=ENSEMBLE_hs(:,:,1:12);
hs1980=ENSEMBLE_hs(:,:,13:24);
hs1981=ENSEMBLE_hs(:,:,25:36);
hs1982=ENSEMBLE_hs(:,:,37:48);
hs1983=ENSEMBLE_hs(:,:,49:60);
hs1984=ENSEMBLE_hs(:,:,61:72);
hs1985=ENSEMBLE_hs(:,:,73:84);
hs1986=ENSEMBLE_hs(:,:,85:96);
hs1987=ENSEMBLE_hs(:,:,97:108);
hs1988=ENSEMBLE_hs(:,:,109:120);
hs1989=ENSEMBLE_hs(:,:,121:132);
hs1990=ENSEMBLE_hs(:,:,133:144);
hs1991=ENSEMBLE_hs(:,:,145:156);
hs1992=ENSEMBLE_hs(:,:,157:168);
hs1993=ENSEMBLE_hs(:,:,169:180);
hs1994=ENSEMBLE_hs(:,:,181:192);
hs1995=ENSEMBLE_hs(:,:,193:204);
hs1996=ENSEMBLE_hs(:,:,205:216);
hs1997=ENSEMBLE_hs(:,:,217:228);
hs1998=ENSEMBLE_hs(:,:,229:240);
hs1999=ENSEMBLE_hs(:,:,241:252);
hs2000=ENSEMBLE_hs(:,:,253:264);
hs2001=ENSEMBLE_hs(:,:,265:276);
hs2002=ENSEMBLE_hs(:,:,277:288);
hs2003=ENSEMBLE_hs(:,:,289:300);
hs2004=ENSEMBLE_hs(:,:,301:312);

%%
ENSEMBLE=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];
clearvars -EXCEPT ENSEMBLE

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ACCESS1_0_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=ACCESS1_0_hs0p5_1979_2004(:,:,1:12);
hs1980=ACCESS1_0_hs0p5_1979_2004(:,:,13:24);
hs1981=ACCESS1_0_hs0p5_1979_2004(:,:,25:36);
hs1982=ACCESS1_0_hs0p5_1979_2004(:,:,37:48);
hs1983=ACCESS1_0_hs0p5_1979_2004(:,:,49:60);
hs1984=ACCESS1_0_hs0p5_1979_2004(:,:,61:72);
hs1985=ACCESS1_0_hs0p5_1979_2004(:,:,73:84);
hs1986=ACCESS1_0_hs0p5_1979_2004(:,:,85:96);
hs1987=ACCESS1_0_hs0p5_1979_2004(:,:,97:108);
hs1988=ACCESS1_0_hs0p5_1979_2004(:,:,109:120);
hs1989=ACCESS1_0_hs0p5_1979_2004(:,:,121:132);
hs1990=ACCESS1_0_hs0p5_1979_2004(:,:,133:144);
hs1991=ACCESS1_0_hs0p5_1979_2004(:,:,145:156);
hs1992=ACCESS1_0_hs0p5_1979_2004(:,:,157:168);
hs1993=ACCESS1_0_hs0p5_1979_2004(:,:,169:180);
hs1994=ACCESS1_0_hs0p5_1979_2004(:,:,181:192);
hs1995=ACCESS1_0_hs0p5_1979_2004(:,:,193:204);
hs1996=ACCESS1_0_hs0p5_1979_2004(:,:,205:216);
hs1997=ACCESS1_0_hs0p5_1979_2004(:,:,217:228);
hs1998=ACCESS1_0_hs0p5_1979_2004(:,:,229:240);
hs1999=ACCESS1_0_hs0p5_1979_2004(:,:,241:252);
hs2000=ACCESS1_0_hs0p5_1979_2004(:,:,253:264);
hs2001=ACCESS1_0_hs0p5_1979_2004(:,:,265:276);
hs2002=ACCESS1_0_hs0p5_1979_2004(:,:,277:288);
hs2003=ACCESS1_0_hs0p5_1979_2004(:,:,289:300);
hs2004=ACCESS1_0_hs0p5_1979_2004(:,:,301:312);
 
%%
ACCESS=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];
clearvars -EXCEPT ENSEMBLE ACCESS

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'BCC_CSM1_1_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=BCC_CSM1_1_hs0p5_1979_2004(:,:,1:12);
hs1980=BCC_CSM1_1_hs0p5_1979_2004(:,:,13:24);
hs1981=BCC_CSM1_1_hs0p5_1979_2004(:,:,25:36);
hs1982=BCC_CSM1_1_hs0p5_1979_2004(:,:,37:48);
hs1983=BCC_CSM1_1_hs0p5_1979_2004(:,:,49:60);
hs1984=BCC_CSM1_1_hs0p5_1979_2004(:,:,61:72);
hs1985=BCC_CSM1_1_hs0p5_1979_2004(:,:,73:84);
hs1986=BCC_CSM1_1_hs0p5_1979_2004(:,:,85:96);
hs1987=BCC_CSM1_1_hs0p5_1979_2004(:,:,97:108);
hs1988=BCC_CSM1_1_hs0p5_1979_2004(:,:,109:120);
hs1989=BCC_CSM1_1_hs0p5_1979_2004(:,:,121:132);
hs1990=BCC_CSM1_1_hs0p5_1979_2004(:,:,133:144);
hs1991=BCC_CSM1_1_hs0p5_1979_2004(:,:,145:156);
hs1992=BCC_CSM1_1_hs0p5_1979_2004(:,:,157:168);
hs1993=BCC_CSM1_1_hs0p5_1979_2004(:,:,169:180);
hs1994=BCC_CSM1_1_hs0p5_1979_2004(:,:,181:192);
hs1995=BCC_CSM1_1_hs0p5_1979_2004(:,:,193:204);
hs1996=BCC_CSM1_1_hs0p5_1979_2004(:,:,205:216);
hs1997=BCC_CSM1_1_hs0p5_1979_2004(:,:,217:228);
hs1998=BCC_CSM1_1_hs0p5_1979_2004(:,:,229:240);
hs1999=BCC_CSM1_1_hs0p5_1979_2004(:,:,241:252);
hs2000=BCC_CSM1_1_hs0p5_1979_2004(:,:,253:264);
hs2001=BCC_CSM1_1_hs0p5_1979_2004(:,:,265:276);
hs2002=BCC_CSM1_1_hs0p5_1979_2004(:,:,277:288);
hs2003=BCC_CSM1_1_hs0p5_1979_2004(:,:,289:300);
hs2004=BCC_CSM1_1_hs0p5_1979_2004(:,:,301:312);
 
%%
BCC_CSM=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS


%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'CNRM_CM5_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=CNRM_CM5_hs0p5_1979_2004(:,:,1:12);
hs1980=CNRM_CM5_hs0p5_1979_2004(:,:,13:24);
hs1981=CNRM_CM5_hs0p5_1979_2004(:,:,25:36);
hs1982=CNRM_CM5_hs0p5_1979_2004(:,:,37:48);
hs1983=CNRM_CM5_hs0p5_1979_2004(:,:,49:60);
hs1984=CNRM_CM5_hs0p5_1979_2004(:,:,61:72);
hs1985=CNRM_CM5_hs0p5_1979_2004(:,:,73:84);
hs1986=CNRM_CM5_hs0p5_1979_2004(:,:,85:96);
hs1987=CNRM_CM5_hs0p5_1979_2004(:,:,97:108);
hs1988=CNRM_CM5_hs0p5_1979_2004(:,:,109:120);
hs1989=CNRM_CM5_hs0p5_1979_2004(:,:,121:132);
hs1990=CNRM_CM5_hs0p5_1979_2004(:,:,133:144);
hs1991=CNRM_CM5_hs0p5_1979_2004(:,:,145:156);
hs1992=CNRM_CM5_hs0p5_1979_2004(:,:,157:168);
hs1993=CNRM_CM5_hs0p5_1979_2004(:,:,169:180);
hs1994=CNRM_CM5_hs0p5_1979_2004(:,:,181:192);
hs1995=CNRM_CM5_hs0p5_1979_2004(:,:,193:204);
hs1996=CNRM_CM5_hs0p5_1979_2004(:,:,205:216);
hs1997=CNRM_CM5_hs0p5_1979_2004(:,:,217:228);
hs1998=CNRM_CM5_hs0p5_1979_2004(:,:,229:240);
hs1999=CNRM_CM5_hs0p5_1979_2004(:,:,241:252);
hs2000=CNRM_CM5_hs0p5_1979_2004(:,:,253:264);
hs2001=CNRM_CM5_hs0p5_1979_2004(:,:,265:276);
hs2002=CNRM_CM5_hs0p5_1979_2004(:,:,277:288);
hs2003=CNRM_CM5_hs0p5_1979_2004(:,:,289:300);
hs2004=CNRM_CM5_hs0p5_1979_2004(:,:,301:312);
 
 
%%
CNRM_CM5=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ERA5_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=ERA5_hs0p5_1979_2004(:,:,1:12);
hs1980=ERA5_hs0p5_1979_2004(:,:,13:24);
hs1981=ERA5_hs0p5_1979_2004(:,:,25:36);
hs1982=ERA5_hs0p5_1979_2004(:,:,37:48);
hs1983=ERA5_hs0p5_1979_2004(:,:,49:60);
hs1984=ERA5_hs0p5_1979_2004(:,:,61:72);
hs1985=ERA5_hs0p5_1979_2004(:,:,73:84);
hs1986=ERA5_hs0p5_1979_2004(:,:,85:96);
hs1987=ERA5_hs0p5_1979_2004(:,:,97:108);
hs1988=ERA5_hs0p5_1979_2004(:,:,109:120);
hs1989=ERA5_hs0p5_1979_2004(:,:,121:132);
hs1990=ERA5_hs0p5_1979_2004(:,:,133:144);
hs1991=ERA5_hs0p5_1979_2004(:,:,145:156);
hs1992=ERA5_hs0p5_1979_2004(:,:,157:168);
hs1993=ERA5_hs0p5_1979_2004(:,:,169:180);
hs1994=ERA5_hs0p5_1979_2004(:,:,181:192);
hs1995=ERA5_hs0p5_1979_2004(:,:,193:204);
hs1996=ERA5_hs0p5_1979_2004(:,:,205:216);
hs1997=ERA5_hs0p5_1979_2004(:,:,217:228);
hs1998=ERA5_hs0p5_1979_2004(:,:,229:240);
hs1999=ERA5_hs0p5_1979_2004(:,:,241:252);
hs2000=ERA5_hs0p5_1979_2004(:,:,253:264);
hs2001=ERA5_hs0p5_1979_2004(:,:,265:276);
hs2002=ERA5_hs0p5_1979_2004(:,:,277:288);
hs2003=ERA5_hs0p5_1979_2004(:,:,289:300);
hs2004=ERA5_hs0p5_1979_2004(:,:,301:312);
 
 
%%
ERA5=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'GFDL_CM3_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=GFDL_CM3_hs0p5_1979_2004(:,:,1:12);
hs1980=GFDL_CM3_hs0p5_1979_2004(:,:,13:24);
hs1981=GFDL_CM3_hs0p5_1979_2004(:,:,25:36);
hs1982=GFDL_CM3_hs0p5_1979_2004(:,:,37:48);
hs1983=GFDL_CM3_hs0p5_1979_2004(:,:,49:60);
hs1984=GFDL_CM3_hs0p5_1979_2004(:,:,61:72);
hs1985=GFDL_CM3_hs0p5_1979_2004(:,:,73:84);
hs1986=GFDL_CM3_hs0p5_1979_2004(:,:,85:96);
hs1987=GFDL_CM3_hs0p5_1979_2004(:,:,97:108);
hs1988=GFDL_CM3_hs0p5_1979_2004(:,:,109:120);
hs1989=GFDL_CM3_hs0p5_1979_2004(:,:,121:132);
hs1990=GFDL_CM3_hs0p5_1979_2004(:,:,133:144);
hs1991=GFDL_CM3_hs0p5_1979_2004(:,:,145:156);
hs1992=GFDL_CM3_hs0p5_1979_2004(:,:,157:168);
hs1993=GFDL_CM3_hs0p5_1979_2004(:,:,169:180);
hs1994=GFDL_CM3_hs0p5_1979_2004(:,:,181:192);
hs1995=GFDL_CM3_hs0p5_1979_2004(:,:,193:204);
hs1996=GFDL_CM3_hs0p5_1979_2004(:,:,205:216);
hs1997=GFDL_CM3_hs0p5_1979_2004(:,:,217:228);
hs1998=GFDL_CM3_hs0p5_1979_2004(:,:,229:240);
hs1999=GFDL_CM3_hs0p5_1979_2004(:,:,241:252);
hs2000=GFDL_CM3_hs0p5_1979_2004(:,:,253:264);
hs2001=GFDL_CM3_hs0p5_1979_2004(:,:,265:276);
hs2002=GFDL_CM3_hs0p5_1979_2004(:,:,277:288);
hs2003=GFDL_CM3_hs0p5_1979_2004(:,:,289:300);
hs2004=GFDL_CM3_hs0p5_1979_2004(:,:,301:312);
 
 
%%
GFDL_CM3=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'HADGEM2_ES_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=HADGEM2_ES_hs0p5_1979_2004(:,:,1:12);
hs1980=HADGEM2_ES_hs0p5_1979_2004(:,:,13:24);
hs1981=HADGEM2_ES_hs0p5_1979_2004(:,:,25:36);
hs1982=HADGEM2_ES_hs0p5_1979_2004(:,:,37:48);
hs1983=HADGEM2_ES_hs0p5_1979_2004(:,:,49:60);
hs1984=HADGEM2_ES_hs0p5_1979_2004(:,:,61:72);
hs1985=HADGEM2_ES_hs0p5_1979_2004(:,:,73:84);
hs1986=HADGEM2_ES_hs0p5_1979_2004(:,:,85:96);
hs1987=HADGEM2_ES_hs0p5_1979_2004(:,:,97:108);
hs1988=HADGEM2_ES_hs0p5_1979_2004(:,:,109:120);
hs1989=HADGEM2_ES_hs0p5_1979_2004(:,:,121:132);
hs1990=HADGEM2_ES_hs0p5_1979_2004(:,:,133:144);
hs1991=HADGEM2_ES_hs0p5_1979_2004(:,:,145:156);
hs1992=HADGEM2_ES_hs0p5_1979_2004(:,:,157:168);
hs1993=HADGEM2_ES_hs0p5_1979_2004(:,:,169:180);
hs1994=HADGEM2_ES_hs0p5_1979_2004(:,:,181:192);
hs1995=HADGEM2_ES_hs0p5_1979_2004(:,:,193:204);
hs1996=HADGEM2_ES_hs0p5_1979_2004(:,:,205:216);
hs1997=HADGEM2_ES_hs0p5_1979_2004(:,:,217:228);
hs1998=HADGEM2_ES_hs0p5_1979_2004(:,:,229:240);
hs1999=HADGEM2_ES_hs0p5_1979_2004(:,:,241:252);
hs2000=HADGEM2_ES_hs0p5_1979_2004(:,:,253:264);
hs2001=HADGEM2_ES_hs0p5_1979_2004(:,:,265:276);
hs2002=HADGEM2_ES_hs0p5_1979_2004(:,:,277:288);
hs2003=HADGEM2_ES_hs0p5_1979_2004(:,:,289:300);
hs2004=HADGEM2_ES_hs0p5_1979_2004(:,:,301:312);
 
%%
HADGEM2_ES=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'INM_CM4_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=INM_CM4_hs0p5_1979_2004(:,:,1:12);
hs1980=INM_CM4_hs0p5_1979_2004(:,:,13:24);
hs1981=INM_CM4_hs0p5_1979_2004(:,:,25:36);
hs1982=INM_CM4_hs0p5_1979_2004(:,:,37:48);
hs1983=INM_CM4_hs0p5_1979_2004(:,:,49:60);
hs1984=INM_CM4_hs0p5_1979_2004(:,:,61:72);
hs1985=INM_CM4_hs0p5_1979_2004(:,:,73:84);
hs1986=INM_CM4_hs0p5_1979_2004(:,:,85:96);
hs1987=INM_CM4_hs0p5_1979_2004(:,:,97:108);
hs1988=INM_CM4_hs0p5_1979_2004(:,:,109:120);
hs1989=INM_CM4_hs0p5_1979_2004(:,:,121:132);
hs1990=INM_CM4_hs0p5_1979_2004(:,:,133:144);
hs1991=INM_CM4_hs0p5_1979_2004(:,:,145:156);
hs1992=INM_CM4_hs0p5_1979_2004(:,:,157:168);
hs1993=INM_CM4_hs0p5_1979_2004(:,:,169:180);
hs1994=INM_CM4_hs0p5_1979_2004(:,:,181:192);
hs1995=INM_CM4_hs0p5_1979_2004(:,:,193:204);
hs1996=INM_CM4_hs0p5_1979_2004(:,:,205:216);
hs1997=INM_CM4_hs0p5_1979_2004(:,:,217:228);
hs1998=INM_CM4_hs0p5_1979_2004(:,:,229:240);
hs1999=INM_CM4_hs0p5_1979_2004(:,:,241:252);
hs2000=INM_CM4_hs0p5_1979_2004(:,:,253:264);
hs2001=INM_CM4_hs0p5_1979_2004(:,:,265:276);
hs2002=INM_CM4_hs0p5_1979_2004(:,:,277:288);
hs2003=INM_CM4_hs0p5_1979_2004(:,:,289:300);
hs2004=INM_CM4_hs0p5_1979_2004(:,:,301:312);
 
%%
INM_CM4=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'MIROC5_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=MIROC5_hs0p5_1979_2004(:,:,1:12);
hs1980=MIROC5_hs0p5_1979_2004(:,:,13:24);
hs1981=MIROC5_hs0p5_1979_2004(:,:,25:36);
hs1982=MIROC5_hs0p5_1979_2004(:,:,37:48);
hs1983=MIROC5_hs0p5_1979_2004(:,:,49:60);
hs1984=MIROC5_hs0p5_1979_2004(:,:,61:72);
hs1985=MIROC5_hs0p5_1979_2004(:,:,73:84);
hs1986=MIROC5_hs0p5_1979_2004(:,:,85:96);
hs1987=MIROC5_hs0p5_1979_2004(:,:,97:108);
hs1988=MIROC5_hs0p5_1979_2004(:,:,109:120);
hs1989=MIROC5_hs0p5_1979_2004(:,:,121:132);
hs1990=MIROC5_hs0p5_1979_2004(:,:,133:144);
hs1991=MIROC5_hs0p5_1979_2004(:,:,145:156);
hs1992=MIROC5_hs0p5_1979_2004(:,:,157:168);
hs1993=MIROC5_hs0p5_1979_2004(:,:,169:180);
hs1994=MIROC5_hs0p5_1979_2004(:,:,181:192);
hs1995=MIROC5_hs0p5_1979_2004(:,:,193:204);
hs1996=MIROC5_hs0p5_1979_2004(:,:,205:216);
hs1997=MIROC5_hs0p5_1979_2004(:,:,217:228);
hs1998=MIROC5_hs0p5_1979_2004(:,:,229:240);
hs1999=MIROC5_hs0p5_1979_2004(:,:,241:252);
hs2000=MIROC5_hs0p5_1979_2004(:,:,253:264);
hs2001=MIROC5_hs0p5_1979_2004(:,:,265:276);
hs2002=MIROC5_hs0p5_1979_2004(:,:,277:288);
hs2003=MIROC5_hs0p5_1979_2004(:,:,289:300);
hs2004=MIROC5_hs0p5_1979_2004(:,:,301:312);
 
 
%%
MIROC5=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4 MIROC5

%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'MRI_CGCM3_hs0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
hs1979=MRI_CGCM3_hs0p5_1979_2004(:,:,1:12);
hs1980=MRI_CGCM3_hs0p5_1979_2004(:,:,13:24);
hs1981=MRI_CGCM3_hs0p5_1979_2004(:,:,25:36);
hs1982=MRI_CGCM3_hs0p5_1979_2004(:,:,37:48);
hs1983=MRI_CGCM3_hs0p5_1979_2004(:,:,49:60);
hs1984=MRI_CGCM3_hs0p5_1979_2004(:,:,61:72);
hs1985=MRI_CGCM3_hs0p5_1979_2004(:,:,73:84);
hs1986=MRI_CGCM3_hs0p5_1979_2004(:,:,85:96);
hs1987=MRI_CGCM3_hs0p5_1979_2004(:,:,97:108);
hs1988=MRI_CGCM3_hs0p5_1979_2004(:,:,109:120);
hs1989=MRI_CGCM3_hs0p5_1979_2004(:,:,121:132);
hs1990=MRI_CGCM3_hs0p5_1979_2004(:,:,133:144);
hs1991=MRI_CGCM3_hs0p5_1979_2004(:,:,145:156);
hs1992=MRI_CGCM3_hs0p5_1979_2004(:,:,157:168);
hs1993=MRI_CGCM3_hs0p5_1979_2004(:,:,169:180);
hs1994=MRI_CGCM3_hs0p5_1979_2004(:,:,181:192);
hs1995=MRI_CGCM3_hs0p5_1979_2004(:,:,193:204);
hs1996=MRI_CGCM3_hs0p5_1979_2004(:,:,205:216);
hs1997=MRI_CGCM3_hs0p5_1979_2004(:,:,217:228);
hs1998=MRI_CGCM3_hs0p5_1979_2004(:,:,229:240);
hs1999=MRI_CGCM3_hs0p5_1979_2004(:,:,241:252);
hs2000=MRI_CGCM3_hs0p5_1979_2004(:,:,253:264);
hs2001=MRI_CGCM3_hs0p5_1979_2004(:,:,265:276);
hs2002=MRI_CGCM3_hs0p5_1979_2004(:,:,277:288);
hs2003=MRI_CGCM3_hs0p5_1979_2004(:,:,289:300);
hs2004=MRI_CGCM3_hs0p5_1979_2004(:,:,301:312);
 
 
%%
MRI_CGCM3=[nanmean(nanmean(nanmean(hs1979,1),2),3);nanmean(nanmean(nanmean(hs1980,1),2),3);...
    nanmean(nanmean(nanmean(hs1981,1),2),3);nanmean(nanmean(nanmean(hs1982,1),2),3);...
    nanmean(nanmean(nanmean(hs1983,1),2),3);nanmean(nanmean(nanmean(hs1984,1),2),3);...
    nanmean(nanmean(nanmean(hs1985,1),2),3);nanmean(nanmean(nanmean(hs1986,1),2),3);...
    nanmean(nanmean(nanmean(hs1987,1),2),3);nanmean(nanmean(nanmean(hs1988,1),2),3);...
    nanmean(nanmean(nanmean(hs1989,1),2),3);nanmean(nanmean(nanmean(hs1990,1),2),3);...
    nanmean(nanmean(nanmean(hs1991,1),2),3);nanmean(nanmean(nanmean(hs1992,1),2),3);...
    nanmean(nanmean(nanmean(hs1993,1),2),3);nanmean(nanmean(nanmean(hs1994,1),2),3);...
    nanmean(nanmean(nanmean(hs1995,1),2),3);nanmean(nanmean(nanmean(hs1996,1),2),3);...
    nanmean(nanmean(nanmean(hs1997,1),2),3);nanmean(nanmean(nanmean(hs1998,1),2),3);...
    nanmean(nanmean(nanmean(hs1999,1),2),3);nanmean(nanmean(nanmean(hs2000,1),2),3);...
    nanmean(nanmean(nanmean(hs2001,1),2),3);nanmean(nanmean(nanmean(hs2002,1),2),3);...
    nanmean(nanmean(nanmean(hs2003,1),2),3);nanmean(nanmean(nanmean(hs2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4 MIROC5 MRI_CGCM3

%%
Date=1979:2004;
figure
plot(Date,ACCESS,'o-r');hold on 
plot(Date,BCC_CSM,'>-b');hold on
plot(Date,CNRM_CM5,'x-r');hold on
plot(Date,GFDL_CM3,'p-c');hold on
plot(Date,HADGEM2_ES,'+-m');hold on
plot(Date,INM_CM4,'*-y');hold on
plot(Date,MIROC5,'s-k');hold on
plot(Date,MRI_CGCM3,'d-g');hold on
plot(Date,ENSEMBLE,'d-r');hold on
plot(Date,ERA5,'v-k');
xlim([1979 2004])
legend('ACCESS1-0','BCC-CSM1-1','CNRM-CM5','GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3','ENSEMBLE','ERA5','Location','south','NumColumns',3);
title('Significant Wave Height for GoG','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Hs (m)','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MEAN WAVE PERIOD

load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ENSEMBLE_tm', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=ENSEMBLE_tm(:,:,1:12);
tm1980=ENSEMBLE_tm(:,:,13:24);
tm1981=ENSEMBLE_tm(:,:,25:36);
tm1982=ENSEMBLE_tm(:,:,37:48);
tm1983=ENSEMBLE_tm(:,:,49:60);
tm1984=ENSEMBLE_tm(:,:,61:72);
tm1985=ENSEMBLE_tm(:,:,73:84);
tm1986=ENSEMBLE_tm(:,:,85:96);
tm1987=ENSEMBLE_tm(:,:,97:108);
tm1988=ENSEMBLE_tm(:,:,109:120);
tm1989=ENSEMBLE_tm(:,:,121:132);
tm1990=ENSEMBLE_tm(:,:,133:144);
tm1991=ENSEMBLE_tm(:,:,145:156);
tm1992=ENSEMBLE_tm(:,:,157:168);
tm1993=ENSEMBLE_tm(:,:,169:180);
tm1994=ENSEMBLE_tm(:,:,181:192);
tm1995=ENSEMBLE_tm(:,:,193:204);
tm1996=ENSEMBLE_tm(:,:,205:216);
tm1997=ENSEMBLE_tm(:,:,217:228);
tm1998=ENSEMBLE_tm(:,:,229:240);
tm1999=ENSEMBLE_tm(:,:,241:252);
tm2000=ENSEMBLE_tm(:,:,253:264);
tm2001=ENSEMBLE_tm(:,:,265:276);
tm2002=ENSEMBLE_tm(:,:,277:288);
tm2003=ENSEMBLE_tm(:,:,289:300);
tm2004=ENSEMBLE_tm(:,:,301:312);
 
 
%%
ENSEMBLE=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];


clearvars -EXCEPT ENSEMBLE
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ACCESS1_0_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=ACCESS1_0_tm0p5_1979_2004(:,:,1:12);
tm1980=ACCESS1_0_tm0p5_1979_2004(:,:,13:24);
tm1981=ACCESS1_0_tm0p5_1979_2004(:,:,25:36);
tm1982=ACCESS1_0_tm0p5_1979_2004(:,:,37:48);
tm1983=ACCESS1_0_tm0p5_1979_2004(:,:,49:60);
tm1984=ACCESS1_0_tm0p5_1979_2004(:,:,61:72);
tm1985=ACCESS1_0_tm0p5_1979_2004(:,:,73:84);
tm1986=ACCESS1_0_tm0p5_1979_2004(:,:,85:96);
tm1987=ACCESS1_0_tm0p5_1979_2004(:,:,97:108);
tm1988=ACCESS1_0_tm0p5_1979_2004(:,:,109:120);
tm1989=ACCESS1_0_tm0p5_1979_2004(:,:,121:132);
tm1990=ACCESS1_0_tm0p5_1979_2004(:,:,133:144);
tm1991=ACCESS1_0_tm0p5_1979_2004(:,:,145:156);
tm1992=ACCESS1_0_tm0p5_1979_2004(:,:,157:168);
tm1993=ACCESS1_0_tm0p5_1979_2004(:,:,169:180);
tm1994=ACCESS1_0_tm0p5_1979_2004(:,:,181:192);
tm1995=ACCESS1_0_tm0p5_1979_2004(:,:,193:204);
tm1996=ACCESS1_0_tm0p5_1979_2004(:,:,205:216);
tm1997=ACCESS1_0_tm0p5_1979_2004(:,:,217:228);
tm1998=ACCESS1_0_tm0p5_1979_2004(:,:,229:240);
tm1999=ACCESS1_0_tm0p5_1979_2004(:,:,241:252);
tm2000=ACCESS1_0_tm0p5_1979_2004(:,:,253:264);
tm2001=ACCESS1_0_tm0p5_1979_2004(:,:,265:276);
tm2002=ACCESS1_0_tm0p5_1979_2004(:,:,277:288);
tm2003=ACCESS1_0_tm0p5_1979_2004(:,:,289:300);
tm2004=ACCESS1_0_tm0p5_1979_2004(:,:,301:312);
  
%%
ACCESS=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];


clearvars -EXCEPT ENSEMBLE ACCESS
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'BCC_CSM1_1_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=BCC_CSM1_1_tm0p5_1979_2004(:,:,1:12);
tm1980=BCC_CSM1_1_tm0p5_1979_2004(:,:,13:24);
tm1981=BCC_CSM1_1_tm0p5_1979_2004(:,:,25:36);
tm1982=BCC_CSM1_1_tm0p5_1979_2004(:,:,37:48);
tm1983=BCC_CSM1_1_tm0p5_1979_2004(:,:,49:60);
tm1984=BCC_CSM1_1_tm0p5_1979_2004(:,:,61:72);
tm1985=BCC_CSM1_1_tm0p5_1979_2004(:,:,73:84);
tm1986=BCC_CSM1_1_tm0p5_1979_2004(:,:,85:96);
tm1987=BCC_CSM1_1_tm0p5_1979_2004(:,:,97:108);
tm1988=BCC_CSM1_1_tm0p5_1979_2004(:,:,109:120);
tm1989=BCC_CSM1_1_tm0p5_1979_2004(:,:,121:132);
tm1990=BCC_CSM1_1_tm0p5_1979_2004(:,:,133:144);
tm1991=BCC_CSM1_1_tm0p5_1979_2004(:,:,145:156);
tm1992=BCC_CSM1_1_tm0p5_1979_2004(:,:,157:168);
tm1993=BCC_CSM1_1_tm0p5_1979_2004(:,:,169:180);
tm1994=BCC_CSM1_1_tm0p5_1979_2004(:,:,181:192);
tm1995=BCC_CSM1_1_tm0p5_1979_2004(:,:,193:204);
tm1996=BCC_CSM1_1_tm0p5_1979_2004(:,:,205:216);
tm1997=BCC_CSM1_1_tm0p5_1979_2004(:,:,217:228);
tm1998=BCC_CSM1_1_tm0p5_1979_2004(:,:,229:240);
tm1999=BCC_CSM1_1_tm0p5_1979_2004(:,:,241:252);
tm2000=BCC_CSM1_1_tm0p5_1979_2004(:,:,253:264);
tm2001=BCC_CSM1_1_tm0p5_1979_2004(:,:,265:276);
tm2002=BCC_CSM1_1_tm0p5_1979_2004(:,:,277:288);
tm2003=BCC_CSM1_1_tm0p5_1979_2004(:,:,289:300);
tm2004=BCC_CSM1_1_tm0p5_1979_2004(:,:,301:312);
%%
BCC_CSM=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];


clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS
 
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'CNRM_CM5_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=CNRM_CM5_tm0p5_1979_2004(:,:,1:12);
tm1980=CNRM_CM5_tm0p5_1979_2004(:,:,13:24);
tm1981=CNRM_CM5_tm0p5_1979_2004(:,:,25:36);
tm1982=CNRM_CM5_tm0p5_1979_2004(:,:,37:48);
tm1983=CNRM_CM5_tm0p5_1979_2004(:,:,49:60);
tm1984=CNRM_CM5_tm0p5_1979_2004(:,:,61:72);
tm1985=CNRM_CM5_tm0p5_1979_2004(:,:,73:84);
tm1986=CNRM_CM5_tm0p5_1979_2004(:,:,85:96);
tm1987=CNRM_CM5_tm0p5_1979_2004(:,:,97:108);
tm1988=CNRM_CM5_tm0p5_1979_2004(:,:,109:120);
tm1989=CNRM_CM5_tm0p5_1979_2004(:,:,121:132);
tm1990=CNRM_CM5_tm0p5_1979_2004(:,:,133:144);
tm1991=CNRM_CM5_tm0p5_1979_2004(:,:,145:156);
tm1992=CNRM_CM5_tm0p5_1979_2004(:,:,157:168);
tm1993=CNRM_CM5_tm0p5_1979_2004(:,:,169:180);
tm1994=CNRM_CM5_tm0p5_1979_2004(:,:,181:192);
tm1995=CNRM_CM5_tm0p5_1979_2004(:,:,193:204);
tm1996=CNRM_CM5_tm0p5_1979_2004(:,:,205:216);
tm1997=CNRM_CM5_tm0p5_1979_2004(:,:,217:228);
tm1998=CNRM_CM5_tm0p5_1979_2004(:,:,229:240);
tm1999=CNRM_CM5_tm0p5_1979_2004(:,:,241:252);
tm2000=CNRM_CM5_tm0p5_1979_2004(:,:,253:264);
tm2001=CNRM_CM5_tm0p5_1979_2004(:,:,265:276);
tm2002=CNRM_CM5_tm0p5_1979_2004(:,:,277:288);
tm2003=CNRM_CM5_tm0p5_1979_2004(:,:,289:300);
tm2004=CNRM_CM5_tm0p5_1979_2004(:,:,301:312);
 
%%
CNRM_CM5=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];

 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ERA5_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=ERA5_tm0p5_1979_2004(:,:,1:12);
tm1980=ERA5_tm0p5_1979_2004(:,:,13:24);
tm1981=ERA5_tm0p5_1979_2004(:,:,25:36);
tm1982=ERA5_tm0p5_1979_2004(:,:,37:48);
tm1983=ERA5_tm0p5_1979_2004(:,:,49:60);
tm1984=ERA5_tm0p5_1979_2004(:,:,61:72);
tm1985=ERA5_tm0p5_1979_2004(:,:,73:84);
tm1986=ERA5_tm0p5_1979_2004(:,:,85:96);
tm1987=ERA5_tm0p5_1979_2004(:,:,97:108);
tm1988=ERA5_tm0p5_1979_2004(:,:,109:120);
tm1989=ERA5_tm0p5_1979_2004(:,:,121:132);
tm1990=ERA5_tm0p5_1979_2004(:,:,133:144);
tm1991=ERA5_tm0p5_1979_2004(:,:,145:156);
tm1992=ERA5_tm0p5_1979_2004(:,:,157:168);
tm1993=ERA5_tm0p5_1979_2004(:,:,169:180);
tm1994=ERA5_tm0p5_1979_2004(:,:,181:192);
tm1995=ERA5_tm0p5_1979_2004(:,:,193:204);
tm1996=ERA5_tm0p5_1979_2004(:,:,205:216);
tm1997=ERA5_tm0p5_1979_2004(:,:,217:228);
tm1998=ERA5_tm0p5_1979_2004(:,:,229:240);
tm1999=ERA5_tm0p5_1979_2004(:,:,241:252);
tm2000=ERA5_tm0p5_1979_2004(:,:,253:264);
tm2001=ERA5_tm0p5_1979_2004(:,:,265:276);
tm2002=ERA5_tm0p5_1979_2004(:,:,277:288);
tm2003=ERA5_tm0p5_1979_2004(:,:,289:300);
tm2004=ERA5_tm0p5_1979_2004(:,:,301:312);
 
%%
ERA5=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];


clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'GFDL_CM3_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=GFDL_CM3_tm0p5_1979_2004(:,:,1:12);
tm1980=GFDL_CM3_tm0p5_1979_2004(:,:,13:24);
tm1981=GFDL_CM3_tm0p5_1979_2004(:,:,25:36);
tm1982=GFDL_CM3_tm0p5_1979_2004(:,:,37:48);
tm1983=GFDL_CM3_tm0p5_1979_2004(:,:,49:60);
tm1984=GFDL_CM3_tm0p5_1979_2004(:,:,61:72);
tm1985=GFDL_CM3_tm0p5_1979_2004(:,:,73:84);
tm1986=GFDL_CM3_tm0p5_1979_2004(:,:,85:96);
tm1987=GFDL_CM3_tm0p5_1979_2004(:,:,97:108);
tm1988=GFDL_CM3_tm0p5_1979_2004(:,:,109:120);
tm1989=GFDL_CM3_tm0p5_1979_2004(:,:,121:132);
tm1990=GFDL_CM3_tm0p5_1979_2004(:,:,133:144);
tm1991=GFDL_CM3_tm0p5_1979_2004(:,:,145:156);
tm1992=GFDL_CM3_tm0p5_1979_2004(:,:,157:168);
tm1993=GFDL_CM3_tm0p5_1979_2004(:,:,169:180);
tm1994=GFDL_CM3_tm0p5_1979_2004(:,:,181:192);
tm1995=GFDL_CM3_tm0p5_1979_2004(:,:,193:204);
tm1996=GFDL_CM3_tm0p5_1979_2004(:,:,205:216);
tm1997=GFDL_CM3_tm0p5_1979_2004(:,:,217:228);
tm1998=GFDL_CM3_tm0p5_1979_2004(:,:,229:240);
tm1999=GFDL_CM3_tm0p5_1979_2004(:,:,241:252);
tm2000=GFDL_CM3_tm0p5_1979_2004(:,:,253:264);
tm2001=GFDL_CM3_tm0p5_1979_2004(:,:,265:276);
tm2002=GFDL_CM3_tm0p5_1979_2004(:,:,277:288);
tm2003=GFDL_CM3_tm0p5_1979_2004(:,:,289:300);
tm2004=GFDL_CM3_tm0p5_1979_2004(:,:,301:312);
 
 
%%
GFDL_CM3=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'HADGEM2_ES_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=HADGEM2_ES_tm0p5_1979_2004(:,:,1:12);
tm1980=HADGEM2_ES_tm0p5_1979_2004(:,:,13:24);
tm1981=HADGEM2_ES_tm0p5_1979_2004(:,:,25:36);
tm1982=HADGEM2_ES_tm0p5_1979_2004(:,:,37:48);
tm1983=HADGEM2_ES_tm0p5_1979_2004(:,:,49:60);
tm1984=HADGEM2_ES_tm0p5_1979_2004(:,:,61:72);
tm1985=HADGEM2_ES_tm0p5_1979_2004(:,:,73:84);
tm1986=HADGEM2_ES_tm0p5_1979_2004(:,:,85:96);
tm1987=HADGEM2_ES_tm0p5_1979_2004(:,:,97:108);
tm1988=HADGEM2_ES_tm0p5_1979_2004(:,:,109:120);
tm1989=HADGEM2_ES_tm0p5_1979_2004(:,:,121:132);
tm1990=HADGEM2_ES_tm0p5_1979_2004(:,:,133:144);
tm1991=HADGEM2_ES_tm0p5_1979_2004(:,:,145:156);
tm1992=HADGEM2_ES_tm0p5_1979_2004(:,:,157:168);
tm1993=HADGEM2_ES_tm0p5_1979_2004(:,:,169:180);
tm1994=HADGEM2_ES_tm0p5_1979_2004(:,:,181:192);
tm1995=HADGEM2_ES_tm0p5_1979_2004(:,:,193:204);
tm1996=HADGEM2_ES_tm0p5_1979_2004(:,:,205:216);
tm1997=HADGEM2_ES_tm0p5_1979_2004(:,:,217:228);
tm1998=HADGEM2_ES_tm0p5_1979_2004(:,:,229:240);
tm1999=HADGEM2_ES_tm0p5_1979_2004(:,:,241:252);
tm2000=HADGEM2_ES_tm0p5_1979_2004(:,:,253:264);
tm2001=HADGEM2_ES_tm0p5_1979_2004(:,:,265:276);
tm2002=HADGEM2_ES_tm0p5_1979_2004(:,:,277:288);
tm2003=HADGEM2_ES_tm0p5_1979_2004(:,:,289:300);
tm2004=HADGEM2_ES_tm0p5_1979_2004(:,:,301:312);
 
 
%%
HADGEM2_ES=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];


clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'INM_CM4_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=INM_CM4_tm0p5_1979_2004(:,:,1:12);
tm1980=INM_CM4_tm0p5_1979_2004(:,:,13:24);
tm1981=INM_CM4_tm0p5_1979_2004(:,:,25:36);
tm1982=INM_CM4_tm0p5_1979_2004(:,:,37:48);
tm1983=INM_CM4_tm0p5_1979_2004(:,:,49:60);
tm1984=INM_CM4_tm0p5_1979_2004(:,:,61:72);
tm1985=INM_CM4_tm0p5_1979_2004(:,:,73:84);
tm1986=INM_CM4_tm0p5_1979_2004(:,:,85:96);
tm1987=INM_CM4_tm0p5_1979_2004(:,:,97:108);
tm1988=INM_CM4_tm0p5_1979_2004(:,:,109:120);
tm1989=INM_CM4_tm0p5_1979_2004(:,:,121:132);
tm1990=INM_CM4_tm0p5_1979_2004(:,:,133:144);
tm1991=INM_CM4_tm0p5_1979_2004(:,:,145:156);
tm1992=INM_CM4_tm0p5_1979_2004(:,:,157:168);
tm1993=INM_CM4_tm0p5_1979_2004(:,:,169:180);
tm1994=INM_CM4_tm0p5_1979_2004(:,:,181:192);
tm1995=INM_CM4_tm0p5_1979_2004(:,:,193:204);
tm1996=INM_CM4_tm0p5_1979_2004(:,:,205:216);
tm1997=INM_CM4_tm0p5_1979_2004(:,:,217:228);
tm1998=INM_CM4_tm0p5_1979_2004(:,:,229:240);
tm1999=INM_CM4_tm0p5_1979_2004(:,:,241:252);
tm2000=INM_CM4_tm0p5_1979_2004(:,:,253:264);
tm2001=INM_CM4_tm0p5_1979_2004(:,:,265:276);
tm2002=INM_CM4_tm0p5_1979_2004(:,:,277:288);
tm2003=INM_CM4_tm0p5_1979_2004(:,:,289:300);
tm2004=INM_CM4_tm0p5_1979_2004(:,:,301:312);
  
%%
INM_CM4=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'MIROC5_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=MIROC5_tm0p5_1979_2004(:,:,1:12);
tm1980=MIROC5_tm0p5_1979_2004(:,:,13:24);
tm1981=MIROC5_tm0p5_1979_2004(:,:,25:36);
tm1982=MIROC5_tm0p5_1979_2004(:,:,37:48);
tm1983=MIROC5_tm0p5_1979_2004(:,:,49:60);
tm1984=MIROC5_tm0p5_1979_2004(:,:,61:72);
tm1985=MIROC5_tm0p5_1979_2004(:,:,73:84);
tm1986=MIROC5_tm0p5_1979_2004(:,:,85:96);
tm1987=MIROC5_tm0p5_1979_2004(:,:,97:108);
tm1988=MIROC5_tm0p5_1979_2004(:,:,109:120);
tm1989=MIROC5_tm0p5_1979_2004(:,:,121:132);
tm1990=MIROC5_tm0p5_1979_2004(:,:,133:144);
tm1991=MIROC5_tm0p5_1979_2004(:,:,145:156);
tm1992=MIROC5_tm0p5_1979_2004(:,:,157:168);
tm1993=MIROC5_tm0p5_1979_2004(:,:,169:180);
tm1994=MIROC5_tm0p5_1979_2004(:,:,181:192);
tm1995=MIROC5_tm0p5_1979_2004(:,:,193:204);
tm1996=MIROC5_tm0p5_1979_2004(:,:,205:216);
tm1997=MIROC5_tm0p5_1979_2004(:,:,217:228);
tm1998=MIROC5_tm0p5_1979_2004(:,:,229:240);
tm1999=MIROC5_tm0p5_1979_2004(:,:,241:252);
tm2000=MIROC5_tm0p5_1979_2004(:,:,253:264);
tm2001=MIROC5_tm0p5_1979_2004(:,:,265:276);
tm2002=MIROC5_tm0p5_1979_2004(:,:,277:288);
tm2003=MIROC5_tm0p5_1979_2004(:,:,289:300);
tm2004=MIROC5_tm0p5_1979_2004(:,:,301:312);
 
 
%%
MIROC5=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];


clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4 MIROC5
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'MRI_CGCM3_tm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
tm1979=MRI_CGCM3_tm0p5_1979_2004(:,:,1:12);
tm1980=MRI_CGCM3_tm0p5_1979_2004(:,:,13:24);
tm1981=MRI_CGCM3_tm0p5_1979_2004(:,:,25:36);
tm1982=MRI_CGCM3_tm0p5_1979_2004(:,:,37:48);
tm1983=MRI_CGCM3_tm0p5_1979_2004(:,:,49:60);
tm1984=MRI_CGCM3_tm0p5_1979_2004(:,:,61:72);
tm1985=MRI_CGCM3_tm0p5_1979_2004(:,:,73:84);
tm1986=MRI_CGCM3_tm0p5_1979_2004(:,:,85:96);
tm1987=MRI_CGCM3_tm0p5_1979_2004(:,:,97:108);
tm1988=MRI_CGCM3_tm0p5_1979_2004(:,:,109:120);
tm1989=MRI_CGCM3_tm0p5_1979_2004(:,:,121:132);
tm1990=MRI_CGCM3_tm0p5_1979_2004(:,:,133:144);
tm1991=MRI_CGCM3_tm0p5_1979_2004(:,:,145:156);
tm1992=MRI_CGCM3_tm0p5_1979_2004(:,:,157:168);
tm1993=MRI_CGCM3_tm0p5_1979_2004(:,:,169:180);
tm1994=MRI_CGCM3_tm0p5_1979_2004(:,:,181:192);
tm1995=MRI_CGCM3_tm0p5_1979_2004(:,:,193:204);
tm1996=MRI_CGCM3_tm0p5_1979_2004(:,:,205:216);
tm1997=MRI_CGCM3_tm0p5_1979_2004(:,:,217:228);
tm1998=MRI_CGCM3_tm0p5_1979_2004(:,:,229:240);
tm1999=MRI_CGCM3_tm0p5_1979_2004(:,:,241:252);
tm2000=MRI_CGCM3_tm0p5_1979_2004(:,:,253:264);
tm2001=MRI_CGCM3_tm0p5_1979_2004(:,:,265:276);
tm2002=MRI_CGCM3_tm0p5_1979_2004(:,:,277:288);
tm2003=MRI_CGCM3_tm0p5_1979_2004(:,:,289:300);
tm2004=MRI_CGCM3_tm0p5_1979_2004(:,:,301:312);
 
 
%%
MRI_CGCM3=[nanmean(nanmean(nanmean(tm1979,1),2),3);nanmean(nanmean(nanmean(tm1980,1),2),3);...
    nanmean(nanmean(nanmean(tm1981,1),2),3);nanmean(nanmean(nanmean(tm1982,1),2),3);...
    nanmean(nanmean(nanmean(tm1983,1),2),3);nanmean(nanmean(nanmean(tm1984,1),2),3);...
    nanmean(nanmean(nanmean(tm1985,1),2),3);nanmean(nanmean(nanmean(tm1986,1),2),3);...
    nanmean(nanmean(nanmean(tm1987,1),2),3);nanmean(nanmean(nanmean(tm1988,1),2),3);...
    nanmean(nanmean(nanmean(tm1989,1),2),3);nanmean(nanmean(nanmean(tm1990,1),2),3);...
    nanmean(nanmean(nanmean(tm1991,1),2),3);nanmean(nanmean(nanmean(tm1992,1),2),3);...
    nanmean(nanmean(nanmean(tm1993,1),2),3);nanmean(nanmean(nanmean(tm1994,1),2),3);...
    nanmean(nanmean(nanmean(tm1995,1),2),3);nanmean(nanmean(nanmean(tm1996,1),2),3);...
    nanmean(nanmean(nanmean(tm1997,1),2),3);nanmean(nanmean(nanmean(tm1998,1),2),3);...
    nanmean(nanmean(nanmean(tm1999,1),2),3);nanmean(nanmean(nanmean(tm2000,1),2),3);...
    nanmean(nanmean(nanmean(tm2001,1),2),3);nanmean(nanmean(nanmean(tm2002,1),2),3);...
    nanmean(nanmean(nanmean(tm2003,1),2),3);nanmean(nanmean(nanmean(tm2004,1),2),3)];

clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4 MIROC5 MRI_CGCM3
 
%%
Date=1979:2004;
figure
plot(Date,ACCESS,'o-r');hold on 
plot(Date,BCC_CSM,'>-b');hold on
plot(Date,CNRM_CM5,'x-r');hold on
plot(Date,GFDL_CM3,'p-c');hold on
plot(Date,HADGEM2_ES,'+-m');hold on
plot(Date,INM_CM4,'*-y');hold on
plot(Date,MIROC5,'s-k');hold on
plot(Date,MRI_CGCM3,'d-g');hold on
plot(Date,ENSEMBLE,'d-r');hold on
plot(Date,ERA5,'v-k');
xlim([1979 2004])
legend('ACCESS1-0','BCC-CSM1-1','CNRM-CM5','GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3','ENSEMBLE','ERA5','Location','south','NumColumns',3);
title('Mean Wave Period for GoG','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Tm (s)','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
 

%% MEAN WAVE DIRECTION
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ENSEMBLE_dm', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=ENSEMBLE_dm(:,:,1:12);
dm1980=ENSEMBLE_dm(:,:,13:24);
dm1981=ENSEMBLE_dm(:,:,25:36);
dm1982=ENSEMBLE_dm(:,:,37:48);
dm1983=ENSEMBLE_dm(:,:,49:60);
dm1984=ENSEMBLE_dm(:,:,61:72);
dm1985=ENSEMBLE_dm(:,:,73:84);
dm1986=ENSEMBLE_dm(:,:,85:96);
dm1987=ENSEMBLE_dm(:,:,97:108);
dm1988=ENSEMBLE_dm(:,:,109:120);
dm1989=ENSEMBLE_dm(:,:,121:132);
dm1990=ENSEMBLE_dm(:,:,133:144);
dm1991=ENSEMBLE_dm(:,:,145:156);
dm1992=ENSEMBLE_dm(:,:,157:168);
dm1993=ENSEMBLE_dm(:,:,169:180);
dm1994=ENSEMBLE_dm(:,:,181:192);
dm1995=ENSEMBLE_dm(:,:,193:204);
dm1996=ENSEMBLE_dm(:,:,205:216);
dm1997=ENSEMBLE_dm(:,:,217:228);
dm1998=ENSEMBLE_dm(:,:,229:240);
dm1999=ENSEMBLE_dm(:,:,241:252);
dm2000=ENSEMBLE_dm(:,:,253:264);
dm2001=ENSEMBLE_dm(:,:,265:276);
dm2002=ENSEMBLE_dm(:,:,277:288);
dm2003=ENSEMBLE_dm(:,:,289:300);
dm2004=ENSEMBLE_dm(:,:,301:312);
 
%%
ENSEMBLE=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
clearvars -EXCEPT ENSEMBLE
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ACCESS1_0_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=ACCESS1_0_dm0p5_1979_2004(:,:,1:12);
dm1980=ACCESS1_0_dm0p5_1979_2004(:,:,13:24);
dm1981=ACCESS1_0_dm0p5_1979_2004(:,:,25:36);
dm1982=ACCESS1_0_dm0p5_1979_2004(:,:,37:48);
dm1983=ACCESS1_0_dm0p5_1979_2004(:,:,49:60);
dm1984=ACCESS1_0_dm0p5_1979_2004(:,:,61:72);
dm1985=ACCESS1_0_dm0p5_1979_2004(:,:,73:84);
dm1986=ACCESS1_0_dm0p5_1979_2004(:,:,85:96);
dm1987=ACCESS1_0_dm0p5_1979_2004(:,:,97:108);
dm1988=ACCESS1_0_dm0p5_1979_2004(:,:,109:120);
dm1989=ACCESS1_0_dm0p5_1979_2004(:,:,121:132);
dm1990=ACCESS1_0_dm0p5_1979_2004(:,:,133:144);
dm1991=ACCESS1_0_dm0p5_1979_2004(:,:,145:156);
dm1992=ACCESS1_0_dm0p5_1979_2004(:,:,157:168);
dm1993=ACCESS1_0_dm0p5_1979_2004(:,:,169:180);
dm1994=ACCESS1_0_dm0p5_1979_2004(:,:,181:192);
dm1995=ACCESS1_0_dm0p5_1979_2004(:,:,193:204);
dm1996=ACCESS1_0_dm0p5_1979_2004(:,:,205:216);
dm1997=ACCESS1_0_dm0p5_1979_2004(:,:,217:228);
dm1998=ACCESS1_0_dm0p5_1979_2004(:,:,229:240);
dm1999=ACCESS1_0_dm0p5_1979_2004(:,:,241:252);
dm2000=ACCESS1_0_dm0p5_1979_2004(:,:,253:264);
dm2001=ACCESS1_0_dm0p5_1979_2004(:,:,265:276);
dm2002=ACCESS1_0_dm0p5_1979_2004(:,:,277:288);
dm2003=ACCESS1_0_dm0p5_1979_2004(:,:,289:300);
dm2004=ACCESS1_0_dm0p5_1979_2004(:,:,301:312);
 
%%
ACCESS=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
clearvars -EXCEPT ENSEMBLE ACCESS
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'BCC_CSM1_1_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=BCC_CSM1_1_dm0p5_1979_2004(:,:,1:12);
dm1980=BCC_CSM1_1_dm0p5_1979_2004(:,:,13:24);
dm1981=BCC_CSM1_1_dm0p5_1979_2004(:,:,25:36);
dm1982=BCC_CSM1_1_dm0p5_1979_2004(:,:,37:48);
dm1983=BCC_CSM1_1_dm0p5_1979_2004(:,:,49:60);
dm1984=BCC_CSM1_1_dm0p5_1979_2004(:,:,61:72);
dm1985=BCC_CSM1_1_dm0p5_1979_2004(:,:,73:84);
dm1986=BCC_CSM1_1_dm0p5_1979_2004(:,:,85:96);
dm1987=BCC_CSM1_1_dm0p5_1979_2004(:,:,97:108);
dm1988=BCC_CSM1_1_dm0p5_1979_2004(:,:,109:120);
dm1989=BCC_CSM1_1_dm0p5_1979_2004(:,:,121:132);
dm1990=BCC_CSM1_1_dm0p5_1979_2004(:,:,133:144);
dm1991=BCC_CSM1_1_dm0p5_1979_2004(:,:,145:156);
dm1992=BCC_CSM1_1_dm0p5_1979_2004(:,:,157:168);
dm1993=BCC_CSM1_1_dm0p5_1979_2004(:,:,169:180);
dm1994=BCC_CSM1_1_dm0p5_1979_2004(:,:,181:192);
dm1995=BCC_CSM1_1_dm0p5_1979_2004(:,:,193:204);
dm1996=BCC_CSM1_1_dm0p5_1979_2004(:,:,205:216);
dm1997=BCC_CSM1_1_dm0p5_1979_2004(:,:,217:228);
dm1998=BCC_CSM1_1_dm0p5_1979_2004(:,:,229:240);
dm1999=BCC_CSM1_1_dm0p5_1979_2004(:,:,241:252);
dm2000=BCC_CSM1_1_dm0p5_1979_2004(:,:,253:264);
dm2001=BCC_CSM1_1_dm0p5_1979_2004(:,:,265:276);
dm2002=BCC_CSM1_1_dm0p5_1979_2004(:,:,277:288);
dm2003=BCC_CSM1_1_dm0p5_1979_2004(:,:,289:300);
dm2004=BCC_CSM1_1_dm0p5_1979_2004(:,:,301:312);
 
%%
BCC_CSM=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS
 
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'CNRM_CM5_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=CNRM_CM5_dm0p5_1979_2004(:,:,1:12);
dm1980=CNRM_CM5_dm0p5_1979_2004(:,:,13:24);
dm1981=CNRM_CM5_dm0p5_1979_2004(:,:,25:36);
dm1982=CNRM_CM5_dm0p5_1979_2004(:,:,37:48);
dm1983=CNRM_CM5_dm0p5_1979_2004(:,:,49:60);
dm1984=CNRM_CM5_dm0p5_1979_2004(:,:,61:72);
dm1985=CNRM_CM5_dm0p5_1979_2004(:,:,73:84);
dm1986=CNRM_CM5_dm0p5_1979_2004(:,:,85:96);
dm1987=CNRM_CM5_dm0p5_1979_2004(:,:,97:108);
dm1988=CNRM_CM5_dm0p5_1979_2004(:,:,109:120);
dm1989=CNRM_CM5_dm0p5_1979_2004(:,:,121:132);
dm1990=CNRM_CM5_dm0p5_1979_2004(:,:,133:144);
dm1991=CNRM_CM5_dm0p5_1979_2004(:,:,145:156);
dm1992=CNRM_CM5_dm0p5_1979_2004(:,:,157:168);
dm1993=CNRM_CM5_dm0p5_1979_2004(:,:,169:180);
dm1994=CNRM_CM5_dm0p5_1979_2004(:,:,181:192);
dm1995=CNRM_CM5_dm0p5_1979_2004(:,:,193:204);
dm1996=CNRM_CM5_dm0p5_1979_2004(:,:,205:216);
dm1997=CNRM_CM5_dm0p5_1979_2004(:,:,217:228);
dm1998=CNRM_CM5_dm0p5_1979_2004(:,:,229:240);
dm1999=CNRM_CM5_dm0p5_1979_2004(:,:,241:252);
dm2000=CNRM_CM5_dm0p5_1979_2004(:,:,253:264);
dm2001=CNRM_CM5_dm0p5_1979_2004(:,:,265:276);
dm2002=CNRM_CM5_dm0p5_1979_2004(:,:,277:288);
dm2003=CNRM_CM5_dm0p5_1979_2004(:,:,289:300);
dm2004=CNRM_CM5_dm0p5_1979_2004(:,:,301:312);
 
%%
CNRM_CM5=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'ERA5_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=ERA5_dm0p5_1979_2004(:,:,1:12);
dm1980=ERA5_dm0p5_1979_2004(:,:,13:24);
dm1981=ERA5_dm0p5_1979_2004(:,:,25:36);
dm1982=ERA5_dm0p5_1979_2004(:,:,37:48);
dm1983=ERA5_dm0p5_1979_2004(:,:,49:60);
dm1984=ERA5_dm0p5_1979_2004(:,:,61:72);
dm1985=ERA5_dm0p5_1979_2004(:,:,73:84);
dm1986=ERA5_dm0p5_1979_2004(:,:,85:96);
dm1987=ERA5_dm0p5_1979_2004(:,:,97:108);
dm1988=ERA5_dm0p5_1979_2004(:,:,109:120);
dm1989=ERA5_dm0p5_1979_2004(:,:,121:132);
dm1990=ERA5_dm0p5_1979_2004(:,:,133:144);
dm1991=ERA5_dm0p5_1979_2004(:,:,145:156);
dm1992=ERA5_dm0p5_1979_2004(:,:,157:168);
dm1993=ERA5_dm0p5_1979_2004(:,:,169:180);
dm1994=ERA5_dm0p5_1979_2004(:,:,181:192);
dm1995=ERA5_dm0p5_1979_2004(:,:,193:204);
dm1996=ERA5_dm0p5_1979_2004(:,:,205:216);
dm1997=ERA5_dm0p5_1979_2004(:,:,217:228);
dm1998=ERA5_dm0p5_1979_2004(:,:,229:240);
dm1999=ERA5_dm0p5_1979_2004(:,:,241:252);
dm2000=ERA5_dm0p5_1979_2004(:,:,253:264);
dm2001=ERA5_dm0p5_1979_2004(:,:,265:276);
dm2002=ERA5_dm0p5_1979_2004(:,:,277:288);
dm2003=ERA5_dm0p5_1979_2004(:,:,289:300);
dm2004=ERA5_dm0p5_1979_2004(:,:,301:312);
 
%%
ERA5=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'GFDL_CM3_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=GFDL_CM3_dm0p5_1979_2004(:,:,1:12);
dm1980=GFDL_CM3_dm0p5_1979_2004(:,:,13:24);
dm1981=GFDL_CM3_dm0p5_1979_2004(:,:,25:36);
dm1982=GFDL_CM3_dm0p5_1979_2004(:,:,37:48);
dm1983=GFDL_CM3_dm0p5_1979_2004(:,:,49:60);
dm1984=GFDL_CM3_dm0p5_1979_2004(:,:,61:72);
dm1985=GFDL_CM3_dm0p5_1979_2004(:,:,73:84);
dm1986=GFDL_CM3_dm0p5_1979_2004(:,:,85:96);
dm1987=GFDL_CM3_dm0p5_1979_2004(:,:,97:108);
dm1988=GFDL_CM3_dm0p5_1979_2004(:,:,109:120);
dm1989=GFDL_CM3_dm0p5_1979_2004(:,:,121:132);
dm1990=GFDL_CM3_dm0p5_1979_2004(:,:,133:144);
dm1991=GFDL_CM3_dm0p5_1979_2004(:,:,145:156);
dm1992=GFDL_CM3_dm0p5_1979_2004(:,:,157:168);
dm1993=GFDL_CM3_dm0p5_1979_2004(:,:,169:180);
dm1994=GFDL_CM3_dm0p5_1979_2004(:,:,181:192);
dm1995=GFDL_CM3_dm0p5_1979_2004(:,:,193:204);
dm1996=GFDL_CM3_dm0p5_1979_2004(:,:,205:216);
dm1997=GFDL_CM3_dm0p5_1979_2004(:,:,217:228);
dm1998=GFDL_CM3_dm0p5_1979_2004(:,:,229:240);
dm1999=GFDL_CM3_dm0p5_1979_2004(:,:,241:252);
dm2000=GFDL_CM3_dm0p5_1979_2004(:,:,253:264);
dm2001=GFDL_CM3_dm0p5_1979_2004(:,:,265:276);
dm2002=GFDL_CM3_dm0p5_1979_2004(:,:,277:288);
dm2003=GFDL_CM3_dm0p5_1979_2004(:,:,289:300);
dm2004=GFDL_CM3_dm0p5_1979_2004(:,:,301:312);
 
%%
GFDL_CM3=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'HADGEM2_ES_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=HADGEM2_ES_dm0p5_1979_2004(:,:,1:12);
dm1980=HADGEM2_ES_dm0p5_1979_2004(:,:,13:24);
dm1981=HADGEM2_ES_dm0p5_1979_2004(:,:,25:36);
dm1982=HADGEM2_ES_dm0p5_1979_2004(:,:,37:48);
dm1983=HADGEM2_ES_dm0p5_1979_2004(:,:,49:60);
dm1984=HADGEM2_ES_dm0p5_1979_2004(:,:,61:72);
dm1985=HADGEM2_ES_dm0p5_1979_2004(:,:,73:84);
dm1986=HADGEM2_ES_dm0p5_1979_2004(:,:,85:96);
dm1987=HADGEM2_ES_dm0p5_1979_2004(:,:,97:108);
dm1988=HADGEM2_ES_dm0p5_1979_2004(:,:,109:120);
dm1989=HADGEM2_ES_dm0p5_1979_2004(:,:,121:132);
dm1990=HADGEM2_ES_dm0p5_1979_2004(:,:,133:144);
dm1991=HADGEM2_ES_dm0p5_1979_2004(:,:,145:156);
dm1992=HADGEM2_ES_dm0p5_1979_2004(:,:,157:168);
dm1993=HADGEM2_ES_dm0p5_1979_2004(:,:,169:180);
dm1994=HADGEM2_ES_dm0p5_1979_2004(:,:,181:192);
dm1995=HADGEM2_ES_dm0p5_1979_2004(:,:,193:204);
dm1996=HADGEM2_ES_dm0p5_1979_2004(:,:,205:216);
dm1997=HADGEM2_ES_dm0p5_1979_2004(:,:,217:228);
dm1998=HADGEM2_ES_dm0p5_1979_2004(:,:,229:240);
dm1999=HADGEM2_ES_dm0p5_1979_2004(:,:,241:252);
dm2000=HADGEM2_ES_dm0p5_1979_2004(:,:,253:264);
dm2001=HADGEM2_ES_dm0p5_1979_2004(:,:,265:276);
dm2002=HADGEM2_ES_dm0p5_1979_2004(:,:,277:288);
dm2003=HADGEM2_ES_dm0p5_1979_2004(:,:,289:300);
dm2004=HADGEM2_ES_dm0p5_1979_2004(:,:,301:312);
 
%%
HADGEM2_ES=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'INM_CM4_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=INM_CM4_dm0p5_1979_2004(:,:,1:12);
dm1980=INM_CM4_dm0p5_1979_2004(:,:,13:24);
dm1981=INM_CM4_dm0p5_1979_2004(:,:,25:36);
dm1982=INM_CM4_dm0p5_1979_2004(:,:,37:48);
dm1983=INM_CM4_dm0p5_1979_2004(:,:,49:60);
dm1984=INM_CM4_dm0p5_1979_2004(:,:,61:72);
dm1985=INM_CM4_dm0p5_1979_2004(:,:,73:84);
dm1986=INM_CM4_dm0p5_1979_2004(:,:,85:96);
dm1987=INM_CM4_dm0p5_1979_2004(:,:,97:108);
dm1988=INM_CM4_dm0p5_1979_2004(:,:,109:120);
dm1989=INM_CM4_dm0p5_1979_2004(:,:,121:132);
dm1990=INM_CM4_dm0p5_1979_2004(:,:,133:144);
dm1991=INM_CM4_dm0p5_1979_2004(:,:,145:156);
dm1992=INM_CM4_dm0p5_1979_2004(:,:,157:168);
dm1993=INM_CM4_dm0p5_1979_2004(:,:,169:180);
dm1994=INM_CM4_dm0p5_1979_2004(:,:,181:192);
dm1995=INM_CM4_dm0p5_1979_2004(:,:,193:204);
dm1996=INM_CM4_dm0p5_1979_2004(:,:,205:216);
dm1997=INM_CM4_dm0p5_1979_2004(:,:,217:228);
dm1998=INM_CM4_dm0p5_1979_2004(:,:,229:240);
dm1999=INM_CM4_dm0p5_1979_2004(:,:,241:252);
dm2000=INM_CM4_dm0p5_1979_2004(:,:,253:264);
dm2001=INM_CM4_dm0p5_1979_2004(:,:,265:276);
dm2002=INM_CM4_dm0p5_1979_2004(:,:,277:288);
dm2003=INM_CM4_dm0p5_1979_2004(:,:,289:300);
dm2004=INM_CM4_dm0p5_1979_2004(:,:,301:312);
 
%%
INM_CM4=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'MIROC5_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=MIROC5_dm0p5_1979_2004(:,:,1:12);
dm1980=MIROC5_dm0p5_1979_2004(:,:,13:24);
dm1981=MIROC5_dm0p5_1979_2004(:,:,25:36);
dm1982=MIROC5_dm0p5_1979_2004(:,:,37:48);
dm1983=MIROC5_dm0p5_1979_2004(:,:,49:60);
dm1984=MIROC5_dm0p5_1979_2004(:,:,61:72);
dm1985=MIROC5_dm0p5_1979_2004(:,:,73:84);
dm1986=MIROC5_dm0p5_1979_2004(:,:,85:96);
dm1987=MIROC5_dm0p5_1979_2004(:,:,97:108);
dm1988=MIROC5_dm0p5_1979_2004(:,:,109:120);
dm1989=MIROC5_dm0p5_1979_2004(:,:,121:132);
dm1990=MIROC5_dm0p5_1979_2004(:,:,133:144);
dm1991=MIROC5_dm0p5_1979_2004(:,:,145:156);
dm1992=MIROC5_dm0p5_1979_2004(:,:,157:168);
dm1993=MIROC5_dm0p5_1979_2004(:,:,169:180);
dm1994=MIROC5_dm0p5_1979_2004(:,:,181:192);
dm1995=MIROC5_dm0p5_1979_2004(:,:,193:204);
dm1996=MIROC5_dm0p5_1979_2004(:,:,205:216);
dm1997=MIROC5_dm0p5_1979_2004(:,:,217:228);
dm1998=MIROC5_dm0p5_1979_2004(:,:,229:240);
dm1999=MIROC5_dm0p5_1979_2004(:,:,241:252);
dm2000=MIROC5_dm0p5_1979_2004(:,:,253:264);
dm2001=MIROC5_dm0p5_1979_2004(:,:,265:276);
dm2002=MIROC5_dm0p5_1979_2004(:,:,277:288);
dm2003=MIROC5_dm0p5_1979_2004(:,:,289:300);
dm2004=MIROC5_dm0p5_1979_2004(:,:,301:312);
 
 
%%
MIROC5=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4 MIROC5
 
%%
load('/media/profdam/Data/All_models/COWCLIP_ENSEMBLE_ERA5_all_models_historical0p5.mat', 'MRI_CGCM3_dm0p5_1979_2004', 'Xlong', 'Ylat');
 
%%  
%Step 1
dm1979=MRI_CGCM3_dm0p5_1979_2004(:,:,1:12);
dm1980=MRI_CGCM3_dm0p5_1979_2004(:,:,13:24);
dm1981=MRI_CGCM3_dm0p5_1979_2004(:,:,25:36);
dm1982=MRI_CGCM3_dm0p5_1979_2004(:,:,37:48);
dm1983=MRI_CGCM3_dm0p5_1979_2004(:,:,49:60);
dm1984=MRI_CGCM3_dm0p5_1979_2004(:,:,61:72);
dm1985=MRI_CGCM3_dm0p5_1979_2004(:,:,73:84);
dm1986=MRI_CGCM3_dm0p5_1979_2004(:,:,85:96);
dm1987=MRI_CGCM3_dm0p5_1979_2004(:,:,97:108);
dm1988=MRI_CGCM3_dm0p5_1979_2004(:,:,109:120);
dm1989=MRI_CGCM3_dm0p5_1979_2004(:,:,121:132);
dm1990=MRI_CGCM3_dm0p5_1979_2004(:,:,133:144);
dm1991=MRI_CGCM3_dm0p5_1979_2004(:,:,145:156);
dm1992=MRI_CGCM3_dm0p5_1979_2004(:,:,157:168);
dm1993=MRI_CGCM3_dm0p5_1979_2004(:,:,169:180);
dm1994=MRI_CGCM3_dm0p5_1979_2004(:,:,181:192);
dm1995=MRI_CGCM3_dm0p5_1979_2004(:,:,193:204);
dm1996=MRI_CGCM3_dm0p5_1979_2004(:,:,205:216);
dm1997=MRI_CGCM3_dm0p5_1979_2004(:,:,217:228);
dm1998=MRI_CGCM3_dm0p5_1979_2004(:,:,229:240);
dm1999=MRI_CGCM3_dm0p5_1979_2004(:,:,241:252);
dm2000=MRI_CGCM3_dm0p5_1979_2004(:,:,253:264);
dm2001=MRI_CGCM3_dm0p5_1979_2004(:,:,265:276);
dm2002=MRI_CGCM3_dm0p5_1979_2004(:,:,277:288);
dm2003=MRI_CGCM3_dm0p5_1979_2004(:,:,289:300);
dm2004=MRI_CGCM3_dm0p5_1979_2004(:,:,301:312);
 
 
%%
MRI_CGCM3=[nanmean(nanmean(nanmean(dm1979,1),2),3);nanmean(nanmean(nanmean(dm1980,1),2),3);...
    nanmean(nanmean(nanmean(dm1981,1),2),3);nanmean(nanmean(nanmean(dm1982,1),2),3);...
    nanmean(nanmean(nanmean(dm1983,1),2),3);nanmean(nanmean(nanmean(dm1984,1),2),3);...
    nanmean(nanmean(nanmean(dm1985,1),2),3);nanmean(nanmean(nanmean(dm1986,1),2),3);...
    nanmean(nanmean(nanmean(dm1987,1),2),3);nanmean(nanmean(nanmean(dm1988,1),2),3);...
    nanmean(nanmean(nanmean(dm1989,1),2),3);nanmean(nanmean(nanmean(dm1990,1),2),3);...
    nanmean(nanmean(nanmean(dm1991,1),2),3);nanmean(nanmean(nanmean(dm1992,1),2),3);...
    nanmean(nanmean(nanmean(dm1993,1),2),3);nanmean(nanmean(nanmean(dm1994,1),2),3);...
    nanmean(nanmean(nanmean(dm1995,1),2),3);nanmean(nanmean(nanmean(dm1996,1),2),3);...
    nanmean(nanmean(nanmean(dm1997,1),2),3);nanmean(nanmean(nanmean(dm1998,1),2),3);...
    nanmean(nanmean(nanmean(dm1999,1),2),3);nanmean(nanmean(nanmean(dm2000,1),2),3);...
    nanmean(nanmean(nanmean(dm2001,1),2),3);nanmean(nanmean(nanmean(dm2002,1),2),3);...
    nanmean(nanmean(nanmean(dm2003,1),2),3);nanmean(nanmean(nanmean(dm2004,1),2),3)];
 
 
clearvars -EXCEPT ENSEMBLE BCC_CSM ACCESS CNRM_CM5 ERA5 GFDL_CM3 HADGEM2_ES INM_CM4 MIROC5 MRI_CGCM3
 
%%
Date=1979:2004;
figure
plot(Date,ACCESS,'o-r');hold on 
plot(Date,BCC_CSM,'>-b');hold on
plot(Date,CNRM_CM5,'x-r');hold on
plot(Date,GFDL_CM3,'p-c');hold on
plot(Date,HADGEM2_ES,'+-m');hold on
plot(Date,INM_CM4,'*-y');hold on
plot(Date,MIROC5,'s-k');hold on
plot(Date,MRI_CGCM3,'d-g');hold on
plot(Date,ENSEMBLE,'d-r');hold on
plot(Date,ERA5,'v-k');
xlim([1979 2004])
legend('ACCESS1-0','BCC-CSM1-1','CNRM-CM5','GFDL-CM3','HadGEM2-ES','INM-CM4','MIROC5','MRI-CGCM3','ENSEMBLE','ERA5','Location','south','NumColumns',3);
title('Mean Wave Direction for GoG','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Years','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Dm (^oC)','FontSize',18,'FontName','Times News Roman','FontWeight','Bold');
 
