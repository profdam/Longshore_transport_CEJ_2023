
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc;
%load ENSEMBLE data
load('/home/profdam/Downloads/INPUT_DATA/ENSEMBLE.mat')

%% Fill all NaNs with the nearest number
hs = fillmissing(ENSEMBLE_hs,'linear','EndValues','nearest'); %hs=flipud(hs);
tm = fillmissing(ENSEMBLE_tm,'linear','EndValues','nearest'); %tm=flipud(tm);
dm = fillmissing(ENSEMBLE_dm,'linear','EndValues','nearest'); %dm=flipud(dm);

%% Separate into annaual and seasonal averages
hs_1979=hs(:,:,1:12); hs_1979_a=nanmean(hs_1979,3); 
hs_1979_w=nanmean(cat(3,hs_1979(:,:,11),hs_1979(:,:,12),hs_1979(:,:,1),hs_1979(:,:,2),hs_1979(:,:,3)),3);
hs_1979_s=nanmean(cat(3,hs_1979(:,:,4),hs_1979(:,:,5),hs_1979(:,:,6),hs_1979(:,:,7),hs_1979(:,:,8),hs_1979(:,:,9),hs_1979(:,:,10)),3);
tm_1979=tm(:,:,1:12); tm_1979_a=nanmean(tm_1979,3); 
tm_1979_w=nanmean(cat(3,tm_1979(:,:,11),tm_1979(:,:,12),tm_1979(:,:,1),tm_1979(:,:,2),tm_1979(:,:,3)),3);
tm_1979_s=nanmean(cat(3,tm_1979(:,:,4),tm_1979(:,:,5),tm_1979(:,:,6),tm_1979(:,:,7),tm_1979(:,:,8),tm_1979(:,:,9),tm_1979(:,:,10)),3);
dm_1979=dm(:,:,1:12); dm_1979_a=nanmean(dm_1979,3); 
dm_1979_w=nanmean(cat(3,dm_1979(:,:,11),dm_1979(:,:,12),dm_1979(:,:,1),dm_1979(:,:,2),dm_1979(:,:,3)),3);
dm_1979_s=nanmean(cat(3,dm_1979(:,:,4),dm_1979(:,:,5),dm_1979(:,:,6),dm_1979(:,:,7),dm_1979(:,:,8),dm_1979(:,:,9),dm_1979(:,:,10)),3);

hs_1980=hs(:,:,13:24); hs_1980_a=nanmean(hs_1980,3); 
hs_1980_w=nanmean(cat(3,hs_1980(:,:,11),hs_1980(:,:,12),hs_1980(:,:,1),hs_1980(:,:,2),hs_1980(:,:,3)),3);
hs_1980_s=nanmean(cat(3,hs_1980(:,:,4),hs_1980(:,:,5),hs_1980(:,:,6),hs_1980(:,:,7),hs_1980(:,:,8),hs_1980(:,:,9),hs_1980(:,:,10)),3);
tm_1980=tm(:,:,13:24); tm_1980_a=nanmean(tm_1980,3); 
tm_1980_w=nanmean(cat(3,tm_1980(:,:,11),tm_1980(:,:,12),tm_1980(:,:,1),tm_1980(:,:,2),tm_1980(:,:,3)),3);
tm_1980_s=nanmean(cat(3,tm_1980(:,:,4),tm_1980(:,:,5),tm_1980(:,:,6),tm_1980(:,:,7),tm_1980(:,:,8),tm_1980(:,:,9),tm_1980(:,:,10)),3);
dm_1980=dm(:,:,13:24); dm_1980_a=nanmean(dm_1980,3); 
dm_1980_w=nanmean(cat(3,dm_1980(:,:,11),dm_1980(:,:,12),dm_1980(:,:,1),dm_1980(:,:,2),dm_1980(:,:,3)),3);
dm_1980_s=nanmean(cat(3,dm_1980(:,:,4),dm_1980(:,:,5),dm_1980(:,:,6),dm_1980(:,:,7),dm_1980(:,:,8),dm_1980(:,:,9),dm_1980(:,:,10)),3);

hs_1981=hs(:,:,25:36); hs_1981_a=nanmean(hs_1981,3); 
hs_1981_w=nanmean(cat(3,hs_1981(:,:,11),hs_1981(:,:,12),hs_1981(:,:,1),hs_1981(:,:,2),hs_1981(:,:,3)),3);
hs_1981_s=nanmean(cat(3,hs_1981(:,:,4),hs_1981(:,:,5),hs_1981(:,:,6),hs_1981(:,:,7),hs_1981(:,:,8),hs_1981(:,:,9),hs_1981(:,:,10)),3);
tm_1981=tm(:,:,25:36); tm_1981_a=nanmean(tm_1981,3); 
tm_1981_w=nanmean(cat(3,tm_1981(:,:,11),tm_1981(:,:,12),tm_1981(:,:,1),tm_1981(:,:,2),tm_1981(:,:,3)),3);
tm_1981_s=nanmean(cat(3,tm_1981(:,:,4),tm_1981(:,:,5),tm_1981(:,:,6),tm_1981(:,:,7),tm_1981(:,:,8),tm_1981(:,:,9),tm_1981(:,:,10)),3);
dm_1981=dm(:,:,25:36); dm_1981_a=nanmean(dm_1981,3); 
dm_1981_w=nanmean(cat(3,dm_1981(:,:,11),dm_1981(:,:,12),dm_1981(:,:,1),dm_1981(:,:,2),dm_1981(:,:,3)),3);
dm_1981_s=nanmean(cat(3,dm_1981(:,:,4),dm_1981(:,:,5),dm_1981(:,:,6),dm_1981(:,:,7),dm_1981(:,:,8),dm_1981(:,:,9),dm_1981(:,:,10)),3);

hs_1982=hs(:,:,37:48); hs_1982_a=nanmean(hs_1982,3); 
hs_1982_w=nanmean(cat(3,hs_1982(:,:,11),hs_1982(:,:,12),hs_1982(:,:,1),hs_1982(:,:,2),hs_1982(:,:,3)),3);
hs_1982_s=nanmean(cat(3,hs_1982(:,:,4),hs_1982(:,:,5),hs_1982(:,:,6),hs_1982(:,:,7),hs_1982(:,:,8),hs_1982(:,:,9),hs_1982(:,:,10)),3);
tm_1982=tm(:,:,37:48); tm_1982_a=nanmean(tm_1982,3); 
tm_1982_w=nanmean(cat(3,tm_1982(:,:,11),tm_1982(:,:,12),tm_1982(:,:,1),tm_1982(:,:,2),tm_1982(:,:,3)),3);
tm_1982_s=nanmean(cat(3,tm_1982(:,:,4),tm_1982(:,:,5),tm_1982(:,:,6),tm_1982(:,:,7),tm_1982(:,:,8),tm_1982(:,:,9),tm_1982(:,:,10)),3);
dm_1982=dm(:,:,37:48); dm_1982_a=nanmean(dm_1982,3); 
dm_1982_w=nanmean(cat(3,dm_1982(:,:,11),dm_1982(:,:,12),dm_1982(:,:,1),dm_1982(:,:,2),dm_1982(:,:,3)),3);
dm_1982_s=nanmean(cat(3,dm_1982(:,:,4),dm_1982(:,:,5),dm_1982(:,:,6),dm_1982(:,:,7),dm_1982(:,:,8),dm_1982(:,:,9),dm_1982(:,:,10)),3);

hs_1983=hs(:,:,49:60); hs_1983_a=nanmean(hs_1983,3); 
hs_1983_w=nanmean(cat(3,hs_1983(:,:,11),hs_1983(:,:,12),hs_1983(:,:,1),hs_1983(:,:,2),hs_1983(:,:,3)),3);
hs_1983_s=nanmean(cat(3,hs_1983(:,:,4),hs_1983(:,:,5),hs_1983(:,:,6),hs_1983(:,:,7),hs_1983(:,:,8),hs_1983(:,:,9),hs_1983(:,:,10)),3);
tm_1983=tm(:,:,49:60);  tm_1983_a=nanmean(tm_1983,3); 
tm_1983_w=nanmean(cat(3,tm_1983(:,:,11),tm_1983(:,:,12),tm_1983(:,:,1),tm_1983(:,:,2),tm_1983(:,:,3)),3);
tm_1983_s=nanmean(cat(3,tm_1983(:,:,4),tm_1983(:,:,5),tm_1983(:,:,6),tm_1983(:,:,7),tm_1983(:,:,8),tm_1983(:,:,9),tm_1983(:,:,10)),3);
dm_1983=dm(:,:,49:60);  dm_1983_a=nanmean(dm_1983,3); 
dm_1983_w=nanmean(cat(3,dm_1983(:,:,11),dm_1983(:,:,12),dm_1983(:,:,1),dm_1983(:,:,2),dm_1983(:,:,3)),3);
dm_1983_s=nanmean(cat(3,dm_1983(:,:,4),dm_1983(:,:,5),dm_1983(:,:,6),dm_1983(:,:,7),dm_1983(:,:,8),dm_1983(:,:,9),dm_1983(:,:,10)),3);

hs_1984=hs(:,:,61:72); hs_1984_a=nanmean(hs_1984,3); 
hs_1984_w=nanmean(cat(3,hs_1984(:,:,11),hs_1984(:,:,12),hs_1984(:,:,1),hs_1984(:,:,2),hs_1984(:,:,3)),3);
hs_1984_s=nanmean(cat(3,hs_1984(:,:,4),hs_1984(:,:,5),hs_1984(:,:,6),hs_1984(:,:,7),hs_1984(:,:,8),hs_1984(:,:,9),hs_1984(:,:,10)),3);
tm_1984=tm(:,:,61:72); tm_1984_a=nanmean(tm_1984,3); 
tm_1984_w=nanmean(cat(3,tm_1984(:,:,11),tm_1984(:,:,12),tm_1984(:,:,1),tm_1984(:,:,2),tm_1984(:,:,3)),3);
tm_1984_s=nanmean(cat(3,tm_1984(:,:,4),tm_1984(:,:,5),tm_1984(:,:,6),tm_1984(:,:,7),tm_1984(:,:,8),tm_1984(:,:,9),tm_1984(:,:,10)),3);
dm_1984=dm(:,:,61:72); dm_1984_a=nanmean(dm_1984,3); 
dm_1984_w=nanmean(cat(3,dm_1984(:,:,11),dm_1984(:,:,12),dm_1984(:,:,1),dm_1984(:,:,2),dm_1984(:,:,3)),3);
dm_1984_s=nanmean(cat(3,dm_1984(:,:,4),dm_1984(:,:,5),dm_1984(:,:,6),dm_1984(:,:,7),dm_1984(:,:,8),dm_1984(:,:,9),dm_1984(:,:,10)),3);

hs_1985=hs(:,:,73:84); hs_1985_a=nanmean(hs_1985,3); 
hs_1985_w=nanmean(cat(3,hs_1985(:,:,11),hs_1985(:,:,12),hs_1985(:,:,1),hs_1985(:,:,2),hs_1985(:,:,3)),3);
hs_1985_s=nanmean(cat(3,hs_1985(:,:,4),hs_1985(:,:,5),hs_1985(:,:,6),hs_1985(:,:,7),hs_1985(:,:,8),hs_1985(:,:,9),hs_1985(:,:,10)),3);
tm_1985=tm(:,:,73:84); tm_1985_a=nanmean(tm_1985,3); 
tm_1985_w=nanmean(cat(3,tm_1985(:,:,11),tm_1985(:,:,12),tm_1985(:,:,1),tm_1985(:,:,2),tm_1985(:,:,3)),3);
tm_1985_s=nanmean(cat(3,tm_1985(:,:,4),tm_1985(:,:,5),tm_1985(:,:,6),tm_1985(:,:,7),tm_1985(:,:,8),tm_1985(:,:,9),tm_1985(:,:,10)),3);
dm_1985=dm(:,:,73:84); dm_1985_a=nanmean(dm_1985,3); 
dm_1985_w=nanmean(cat(3,dm_1985(:,:,11),dm_1985(:,:,12),dm_1985(:,:,1),dm_1985(:,:,2),dm_1985(:,:,3)),3);
dm_1985_s=nanmean(cat(3,dm_1985(:,:,4),dm_1985(:,:,5),dm_1985(:,:,6),dm_1985(:,:,7),dm_1985(:,:,8),dm_1985(:,:,9),dm_1985(:,:,10)),3);

hs_1986=hs(:,:,85:96); hs_1986_a=nanmean(hs_1986,3); 
hs_1986_w=nanmean(cat(3,hs_1986(:,:,11),hs_1986(:,:,12),hs_1986(:,:,1),hs_1986(:,:,2),hs_1986(:,:,3)),3);
hs_1986_s=nanmean(cat(3,hs_1986(:,:,4),hs_1986(:,:,5),hs_1986(:,:,6),hs_1986(:,:,7),hs_1986(:,:,8),hs_1986(:,:,9),hs_1986(:,:,10)),3);
tm_1986=tm(:,:,85:96);  tm_1986_a=nanmean(tm_1986,3); 
tm_1986_w=nanmean(cat(3,tm_1986(:,:,11),tm_1986(:,:,12),tm_1986(:,:,1),tm_1986(:,:,2),tm_1986(:,:,3)),3);
tm_1986_s=nanmean(cat(3,tm_1986(:,:,4),tm_1986(:,:,5),tm_1986(:,:,6),tm_1986(:,:,7),tm_1986(:,:,8),tm_1986(:,:,9),tm_1986(:,:,10)),3);
dm_1986=dm(:,:,85:96);  dm_1986_a=nanmean(dm_1986,3); 
dm_1986_w=nanmean(cat(3,dm_1986(:,:,11),dm_1986(:,:,12),dm_1986(:,:,1),dm_1986(:,:,2),dm_1986(:,:,3)),3);
dm_1986_s=nanmean(cat(3,dm_1986(:,:,4),dm_1986(:,:,5),dm_1986(:,:,6),dm_1986(:,:,7),dm_1986(:,:,8),dm_1986(:,:,9),dm_1986(:,:,10)),3);

hs_1987=hs(:,:,97:108); hs_1987_a=nanmean(hs_1987,3); 
hs_1987_w=nanmean(cat(3,hs_1987(:,:,11),hs_1987(:,:,12),hs_1987(:,:,1),hs_1987(:,:,2),hs_1987(:,:,3)),3);
hs_1987_s=nanmean(cat(3,hs_1987(:,:,4),hs_1987(:,:,5),hs_1987(:,:,6),hs_1987(:,:,7),hs_1987(:,:,8),hs_1987(:,:,9),hs_1987(:,:,10)),3);
tm_1987=tm(:,:,97:108);  tm_1987_a=nanmean(tm_1987,3); 
tm_1987_w=nanmean(cat(3,tm_1987(:,:,11),tm_1987(:,:,12),tm_1987(:,:,1),tm_1987(:,:,2),tm_1987(:,:,3)),3);
tm_1987_s=nanmean(cat(3,tm_1987(:,:,4),tm_1987(:,:,5),tm_1987(:,:,6),tm_1987(:,:,7),tm_1987(:,:,8),tm_1987(:,:,9),tm_1987(:,:,10)),3);
dm_1987=dm(:,:,97:108);  dm_1987_a=nanmean(dm_1987,3); 
dm_1987_w=nanmean(cat(3,dm_1987(:,:,11),dm_1987(:,:,12),dm_1987(:,:,1),dm_1987(:,:,2),dm_1987(:,:,3)),3);
dm_1987_s=nanmean(cat(3,dm_1987(:,:,4),dm_1987(:,:,5),dm_1987(:,:,6),dm_1987(:,:,7),dm_1987(:,:,8),dm_1987(:,:,9),dm_1987(:,:,10)),3);


hs_1988=hs(:,:,109:120); hs_1988_a=nanmean(hs_1988,3); 
hs_1988_w=nanmean(cat(3,hs_1988(:,:,11),hs_1988(:,:,12),hs_1988(:,:,1),hs_1988(:,:,2),hs_1988(:,:,3)),3);
hs_1988_s=nanmean(cat(3,hs_1988(:,:,4),hs_1988(:,:,5),hs_1988(:,:,6),hs_1988(:,:,7),hs_1988(:,:,8),hs_1988(:,:,9),hs_1988(:,:,10)),3);
tm_1988=tm(:,:,109:120); tm_1988_a=nanmean(tm_1988,3);
tm_1988_w=nanmean(cat(3,tm_1988(:,:,11),tm_1988(:,:,12),tm_1988(:,:,1),tm_1988(:,:,2),tm_1988(:,:,3)),3);
tm_1988_s=nanmean(cat(3,tm_1988(:,:,4),tm_1988(:,:,5),tm_1988(:,:,6),tm_1988(:,:,7),tm_1988(:,:,8),tm_1988(:,:,9),tm_1988(:,:,10)),3);
dm_1988=dm(:,:,109:120); dm_1988_a=nanmean(dm_1988,3);
dm_1988_w=nanmean(cat(3,dm_1988(:,:,11),dm_1988(:,:,12),dm_1988(:,:,1),dm_1988(:,:,2),dm_1988(:,:,3)),3);
dm_1988_s=nanmean(cat(3,dm_1988(:,:,4),dm_1988(:,:,5),dm_1988(:,:,6),dm_1988(:,:,7),dm_1988(:,:,8),dm_1988(:,:,9),dm_1988(:,:,10)),3);


hs_1989=hs(:,:,121:132); hs_1989_a=nanmean(hs_1989,3); 
hs_1989_w=nanmean(cat(3,hs_1989(:,:,11),hs_1989(:,:,12),hs_1989(:,:,1),hs_1989(:,:,2),hs_1989(:,:,3)),3);
hs_1989_s=nanmean(cat(3,hs_1989(:,:,4),hs_1989(:,:,5),hs_1989(:,:,6),hs_1989(:,:,7),hs_1989(:,:,8),hs_1989(:,:,9),hs_1989(:,:,10)),3);
tm_1989=tm(:,:,121:132); tm_1989_a=nanmean(tm_1989,3); 
tm_1989_w=nanmean(cat(3,tm_1989(:,:,11),tm_1989(:,:,12),tm_1989(:,:,1),tm_1989(:,:,2),tm_1989(:,:,3)),3);
tm_1989_s=nanmean(cat(3,tm_1989(:,:,4),tm_1989(:,:,5),tm_1989(:,:,6),tm_1989(:,:,7),tm_1989(:,:,8),tm_1989(:,:,9),tm_1989(:,:,10)),3);
dm_1989=dm(:,:,121:132); dm_1989_a=nanmean(dm_1989,3); 
dm_1989_w=nanmean(cat(3,dm_1989(:,:,11),dm_1989(:,:,12),dm_1989(:,:,1),dm_1989(:,:,2),dm_1989(:,:,3)),3);
dm_1989_s=nanmean(cat(3,dm_1989(:,:,4),dm_1989(:,:,5),dm_1989(:,:,6),dm_1989(:,:,7),dm_1989(:,:,8),dm_1989(:,:,9),dm_1989(:,:,10)),3);


hs_1990=hs(:,:,133:144); hs_1990_a=nanmean(hs_1990,3); 
hs_1990_w=nanmean(cat(3,hs_1990(:,:,11),hs_1990(:,:,12),hs_1990(:,:,1),hs_1990(:,:,2),hs_1990(:,:,3)),3);
hs_1990_s=nanmean(cat(3,hs_1990(:,:,4),hs_1990(:,:,5),hs_1990(:,:,6),hs_1990(:,:,7),hs_1990(:,:,8),hs_1990(:,:,9),hs_1990(:,:,10)),3);
tm_1990=tm(:,:,133:144); tm_1990_a=nanmean(tm_1990,3); 
tm_1990_w=nanmean(cat(3,tm_1990(:,:,11),tm_1990(:,:,12),tm_1990(:,:,1),tm_1990(:,:,2),tm_1990(:,:,3)),3);
tm_1990_s=nanmean(cat(3,tm_1990(:,:,4),tm_1990(:,:,5),tm_1990(:,:,6),tm_1990(:,:,7),tm_1990(:,:,8),tm_1990(:,:,9),tm_1990(:,:,10)),3);
dm_1990=dm(:,:,133:144); dm_1990_a=nanmean(dm_1990,3); 
dm_1990_w=nanmean(cat(3,dm_1990(:,:,11),dm_1990(:,:,12),dm_1990(:,:,1),dm_1990(:,:,2),dm_1990(:,:,3)),3);
dm_1990_s=nanmean(cat(3,dm_1990(:,:,4),dm_1990(:,:,5),dm_1990(:,:,6),dm_1990(:,:,7),dm_1990(:,:,8),dm_1990(:,:,9),dm_1990(:,:,10)),3);


hs_1991=hs(:,:,145:156); hs_1991_a=nanmean(hs_1991,3); 
hs_1991_w=nanmean(cat(3,hs_1991(:,:,11),hs_1991(:,:,12),hs_1991(:,:,1),hs_1991(:,:,2),hs_1991(:,:,3)),3);
hs_1991_s=nanmean(cat(3,hs_1991(:,:,4),hs_1991(:,:,5),hs_1991(:,:,6),hs_1991(:,:,7),hs_1991(:,:,8),hs_1991(:,:,9),hs_1991(:,:,10)),3);
tm_1991=tm(:,:,145:156);  tm_1991_a=nanmean(tm_1991,3); 
tm_1991_w=nanmean(cat(3,tm_1991(:,:,11),tm_1991(:,:,12),tm_1991(:,:,1),tm_1991(:,:,2),tm_1991(:,:,3)),3);
tm_1991_s=nanmean(cat(3,tm_1991(:,:,4),tm_1991(:,:,5),tm_1991(:,:,6),tm_1991(:,:,7),tm_1991(:,:,8),tm_1991(:,:,9),tm_1991(:,:,10)),3);
dm_1991=dm(:,:,145:156); dm_1991_a=nanmean(dm_1991,3); 
dm_1991_w=nanmean(cat(3,dm_1991(:,:,11),dm_1991(:,:,12),dm_1991(:,:,1),dm_1991(:,:,2),dm_1991(:,:,3)),3);
dm_1991_s=nanmean(cat(3,dm_1991(:,:,4),dm_1991(:,:,5),dm_1991(:,:,6),dm_1991(:,:,7),dm_1991(:,:,8),dm_1991(:,:,9),dm_1991(:,:,10)),3);


hs_1992=hs(:,:,157:168); hs_1992_a=nanmean(hs_1992,3); 
hs_1992_w=nanmean(cat(3,hs_1992(:,:,11),hs_1992(:,:,12),hs_1992(:,:,1),hs_1992(:,:,2),hs_1992(:,:,3)),3);
hs_1992_s=nanmean(cat(3,hs_1992(:,:,4),hs_1992(:,:,5),hs_1992(:,:,6),hs_1992(:,:,7),hs_1992(:,:,8),hs_1992(:,:,9),hs_1992(:,:,10)),3);
tm_1992=tm(:,:,157:168); tm_1992_a=nanmean(tm_1992,3); 
tm_1992_w=nanmean(cat(3,tm_1992(:,:,11),tm_1992(:,:,12),tm_1992(:,:,1),tm_1992(:,:,2),tm_1992(:,:,3)),3);
tm_1992_s=nanmean(cat(3,tm_1992(:,:,4),tm_1992(:,:,5),tm_1992(:,:,6),tm_1992(:,:,7),tm_1992(:,:,8),tm_1992(:,:,9),tm_1992(:,:,10)),3);
dm_1992=dm(:,:,157:168); dm_1992_a=nanmean(dm_1992,3); 
dm_1992_w=nanmean(cat(3,dm_1992(:,:,11),dm_1992(:,:,12),dm_1992(:,:,1),dm_1992(:,:,2),dm_1992(:,:,3)),3);
dm_1992_s=nanmean(cat(3,dm_1992(:,:,4),dm_1992(:,:,5),dm_1992(:,:,6),dm_1992(:,:,7),dm_1992(:,:,8),dm_1992(:,:,9),dm_1992(:,:,10)),3);


hs_1993=hs(:,:,169:180); hs_1993_a=nanmean(hs_1993,3); 
hs_1993_w=nanmean(cat(3,hs_1993(:,:,11),hs_1993(:,:,12),hs_1993(:,:,1),hs_1993(:,:,2),hs_1993(:,:,3)),3);
hs_1993_s=nanmean(cat(3,hs_1993(:,:,4),hs_1993(:,:,5),hs_1993(:,:,6),hs_1993(:,:,7),hs_1993(:,:,8),hs_1993(:,:,9),hs_1993(:,:,10)),3);
tm_1993=tm(:,:,169:180); tm_1993_a=nanmean(tm_1993,3); 
tm_1993_w=nanmean(cat(3,tm_1993(:,:,11),tm_1993(:,:,12),tm_1993(:,:,1),tm_1993(:,:,2),tm_1993(:,:,3)),3);
tm_1993_s=nanmean(cat(3,tm_1993(:,:,4),tm_1993(:,:,5),tm_1993(:,:,6),tm_1993(:,:,7),tm_1993(:,:,8),tm_1993(:,:,9),tm_1993(:,:,10)),3);
dm_1993=dm(:,:,169:180); dm_1993_a=nanmean(dm_1993,3); 
dm_1993_w=nanmean(cat(3,dm_1993(:,:,11),dm_1993(:,:,12),dm_1993(:,:,1),dm_1993(:,:,2),dm_1993(:,:,3)),3);
dm_1993_s=nanmean(cat(3,dm_1993(:,:,4),dm_1993(:,:,5),dm_1993(:,:,6),dm_1993(:,:,7),dm_1993(:,:,8),dm_1993(:,:,9),dm_1993(:,:,10)),3);


hs_1994=hs(:,:,181:192); hs_1994_a=nanmean(hs_1994,3); 
hs_1994_w=nanmean(cat(3,hs_1994(:,:,11),hs_1994(:,:,12),hs_1994(:,:,1),hs_1994(:,:,2),hs_1994(:,:,3)),3);
hs_1994_s=nanmean(cat(3,hs_1994(:,:,4),hs_1994(:,:,5),hs_1994(:,:,6),hs_1994(:,:,7),hs_1994(:,:,8),hs_1994(:,:,9),hs_1994(:,:,10)),3);
tm_1994=tm(:,:,181:192);  tm_1994_a=nanmean(tm_1994,3); 
tm_1994_w=nanmean(cat(3,tm_1994(:,:,11),tm_1994(:,:,12),tm_1994(:,:,1),tm_1994(:,:,2),tm_1994(:,:,3)),3);
tm_1994_s=nanmean(cat(3,tm_1994(:,:,4),tm_1994(:,:,5),tm_1994(:,:,6),tm_1994(:,:,7),tm_1994(:,:,8),tm_1994(:,:,9),tm_1994(:,:,10)),3);
dm_1994=dm(:,:,181:192);  dm_1994_a=nanmean(dm_1994,3); 
dm_1994_w=nanmean(cat(3,dm_1994(:,:,11),dm_1994(:,:,12),dm_1994(:,:,1),dm_1994(:,:,2),dm_1994(:,:,3)),3);
dm_1994_s=nanmean(cat(3,dm_1994(:,:,4),dm_1994(:,:,5),dm_1994(:,:,6),dm_1994(:,:,7),dm_1994(:,:,8),dm_1994(:,:,9),dm_1994(:,:,10)),3);


hs_1995=hs(:,:,193:204); hs_1995_a=nanmean(hs_1995,3); 
hs_1995_w=nanmean(cat(3,hs_1995(:,:,11),hs_1995(:,:,12),hs_1995(:,:,1),hs_1995(:,:,2),hs_1995(:,:,3)),3);
hs_1995_s=nanmean(cat(3,hs_1995(:,:,4),hs_1995(:,:,5),hs_1995(:,:,6),hs_1995(:,:,7),hs_1995(:,:,8),hs_1995(:,:,9),hs_1995(:,:,10)),3);
tm_1995=tm(:,:,193:204); tm_1995_a=nanmean(tm_1995,3); 
tm_1995_w=nanmean(cat(3,tm_1995(:,:,11),tm_1995(:,:,12),tm_1995(:,:,1),tm_1995(:,:,2),tm_1995(:,:,3)),3);
tm_1995_s=nanmean(cat(3,tm_1995(:,:,4),tm_1995(:,:,5),tm_1995(:,:,6),tm_1995(:,:,7),tm_1995(:,:,8),tm_1995(:,:,9),tm_1995(:,:,10)),3);
dm_1995=dm(:,:,193:204); dm_1995_a=nanmean(dm_1995,3); 
dm_1995_w=nanmean(cat(3,dm_1995(:,:,11),dm_1995(:,:,12),dm_1995(:,:,1),dm_1995(:,:,2),dm_1995(:,:,3)),3);
dm_1995_s=nanmean(cat(3,dm_1995(:,:,4),dm_1995(:,:,5),dm_1995(:,:,6),dm_1995(:,:,7),dm_1995(:,:,8),dm_1995(:,:,9),dm_1995(:,:,10)),3);


hs_1996=hs(:,:,205:216); hs_1996_a=nanmean(hs_1996,3); 
hs_1996_w=nanmean(cat(3,hs_1996(:,:,11),hs_1996(:,:,12),hs_1996(:,:,1),hs_1996(:,:,2),hs_1996(:,:,3)),3);
hs_1996_s=nanmean(cat(3,hs_1996(:,:,4),hs_1996(:,:,5),hs_1996(:,:,6),hs_1996(:,:,7),hs_1996(:,:,8),hs_1996(:,:,9),hs_1996(:,:,10)),3);
tm_1996=tm(:,:,205:216); tm_1996_a=nanmean(tm_1996,3); 
tm_1996_w=nanmean(cat(3,tm_1996(:,:,11),tm_1996(:,:,12),tm_1996(:,:,1),tm_1996(:,:,2),tm_1996(:,:,3)),3);
tm_1996_s=nanmean(cat(3,tm_1996(:,:,4),tm_1996(:,:,5),tm_1996(:,:,6),tm_1996(:,:,7),tm_1996(:,:,8),tm_1996(:,:,9),tm_1996(:,:,10)),3);
dm_1996=dm(:,:,205:216); dm_1996_a=nanmean(dm_1996,3); 
dm_1996_w=nanmean(cat(3,dm_1996(:,:,11),dm_1996(:,:,12),dm_1996(:,:,1),dm_1996(:,:,2),dm_1996(:,:,3)),3);
dm_1996_s=nanmean(cat(3,dm_1996(:,:,4),dm_1996(:,:,5),dm_1996(:,:,6),dm_1996(:,:,7),dm_1996(:,:,8),dm_1996(:,:,9),dm_1996(:,:,10)),3);


hs_1997=hs(:,:,217:228); hs_1997_a=nanmean(hs_1997,3); 
hs_1997_w=nanmean(cat(3,hs_1997(:,:,11),hs_1997(:,:,12),hs_1997(:,:,1),hs_1997(:,:,2),hs_1997(:,:,3)),3);
hs_1997_s=nanmean(cat(3,hs_1997(:,:,4),hs_1997(:,:,5),hs_1997(:,:,6),hs_1997(:,:,7),hs_1997(:,:,8),hs_1997(:,:,9),hs_1997(:,:,10)),3);
tm_1997=tm(:,:,217:228); tm_1997_a=nanmean(tm_1997,3); 
tm_1997_w=nanmean(cat(3,tm_1997(:,:,11),tm_1997(:,:,12),tm_1997(:,:,1),tm_1997(:,:,2),tm_1997(:,:,3)),3);
tm_1997_s=nanmean(cat(3,tm_1997(:,:,4),tm_1997(:,:,5),tm_1997(:,:,6),tm_1997(:,:,7),tm_1997(:,:,8),tm_1997(:,:,9),tm_1997(:,:,10)),3);
dm_1997=dm(:,:,217:228); dm_1997_a=nanmean(dm_1997,3); 
dm_1997_w=nanmean(cat(3,dm_1997(:,:,11),dm_1997(:,:,12),dm_1997(:,:,1),dm_1997(:,:,2),dm_1997(:,:,3)),3);
dm_1997_s=nanmean(cat(3,dm_1997(:,:,4),dm_1997(:,:,5),dm_1997(:,:,6),dm_1997(:,:,7),dm_1997(:,:,8),dm_1997(:,:,9),dm_1997(:,:,10)),3);


hs_1998=hs(:,:,229:240); hs_1998_a=nanmean(hs_1998,3); 
hs_1998_w=nanmean(cat(3,hs_1998(:,:,11),hs_1998(:,:,12),hs_1998(:,:,1),hs_1998(:,:,2),hs_1998(:,:,3)),3);
hs_1998_s=nanmean(cat(3,hs_1998(:,:,4),hs_1998(:,:,5),hs_1998(:,:,6),hs_1998(:,:,7),hs_1998(:,:,8),hs_1998(:,:,9),hs_1998(:,:,10)),3);
tm_1998=tm(:,:,229:240); tm_1998_a=nanmean(tm_1998,3); 
tm_1998_w=nanmean(cat(3,tm_1998(:,:,11),tm_1998(:,:,12),tm_1998(:,:,1),tm_1998(:,:,2),tm_1998(:,:,3)),3);
tm_1998_s=nanmean(cat(3,tm_1998(:,:,4),tm_1998(:,:,5),tm_1998(:,:,6),tm_1998(:,:,7),tm_1998(:,:,8),tm_1998(:,:,9),tm_1998(:,:,10)),3);
dm_1998=dm(:,:,229:240); dm_1998_a=nanmean(dm_1998,3); 
dm_1998_w=nanmean(cat(3,dm_1998(:,:,11),dm_1998(:,:,12),dm_1998(:,:,1),dm_1998(:,:,2),dm_1998(:,:,3)),3);
dm_1998_s=nanmean(cat(3,dm_1998(:,:,4),dm_1998(:,:,5),dm_1998(:,:,6),dm_1998(:,:,7),dm_1998(:,:,8),dm_1998(:,:,9),dm_1998(:,:,10)),3);


hs_1999=hs(:,:,241:252); hs_1999_a=nanmean(hs_1999,3); 
hs_1999_w=nanmean(cat(3,hs_1999(:,:,11),hs_1999(:,:,12),hs_1999(:,:,1),hs_1999(:,:,2),hs_1999(:,:,3)),3);
hs_1999_s=nanmean(cat(3,hs_1999(:,:,4),hs_1999(:,:,5),hs_1999(:,:,6),hs_1999(:,:,7),hs_1999(:,:,8),hs_1999(:,:,9),hs_1999(:,:,10)),3);
tm_1999=tm(:,:,241:252); tm_1999_a=nanmean(tm_1999,3); 
tm_1999_w=nanmean(cat(3,tm_1999(:,:,11),tm_1999(:,:,12),tm_1999(:,:,1),tm_1999(:,:,2),tm_1999(:,:,3)),3);
tm_1999_s=nanmean(cat(3,tm_1999(:,:,4),tm_1999(:,:,5),tm_1999(:,:,6),tm_1999(:,:,7),tm_1999(:,:,8),tm_1999(:,:,9),tm_1999(:,:,10)),3);
dm_1999=dm(:,:,241:252); dm_1999_a=nanmean(dm_1999,3); 
dm_1999_w=nanmean(cat(3,dm_1999(:,:,11),dm_1999(:,:,12),dm_1999(:,:,1),dm_1999(:,:,2),dm_1999(:,:,3)),3);
dm_1999_s=nanmean(cat(3,dm_1999(:,:,4),dm_1999(:,:,5),dm_1999(:,:,6),dm_1999(:,:,7),dm_1999(:,:,8),dm_1999(:,:,9),dm_1999(:,:,10)),3);


hs_2000=hs(:,:,253:264); hs_2000_a=nanmean(hs_2000,3); 
hs_2000_w=nanmean(cat(3,hs_2000(:,:,11),hs_2000(:,:,12),hs_2000(:,:,1),hs_2000(:,:,2),hs_2000(:,:,3)),3);
hs_2000_s=nanmean(cat(3,hs_2000(:,:,4),hs_2000(:,:,5),hs_2000(:,:,6),hs_2000(:,:,7),hs_2000(:,:,8),hs_2000(:,:,9),hs_2000(:,:,10)),3);
tm_2000=tm(:,:,253:264); tm_2000_a=nanmean(tm_2000,3); 
tm_2000_w=nanmean(cat(3,tm_2000(:,:,11),tm_2000(:,:,12),tm_2000(:,:,1),tm_2000(:,:,2),tm_2000(:,:,3)),3);
tm_2000_s=nanmean(cat(3,tm_2000(:,:,4),tm_2000(:,:,5),tm_2000(:,:,6),tm_2000(:,:,7),tm_2000(:,:,8),tm_2000(:,:,9),tm_2000(:,:,10)),3);
dm_2000=dm(:,:,253:264); dm_2000_a=nanmean(dm_2000,3); 
dm_2000_w=nanmean(cat(3,dm_2000(:,:,11),dm_2000(:,:,12),dm_2000(:,:,1),dm_2000(:,:,2),dm_2000(:,:,3)),3);
dm_2000_s=nanmean(cat(3,dm_2000(:,:,4),dm_2000(:,:,5),dm_2000(:,:,6),dm_2000(:,:,7),dm_2000(:,:,8),dm_2000(:,:,9),dm_2000(:,:,10)),3);


hs_2001=hs(:,:,265:276); hs_2001_a=nanmean(hs_2001,3); 
hs_2001_w=nanmean(cat(3,hs_2001(:,:,11),hs_2001(:,:,12),hs_2001(:,:,1),hs_2001(:,:,2),hs_2001(:,:,3)),3);
hs_2001_s=nanmean(cat(3,hs_2001(:,:,4),hs_2001(:,:,5),hs_2001(:,:,6),hs_2001(:,:,7),hs_2001(:,:,8),hs_2001(:,:,9),hs_2001(:,:,10)),3);
tm_2001=tm(:,:,265:276); tm_2001_a=nanmean(tm_2001,3); 
tm_2001_w=nanmean(cat(3,tm_2001(:,:,11),tm_2001(:,:,12),tm_2001(:,:,1),tm_2001(:,:,2),tm_2001(:,:,3)),3);
tm_2001_s=nanmean(cat(3,tm_2001(:,:,4),tm_2001(:,:,5),tm_2001(:,:,6),tm_2001(:,:,7),tm_2001(:,:,8),tm_2001(:,:,9),tm_2001(:,:,10)),3);
dm_2001=dm(:,:,265:276); dm_2001_a=nanmean(dm_2001,3); 
dm_2001_w=nanmean(cat(3,dm_2001(:,:,11),dm_2001(:,:,12),dm_2001(:,:,1),dm_2001(:,:,2),dm_2001(:,:,3)),3);
dm_2001_s=nanmean(cat(3,dm_2001(:,:,4),dm_2001(:,:,5),dm_2001(:,:,6),dm_2001(:,:,7),dm_2001(:,:,8),dm_2001(:,:,9),dm_2001(:,:,10)),3);


hs_2002=hs(:,:,277:288); hs_2002_a=nanmean(hs_2002,3); 
hs_2002_w=nanmean(cat(3,hs_2002(:,:,11),hs_2002(:,:,12),hs_2002(:,:,1),hs_2002(:,:,2),hs_2002(:,:,3)),3);
hs_2002_s=nanmean(cat(3,hs_2002(:,:,4),hs_2002(:,:,5),hs_2002(:,:,6),hs_2002(:,:,7),hs_2002(:,:,8),hs_2002(:,:,9),hs_2002(:,:,10)),3);
tm_2002=tm(:,:,277:288); tm_2002_a=nanmean(tm_2002,3); 
tm_2002_w=nanmean(cat(3,tm_2002(:,:,11),tm_2002(:,:,12),tm_2002(:,:,1),tm_2002(:,:,2),tm_2002(:,:,3)),3);
tm_2002_s=nanmean(cat(3,tm_2002(:,:,4),tm_2002(:,:,5),tm_2002(:,:,6),tm_2002(:,:,7),tm_2002(:,:,8),tm_2002(:,:,9),tm_2002(:,:,10)),3);
dm_2002=dm(:,:,277:288); dm_2002_a=nanmean(dm_2002,3); 
dm_2002_w=nanmean(cat(3,dm_2002(:,:,11),dm_2002(:,:,12),dm_2002(:,:,1),dm_2002(:,:,2),dm_2002(:,:,3)),3);
dm_2002_s=nanmean(cat(3,dm_2002(:,:,4),dm_2002(:,:,5),dm_2002(:,:,6),dm_2002(:,:,7),dm_2002(:,:,8),dm_2002(:,:,9),dm_2002(:,:,10)),3);


hs_2003=hs(:,:,289:300); hs_2003_a=nanmean(hs_2003,3); 
hs_2003_w=nanmean(cat(3,hs_2003(:,:,11),hs_2003(:,:,12),hs_2003(:,:,1),hs_2003(:,:,2),hs_2003(:,:,3)),3);
hs_2003_s=nanmean(cat(3,hs_2003(:,:,4),hs_2003(:,:,5),hs_2003(:,:,6),hs_2003(:,:,7),hs_2003(:,:,8),hs_2003(:,:,9),hs_2003(:,:,10)),3);
tm_2003=tm(:,:,289:300); tm_2003_a=nanmean(tm_2003,3); 
tm_2003_w=nanmean(cat(3,tm_2003(:,:,11),tm_2003(:,:,12),tm_2003(:,:,1),tm_2003(:,:,2),tm_2003(:,:,3)),3);
tm_2003_s=nanmean(cat(3,tm_2003(:,:,4),tm_2003(:,:,5),tm_2003(:,:,6),tm_2003(:,:,7),tm_2003(:,:,8),tm_2003(:,:,9),tm_2003(:,:,10)),3);
dm_2003=dm(:,:,289:300); dm_2003_a=nanmean(dm_2003,3); 
dm_2003_w=nanmean(cat(3,dm_2003(:,:,11),dm_2003(:,:,12),dm_2003(:,:,1),dm_2003(:,:,2),dm_2003(:,:,3)),3);
dm_2003_s=nanmean(cat(3,dm_2003(:,:,4),dm_2003(:,:,5),dm_2003(:,:,6),dm_2003(:,:,7),dm_2003(:,:,8),dm_2003(:,:,9),dm_2003(:,:,10)),3);


hs_2004=hs(:,:,301:312); hs_2004_a=nanmean(hs_2004,3); 
hs_2004_w=nanmean(cat(3,hs_2004(:,:,11),hs_2004(:,:,12),hs_2004(:,:,1),hs_2004(:,:,2),hs_2004(:,:,3)),3);
hs_2004_s=nanmean(cat(3,hs_2004(:,:,4),hs_2004(:,:,5),hs_2004(:,:,6),hs_2004(:,:,7),hs_2004(:,:,8),hs_2004(:,:,9),hs_2004(:,:,10)),3);
tm_2004=tm(:,:,301:312); tm_2004_a=nanmean(tm_2004,3); 
tm_2004_w=nanmean(cat(3,tm_2004(:,:,11),tm_2004(:,:,12),tm_2004(:,:,1),tm_2004(:,:,2),tm_2004(:,:,3)),3);
tm_2004_s=nanmean(cat(3,tm_2004(:,:,4),tm_2004(:,:,5),tm_2004(:,:,6),tm_2004(:,:,7),tm_2004(:,:,8),tm_2004(:,:,9),tm_2004(:,:,10)),3);
dm_2004=dm(:,:,301:312); dm_2004_a=nanmean(dm_2004,3); 
dm_2004_w=nanmean(cat(3,dm_2004(:,:,11),dm_2004(:,:,12),dm_2004(:,:,1),dm_2004(:,:,2),dm_2004(:,:,3)),3);
dm_2004_s=nanmean(cat(3,dm_2004(:,:,4),dm_2004(:,:,5),dm_2004(:,:,6),dm_2004(:,:,7),dm_2004(:,:,8),dm_2004(:,:,9),dm_2004(:,:,10)),3);


%% Select the nearest wave information to the selected points on the coast
load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
lonx_coteind=find(lonx_cotei<=20 & lonx_cotei>=-20 & latx_cotei <=20 & latx_cotei >=-20);
lonx_cote=lonx_cotei(lonx_coteind);
latx_cote=latx_cotei(lonx_coteind);

[X Y]=meshgrid(Xlong,Ylat);X=double(X);Y=double(Y);

hs_select_1979_a=griddata(X(:),Y(:),hs_1979_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1979_w=griddata(X(:),Y(:),hs_1979_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1979_s=griddata(X(:),Y(:),hs_1979_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1979_a=griddata(X(:),Y(:),tm_1979_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1979_w=griddata(X(:),Y(:),tm_1979_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1979_s=griddata(X(:),Y(:),tm_1979_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1979_a=griddata(X(:),Y(:),dm_1979_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1979_w=griddata(X(:),Y(:),dm_1979_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1979_s=griddata(X(:),Y(:),dm_1979_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1980_a=griddata(X(:),Y(:),hs_1980_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1980_w=griddata(X(:),Y(:),hs_1980_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1980_s=griddata(X(:),Y(:),hs_1980_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1980_a=griddata(X(:),Y(:),tm_1980_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1980_w=griddata(X(:),Y(:),tm_1980_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1980_s=griddata(X(:),Y(:),tm_1980_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1980_a=griddata(X(:),Y(:),dm_1980_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1980_w=griddata(X(:),Y(:),dm_1980_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1980_s=griddata(X(:),Y(:),dm_1980_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1981_a=griddata(X(:),Y(:),hs_1981_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1981_w=griddata(X(:),Y(:),hs_1981_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1981_s=griddata(X(:),Y(:),hs_1981_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1981_a=griddata(X(:),Y(:),tm_1981_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1981_w=griddata(X(:),Y(:),tm_1981_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1981_s=griddata(X(:),Y(:),tm_1981_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1981_a=griddata(X(:),Y(:),dm_1981_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1981_w=griddata(X(:),Y(:),dm_1981_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1981_s=griddata(X(:),Y(:),dm_1981_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1982_a=griddata(X(:),Y(:),hs_1982_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1982_w=griddata(X(:),Y(:),hs_1982_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1982_s=griddata(X(:),Y(:),hs_1982_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1982_a=griddata(X(:),Y(:),tm_1982_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1982_w=griddata(X(:),Y(:),tm_1982_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1982_s=griddata(X(:),Y(:),tm_1982_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1982_a=griddata(X(:),Y(:),dm_1982_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1982_w=griddata(X(:),Y(:),dm_1982_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1982_s=griddata(X(:),Y(:),dm_1982_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1983_a=griddata(X(:),Y(:),hs_1983_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1983_w=griddata(X(:),Y(:),hs_1983_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1983_s=griddata(X(:),Y(:),hs_1983_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1983_a=griddata(X(:),Y(:),tm_1983_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1983_w=griddata(X(:),Y(:),tm_1983_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1983_s=griddata(X(:),Y(:),tm_1983_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1983_a=griddata(X(:),Y(:),dm_1983_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1983_w=griddata(X(:),Y(:),dm_1983_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1983_s=griddata(X(:),Y(:),dm_1983_s(:),lonx_cote,latx_cote,'nearest');


hs_select_1984_a=griddata(X(:),Y(:),hs_1984_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1984_w=griddata(X(:),Y(:),hs_1984_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1984_s=griddata(X(:),Y(:),hs_1984_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1984_a=griddata(X(:),Y(:),tm_1984_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1984_w=griddata(X(:),Y(:),tm_1984_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1984_s=griddata(X(:),Y(:),tm_1984_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1984_a=griddata(X(:),Y(:),dm_1984_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1984_w=griddata(X(:),Y(:),dm_1984_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1984_s=griddata(X(:),Y(:),dm_1984_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1985_a=griddata(X(:),Y(:),hs_1985_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1985_w=griddata(X(:),Y(:),hs_1985_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1985_s=griddata(X(:),Y(:),hs_1985_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1985_a=griddata(X(:),Y(:),tm_1985_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1985_w=griddata(X(:),Y(:),tm_1985_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1985_s=griddata(X(:),Y(:),tm_1985_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1985_a=griddata(X(:),Y(:),dm_1985_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1985_w=griddata(X(:),Y(:),dm_1985_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1985_s=griddata(X(:),Y(:),dm_1985_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1986_a=griddata(X(:),Y(:),hs_1986_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1986_w=griddata(X(:),Y(:),hs_1986_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1986_s=griddata(X(:),Y(:),hs_1986_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1986_a=griddata(X(:),Y(:),tm_1986_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1986_w=griddata(X(:),Y(:),tm_1986_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1986_s=griddata(X(:),Y(:),tm_1986_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1986_a=griddata(X(:),Y(:),dm_1986_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1986_w=griddata(X(:),Y(:),dm_1986_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1986_s=griddata(X(:),Y(:),dm_1986_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1987_a=griddata(X(:),Y(:),hs_1987_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1987_w=griddata(X(:),Y(:),hs_1987_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1987_s=griddata(X(:),Y(:),hs_1987_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1987_a=griddata(X(:),Y(:),tm_1987_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1987_w=griddata(X(:),Y(:),tm_1987_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1987_s=griddata(X(:),Y(:),tm_1987_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1987_a=griddata(X(:),Y(:),dm_1987_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1987_w=griddata(X(:),Y(:),dm_1987_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1987_s=griddata(X(:),Y(:),dm_1987_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1988_a=griddata(X(:),Y(:),hs_1988_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1988_w=griddata(X(:),Y(:),hs_1988_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1988_s=griddata(X(:),Y(:),hs_1988_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1988_a=griddata(X(:),Y(:),tm_1988_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1988_w=griddata(X(:),Y(:),tm_1988_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1988_s=griddata(X(:),Y(:),tm_1988_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1988_a=griddata(X(:),Y(:),dm_1988_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1988_w=griddata(X(:),Y(:),dm_1988_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1988_s=griddata(X(:),Y(:),dm_1988_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1989_a=griddata(X(:),Y(:),hs_1989_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1989_w=griddata(X(:),Y(:),hs_1989_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1989_s=griddata(X(:),Y(:),hs_1989_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1989_a=griddata(X(:),Y(:),tm_1989_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1989_w=griddata(X(:),Y(:),tm_1989_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1989_s=griddata(X(:),Y(:),tm_1989_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1989_a=griddata(X(:),Y(:),dm_1989_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1989_w=griddata(X(:),Y(:),dm_1989_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1989_s=griddata(X(:),Y(:),dm_1989_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1990_a=griddata(X(:),Y(:),hs_1990_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1990_w=griddata(X(:),Y(:),hs_1990_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1990_s=griddata(X(:),Y(:),hs_1990_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1990_a=griddata(X(:),Y(:),tm_1990_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1990_w=griddata(X(:),Y(:),tm_1990_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1990_s=griddata(X(:),Y(:),tm_1990_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1990_a=griddata(X(:),Y(:),dm_1990_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1990_w=griddata(X(:),Y(:),dm_1990_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1990_s=griddata(X(:),Y(:),dm_1990_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1991_a=griddata(X(:),Y(:),hs_1991_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1991_w=griddata(X(:),Y(:),hs_1991_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1991_s=griddata(X(:),Y(:),hs_1991_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1991_a=griddata(X(:),Y(:),tm_1991_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1991_w=griddata(X(:),Y(:),tm_1991_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1991_s=griddata(X(:),Y(:),tm_1991_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1991_a=griddata(X(:),Y(:),dm_1991_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1991_w=griddata(X(:),Y(:),dm_1991_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1991_s=griddata(X(:),Y(:),dm_1991_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1992_a=griddata(X(:),Y(:),hs_1992_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1992_w=griddata(X(:),Y(:),hs_1992_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1992_s=griddata(X(:),Y(:),hs_1992_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1992_a=griddata(X(:),Y(:),tm_1992_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1992_w=griddata(X(:),Y(:),tm_1992_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1992_s=griddata(X(:),Y(:),tm_1992_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1992_a=griddata(X(:),Y(:),dm_1992_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1992_w=griddata(X(:),Y(:),dm_1992_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1992_s=griddata(X(:),Y(:),dm_1992_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1993_a=griddata(X(:),Y(:),hs_1993_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1993_w=griddata(X(:),Y(:),hs_1993_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1993_s=griddata(X(:),Y(:),hs_1993_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1993_a=griddata(X(:),Y(:),tm_1993_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1993_w=griddata(X(:),Y(:),tm_1993_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1993_s=griddata(X(:),Y(:),tm_1993_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1993_a=griddata(X(:),Y(:),dm_1993_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1993_w=griddata(X(:),Y(:),dm_1993_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1993_s=griddata(X(:),Y(:),dm_1993_s(:),lonx_cote,latx_cote,'nearest');


hs_select_1994_a=griddata(X(:),Y(:),hs_1994_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1994_w=griddata(X(:),Y(:),hs_1994_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1994_s=griddata(X(:),Y(:),hs_1994_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1994_a=griddata(X(:),Y(:),tm_1994_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1994_w=griddata(X(:),Y(:),tm_1994_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1994_s=griddata(X(:),Y(:),tm_1994_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1994_a=griddata(X(:),Y(:),dm_1994_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1994_w=griddata(X(:),Y(:),dm_1994_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1994_s=griddata(X(:),Y(:),dm_1994_s(:),lonx_cote,latx_cote,'nearest');


hs_select_1995_a=griddata(X(:),Y(:),hs_1995_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1995_w=griddata(X(:),Y(:),hs_1995_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1995_s=griddata(X(:),Y(:),hs_1995_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1995_a=griddata(X(:),Y(:),tm_1995_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1995_w=griddata(X(:),Y(:),tm_1995_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1995_s=griddata(X(:),Y(:),tm_1995_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1995_a=griddata(X(:),Y(:),dm_1995_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1995_w=griddata(X(:),Y(:),dm_1995_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1995_s=griddata(X(:),Y(:),dm_1995_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1996_a=griddata(X(:),Y(:),hs_1996_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1996_w=griddata(X(:),Y(:),hs_1996_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1996_s=griddata(X(:),Y(:),hs_1996_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1996_a=griddata(X(:),Y(:),tm_1996_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1996_w=griddata(X(:),Y(:),tm_1996_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1996_s=griddata(X(:),Y(:),tm_1996_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1996_a=griddata(X(:),Y(:),dm_1996_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1996_w=griddata(X(:),Y(:),dm_1996_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1996_s=griddata(X(:),Y(:),dm_1996_s(:),lonx_cote,latx_cote,'nearest');


hs_select_1997_a=griddata(X(:),Y(:),hs_1997_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1997_w=griddata(X(:),Y(:),hs_1997_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1997_s=griddata(X(:),Y(:),hs_1997_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1997_a=griddata(X(:),Y(:),tm_1997_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1997_w=griddata(X(:),Y(:),tm_1997_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1997_s=griddata(X(:),Y(:),tm_1997_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1997_a=griddata(X(:),Y(:),dm_1997_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1997_w=griddata(X(:),Y(:),dm_1997_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1997_s=griddata(X(:),Y(:),dm_1997_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1998_a=griddata(X(:),Y(:),hs_1998_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1998_w=griddata(X(:),Y(:),hs_1998_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1998_s=griddata(X(:),Y(:),hs_1998_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1998_a=griddata(X(:),Y(:),tm_1998_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1998_w=griddata(X(:),Y(:),tm_1998_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1998_s=griddata(X(:),Y(:),tm_1998_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1998_a=griddata(X(:),Y(:),dm_1998_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1998_w=griddata(X(:),Y(:),dm_1998_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1998_s=griddata(X(:),Y(:),dm_1998_s(:),lonx_cote,latx_cote,'nearest');

hs_select_1999_a=griddata(X(:),Y(:),hs_1999_a(:),lonx_cote,latx_cote,'nearest');
hs_select_1999_w=griddata(X(:),Y(:),hs_1999_w(:),lonx_cote,latx_cote,'nearest');
hs_select_1999_s=griddata(X(:),Y(:),hs_1999_s(:),lonx_cote,latx_cote,'nearest');
tm_select_1999_a=griddata(X(:),Y(:),tm_1999_a(:),lonx_cote,latx_cote,'nearest');
tm_select_1999_w=griddata(X(:),Y(:),tm_1999_w(:),lonx_cote,latx_cote,'nearest');
tm_select_1999_s=griddata(X(:),Y(:),tm_1999_s(:),lonx_cote,latx_cote,'nearest');
dm_select_1999_a=griddata(X(:),Y(:),dm_1999_a(:),lonx_cote,latx_cote,'nearest');
dm_select_1999_w=griddata(X(:),Y(:),dm_1999_w(:),lonx_cote,latx_cote,'nearest');
dm_select_1999_s=griddata(X(:),Y(:),dm_1999_s(:),lonx_cote,latx_cote,'nearest');

hs_select_2000_a=griddata(X(:),Y(:),hs_2000_a(:),lonx_cote,latx_cote,'nearest');
hs_select_2000_w=griddata(X(:),Y(:),hs_2000_w(:),lonx_cote,latx_cote,'nearest');
hs_select_2000_s=griddata(X(:),Y(:),hs_2000_s(:),lonx_cote,latx_cote,'nearest');
tm_select_2000_a=griddata(X(:),Y(:),tm_2000_a(:),lonx_cote,latx_cote,'nearest');
tm_select_2000_w=griddata(X(:),Y(:),tm_2000_w(:),lonx_cote,latx_cote,'nearest');
tm_select_2000_s=griddata(X(:),Y(:),tm_2000_s(:),lonx_cote,latx_cote,'nearest');
dm_select_2000_a=griddata(X(:),Y(:),dm_2000_a(:),lonx_cote,latx_cote,'nearest');
dm_select_2000_w=griddata(X(:),Y(:),dm_2000_w(:),lonx_cote,latx_cote,'nearest');
dm_select_2000_s=griddata(X(:),Y(:),dm_2000_s(:),lonx_cote,latx_cote,'nearest');

hs_select_2001_a=griddata(X(:),Y(:),hs_2001_a(:),lonx_cote,latx_cote,'nearest');
hs_select_2001_w=griddata(X(:),Y(:),hs_2001_w(:),lonx_cote,latx_cote,'nearest');
hs_select_2001_s=griddata(X(:),Y(:),hs_2001_s(:),lonx_cote,latx_cote,'nearest');
tm_select_2001_a=griddata(X(:),Y(:),tm_2001_a(:),lonx_cote,latx_cote,'nearest');
tm_select_2001_w=griddata(X(:),Y(:),tm_2001_w(:),lonx_cote,latx_cote,'nearest');
tm_select_2001_s=griddata(X(:),Y(:),tm_2001_s(:),lonx_cote,latx_cote,'nearest');
dm_select_2001_a=griddata(X(:),Y(:),dm_2001_a(:),lonx_cote,latx_cote,'nearest');
dm_select_2001_w=griddata(X(:),Y(:),dm_2001_w(:),lonx_cote,latx_cote,'nearest');
dm_select_2001_s=griddata(X(:),Y(:),dm_2001_s(:),lonx_cote,latx_cote,'nearest');

hs_select_2002_a=griddata(X(:),Y(:),hs_2002_a(:),lonx_cote,latx_cote,'nearest');
hs_select_2002_w=griddata(X(:),Y(:),hs_2002_w(:),lonx_cote,latx_cote,'nearest');
hs_select_2002_s=griddata(X(:),Y(:),hs_2002_s(:),lonx_cote,latx_cote,'nearest');
tm_select_2002_a=griddata(X(:),Y(:),tm_2002_a(:),lonx_cote,latx_cote,'nearest');
tm_select_2002_w=griddata(X(:),Y(:),tm_2002_w(:),lonx_cote,latx_cote,'nearest');
tm_select_2002_s=griddata(X(:),Y(:),tm_2002_s(:),lonx_cote,latx_cote,'nearest');
dm_select_2002_a=griddata(X(:),Y(:),dm_2002_a(:),lonx_cote,latx_cote,'nearest');
dm_select_2002_w=griddata(X(:),Y(:),dm_2002_w(:),lonx_cote,latx_cote,'nearest');
dm_select_2002_s=griddata(X(:),Y(:),dm_2002_s(:),lonx_cote,latx_cote,'nearest');

hs_select_2003_a=griddata(X(:),Y(:),hs_2003_a(:),lonx_cote,latx_cote,'nearest');
hs_select_2003_w=griddata(X(:),Y(:),hs_2003_w(:),lonx_cote,latx_cote,'nearest');
hs_select_2003_s=griddata(X(:),Y(:),hs_2003_s(:),lonx_cote,latx_cote,'nearest');
tm_select_2003_a=griddata(X(:),Y(:),tm_2003_a(:),lonx_cote,latx_cote,'nearest');
tm_select_2003_w=griddata(X(:),Y(:),tm_2003_w(:),lonx_cote,latx_cote,'nearest');
tm_select_2003_s=griddata(X(:),Y(:),tm_2003_s(:),lonx_cote,latx_cote,'nearest');
dm_select_2003_a=griddata(X(:),Y(:),dm_2003_a(:),lonx_cote,latx_cote,'nearest');
dm_select_2003_w=griddata(X(:),Y(:),dm_2003_w(:),lonx_cote,latx_cote,'nearest');
dm_select_2003_s=griddata(X(:),Y(:),dm_2003_s(:),lonx_cote,latx_cote,'nearest');

hs_select_2004_a=griddata(X(:),Y(:),hs_2004_a(:),lonx_cote,latx_cote,'nearest');
hs_select_2004_w=griddata(X(:),Y(:),hs_2004_w(:),lonx_cote,latx_cote,'nearest');
hs_select_2004_s=griddata(X(:),Y(:),hs_2004_s(:),lonx_cote,latx_cote,'nearest');
tm_select_2004_a=griddata(X(:),Y(:),tm_2004_a(:),lonx_cote,latx_cote,'nearest');
tm_select_2004_w=griddata(X(:),Y(:),tm_2004_w(:),lonx_cote,latx_cote,'nearest');
tm_select_2004_s=griddata(X(:),Y(:),tm_2004_s(:),lonx_cote,latx_cote,'nearest');
dm_select_2004_a=griddata(X(:),Y(:),dm_2004_a(:),lonx_cote,latx_cote,'nearest');
dm_select_2004_w=griddata(X(:),Y(:),dm_2004_w(:),lonx_cote,latx_cote,'nearest');
dm_select_2004_s=griddata(X(:),Y(:),dm_2004_s(:),lonx_cote,latx_cote,'nearest');

%% Remove some points that are too close and Islands for clarity

%load('/home/profdam/Documents/PhD Project/Scripts/Adapted/Final_tm_select.mat', 'lat_f', 'lon_f')%lon_f=final_select(:,1); lat_f=final_select(:,2);
load('/home/profdam/Documents/PhD Project/Scripts/Adapted/Final_hs_tm_dm_select1.mat', 'lat_f', 'lon_f');

indd=[];
for i=1:length(lat_f)
    ind=find(lonx_cote==lon_f(i) & latx_cote==lat_f(i));
    if length(ind)>1
        ind=ind(1);
    end
    indd=[indd ind];
end

hs_1979_a_f=hs_select_1979_a(indd);
hs_1979_w_f=hs_select_1979_w(indd);
hs_1979_s_f=hs_select_1979_s(indd);
tm_1979_a_f=tm_select_1979_a(indd);
tm_1979_w_f=tm_select_1979_w(indd);
tm_1979_s_f=tm_select_1979_s(indd);
dm_1979_a_f=dm_select_1979_a(indd);
dm_1979_w_f=dm_select_1979_w(indd);
dm_1979_s_f=dm_select_1979_s(indd);

hs_1980_a_f=hs_select_1980_a(indd);
hs_1980_w_f=hs_select_1980_w(indd);
hs_1980_s_f=hs_select_1980_s(indd);
tm_1980_a_f=tm_select_1980_a(indd);
tm_1980_w_f=tm_select_1980_w(indd);
tm_1980_s_f=tm_select_1980_s(indd);
dm_1980_a_f=dm_select_1980_a(indd);
dm_1980_w_f=dm_select_1980_w(indd);
dm_1980_s_f=dm_select_1980_s(indd);


hs_1981_a_f=hs_select_1981_a(indd);
hs_1981_w_f=hs_select_1981_w(indd);
hs_1981_s_f=hs_select_1981_s(indd);
tm_1981_a_f=tm_select_1981_a(indd);
tm_1981_w_f=tm_select_1981_w(indd);
tm_1981_s_f=tm_select_1981_s(indd);
dm_1981_a_f=dm_select_1981_a(indd);
dm_1981_w_f=dm_select_1981_w(indd);
dm_1981_s_f=dm_select_1981_s(indd);

hs_1982_a_f=hs_select_1982_a(indd);
hs_1982_w_f=hs_select_1982_w(indd);
hs_1982_s_f=hs_select_1982_s(indd);
tm_1982_a_f=tm_select_1982_a(indd);
tm_1982_w_f=tm_select_1982_w(indd);
tm_1982_s_f=tm_select_1982_s(indd);
dm_1982_a_f=dm_select_1982_a(indd);
dm_1982_w_f=dm_select_1982_w(indd);
dm_1982_s_f=dm_select_1982_s(indd);

hs_1983_a_f=hs_select_1983_a(indd);
hs_1983_w_f=hs_select_1983_w(indd);
hs_1983_s_f=hs_select_1983_s(indd);
tm_1983_a_f=tm_select_1983_a(indd);
tm_1983_w_f=tm_select_1983_w(indd);
tm_1983_s_f=tm_select_1983_s(indd);
dm_1983_a_f=dm_select_1983_a(indd);
dm_1983_w_f=dm_select_1983_w(indd);
dm_1983_s_f=dm_select_1983_s(indd);

hs_1984_a_f=hs_select_1984_a(indd);
hs_1984_w_f=hs_select_1984_w(indd);
hs_1984_s_f=hs_select_1984_s(indd);
tm_1984_a_f=tm_select_1984_a(indd);
tm_1984_w_f=tm_select_1984_w(indd);
tm_1984_s_f=tm_select_1984_s(indd);
dm_1984_a_f=dm_select_1984_a(indd);
dm_1984_w_f=dm_select_1984_w(indd);
dm_1984_s_f=dm_select_1984_s(indd);

hs_1985_a_f=hs_select_1985_a(indd);
hs_1985_w_f=hs_select_1985_w(indd);
hs_1985_s_f=hs_select_1985_s(indd);
tm_1985_a_f=tm_select_1985_a(indd);
tm_1985_w_f=tm_select_1985_w(indd);
tm_1985_s_f=tm_select_1985_s(indd);
dm_1985_a_f=dm_select_1985_a(indd);
dm_1985_w_f=dm_select_1985_w(indd);
dm_1985_s_f=dm_select_1985_s(indd);

hs_1986_a_f=hs_select_1986_a(indd);
hs_1986_w_f=hs_select_1986_w(indd);
hs_1986_s_f=hs_select_1986_s(indd);
tm_1986_a_f=tm_select_1986_a(indd);
tm_1986_w_f=tm_select_1986_w(indd);
tm_1986_s_f=tm_select_1986_s(indd);
dm_1986_a_f=dm_select_1986_a(indd);
dm_1986_w_f=dm_select_1986_w(indd);
dm_1986_s_f=dm_select_1986_s(indd);

hs_1987_a_f=hs_select_1987_a(indd);
hs_1987_w_f=hs_select_1987_w(indd);
hs_1987_s_f=hs_select_1987_s(indd);
tm_1987_a_f=tm_select_1987_a(indd);
tm_1987_w_f=tm_select_1987_w(indd);
tm_1987_s_f=tm_select_1987_s(indd);
dm_1987_a_f=dm_select_1987_a(indd);
dm_1987_w_f=dm_select_1987_w(indd);
dm_1987_s_f=dm_select_1987_s(indd);

hs_1988_a_f=hs_select_1988_a(indd);
hs_1988_w_f=hs_select_1988_w(indd);
hs_1988_s_f=hs_select_1988_s(indd);
tm_1988_a_f=tm_select_1988_a(indd);
tm_1988_w_f=tm_select_1988_w(indd);
tm_1988_s_f=tm_select_1988_s(indd);
dm_1988_a_f=dm_select_1988_a(indd);
dm_1988_w_f=dm_select_1988_w(indd);
dm_1988_s_f=dm_select_1988_s(indd);


hs_1989_a_f=hs_select_1989_a(indd);
hs_1989_w_f=hs_select_1989_w(indd);
hs_1989_s_f=hs_select_1989_s(indd);
tm_1989_a_f=tm_select_1989_a(indd);
tm_1989_w_f=tm_select_1989_w(indd);
tm_1989_s_f=tm_select_1989_s(indd);
dm_1989_a_f=dm_select_1989_a(indd);
dm_1989_w_f=dm_select_1989_w(indd);
dm_1989_s_f=dm_select_1989_s(indd);

hs_1990_a_f=hs_select_1990_a(indd);
hs_1990_w_f=hs_select_1990_w(indd);
hs_1990_s_f=hs_select_1990_s(indd);
tm_1990_a_f=tm_select_1990_a(indd);
tm_1990_w_f=tm_select_1990_w(indd);
tm_1990_s_f=tm_select_1990_s(indd);
dm_1990_a_f=dm_select_1990_a(indd);
dm_1990_w_f=dm_select_1990_w(indd);
dm_1990_s_f=dm_select_1990_s(indd);

hs_1991_a_f=hs_select_1991_a(indd);
hs_1991_w_f=hs_select_1991_w(indd);
hs_1991_s_f=hs_select_1991_s(indd);
tm_1991_a_f=tm_select_1991_a(indd);
tm_1991_w_f=tm_select_1991_w(indd);
tm_1991_s_f=tm_select_1991_s(indd);
dm_1991_a_f=dm_select_1991_a(indd);
dm_1991_w_f=dm_select_1991_w(indd);
dm_1991_s_f=dm_select_1991_s(indd);

hs_1992_a_f=hs_select_1992_a(indd);
hs_1992_w_f=hs_select_1992_w(indd);
hs_1992_s_f=hs_select_1992_s(indd);
tm_1992_a_f=tm_select_1992_a(indd);
tm_1992_w_f=tm_select_1992_w(indd);
tm_1992_s_f=tm_select_1992_s(indd);
dm_1992_a_f=dm_select_1992_a(indd);
dm_1992_w_f=dm_select_1992_w(indd);
dm_1992_s_f=dm_select_1992_s(indd);

hs_1993_a_f=hs_select_1993_a(indd);
hs_1993_w_f=hs_select_1993_w(indd);
hs_1993_s_f=hs_select_1993_s(indd);
tm_1993_a_f=tm_select_1993_a(indd);
tm_1993_w_f=tm_select_1993_w(indd);
tm_1993_s_f=tm_select_1993_s(indd);
dm_1993_a_f=dm_select_1993_a(indd);
dm_1993_w_f=dm_select_1993_w(indd);
dm_1993_s_f=dm_select_1993_s(indd);


hs_1994_a_f=hs_select_1994_a(indd);
hs_1994_w_f=hs_select_1994_w(indd);
hs_1994_s_f=hs_select_1994_s(indd);
tm_1994_a_f=tm_select_1994_a(indd);
tm_1994_w_f=tm_select_1994_w(indd);
tm_1994_s_f=tm_select_1994_s(indd);
dm_1994_a_f=dm_select_1994_a(indd);
dm_1994_w_f=dm_select_1994_w(indd);
dm_1994_s_f=dm_select_1994_s(indd);

hs_1995_a_f=hs_select_1995_a(indd);
hs_1995_w_f=hs_select_1995_w(indd);
hs_1995_s_f=hs_select_1995_s(indd);
tm_1995_a_f=tm_select_1995_a(indd);
tm_1995_w_f=tm_select_1995_w(indd);
tm_1995_s_f=tm_select_1995_s(indd);
dm_1995_a_f=dm_select_1995_a(indd);
dm_1995_w_f=dm_select_1995_w(indd);
dm_1995_s_f=dm_select_1995_s(indd);

hs_1996_a_f=hs_select_1996_a(indd);
hs_1996_w_f=hs_select_1996_w(indd);
hs_1996_s_f=hs_select_1996_s(indd);
tm_1996_a_f=tm_select_1996_a(indd);
tm_1996_w_f=tm_select_1996_w(indd);
tm_1996_s_f=tm_select_1996_s(indd);
dm_1996_a_f=dm_select_1996_a(indd);
dm_1996_w_f=dm_select_1996_w(indd);
dm_1996_s_f=dm_select_1996_s(indd);

hs_1997_a_f=hs_select_1997_a(indd);
hs_1997_w_f=hs_select_1997_w(indd);
hs_1997_s_f=hs_select_1997_s(indd);
tm_1997_a_f=tm_select_1997_a(indd);
tm_1997_w_f=tm_select_1997_w(indd);
tm_1997_s_f=tm_select_1997_s(indd);
dm_1997_a_f=dm_select_1997_a(indd);
dm_1997_w_f=dm_select_1997_w(indd);
dm_1997_s_f=dm_select_1997_s(indd);

hs_1998_a_f=hs_select_1998_a(indd);
hs_1998_w_f=hs_select_1998_w(indd);
hs_1998_s_f=hs_select_1998_s(indd);
tm_1998_a_f=tm_select_1998_a(indd);
tm_1998_w_f=tm_select_1998_w(indd);
tm_1998_s_f=tm_select_1998_s(indd);
dm_1998_a_f=dm_select_1998_a(indd);
dm_1998_w_f=dm_select_1998_w(indd);
dm_1998_s_f=dm_select_1998_s(indd);

hs_1999_a_f=hs_select_1999_a(indd);
hs_1999_w_f=hs_select_1999_w(indd);
hs_1999_s_f=hs_select_1999_s(indd);
tm_1999_a_f=tm_select_1999_a(indd);
tm_1999_w_f=tm_select_1999_w(indd);
tm_1999_s_f=tm_select_1999_s(indd);
dm_1999_a_f=dm_select_1999_a(indd);
dm_1999_w_f=dm_select_1999_w(indd);
dm_1999_s_f=dm_select_1999_s(indd);

hs_2000_a_f=hs_select_2000_a(indd);
hs_2000_w_f=hs_select_2000_w(indd);
hs_2000_s_f=hs_select_2000_s(indd);
tm_2000_a_f=tm_select_2000_a(indd);
tm_2000_w_f=tm_select_2000_w(indd);
tm_2000_s_f=tm_select_2000_s(indd);
dm_2000_a_f=dm_select_2000_a(indd);
dm_2000_w_f=dm_select_2000_w(indd);
dm_2000_s_f=dm_select_2000_s(indd);

hs_2001_a_f=hs_select_2001_a(indd);
hs_2001_w_f=hs_select_2001_w(indd);
hs_2001_s_f=hs_select_2001_s(indd);
tm_2001_a_f=tm_select_2001_a(indd);
tm_2001_w_f=tm_select_2001_w(indd);
tm_2001_s_f=tm_select_2001_s(indd);
dm_2001_a_f=dm_select_2001_a(indd);
dm_2001_w_f=dm_select_2001_w(indd);
dm_2001_s_f=dm_select_2001_s(indd);

hs_2002_a_f=hs_select_2002_a(indd);
hs_2002_w_f=hs_select_2002_w(indd);
hs_2002_s_f=hs_select_2002_s(indd);
tm_2002_a_f=tm_select_2002_a(indd);
tm_2002_w_f=tm_select_2002_w(indd);
tm_2002_s_f=tm_select_2002_s(indd);
dm_2002_a_f=dm_select_2002_a(indd);
dm_2002_w_f=dm_select_2002_w(indd);
dm_2002_s_f=dm_select_2002_s(indd);

hs_2003_a_f=hs_select_2003_a(indd);
hs_2003_w_f=hs_select_2003_w(indd);
hs_2003_s_f=hs_select_2003_s(indd);
tm_2003_a_f=tm_select_2003_a(indd);
tm_2003_w_f=tm_select_2003_w(indd);
tm_2003_s_f=tm_select_2003_s(indd);
dm_2003_a_f=dm_select_2003_a(indd);
dm_2003_w_f=dm_select_2003_w(indd);
dm_2003_s_f=dm_select_2003_s(indd);

hs_2004_a_f=hs_select_2004_a(indd);
hs_2004_w_f=hs_select_2004_w(indd);
hs_2004_s_f=hs_select_2004_s(indd);
tm_2004_a_f=tm_select_2004_a(indd);
tm_2004_w_f=tm_select_2004_w(indd);
tm_2004_s_f=tm_select_2004_s(indd);
dm_2004_a_f=dm_select_2004_a(indd);
dm_2004_w_f=dm_select_2004_w(indd);
dm_2004_s_f=dm_select_2004_s(indd);

%% Concatenate the selected points into a variable
hs_a_f=cat(2,hs_1979_a_f,hs_1980_a_f,hs_1981_a_f,hs_1982_a_f,hs_1983_a_f,hs_1984_a_f,hs_1985_a_f,...
    hs_1986_a_f,hs_1987_a_f,hs_1988_a_f,hs_1989_a_f,hs_1990_a_f,hs_1991_a_f,hs_1992_a_f,hs_1993_a_f,...
    hs_1994_a_f,hs_1995_a_f,hs_1996_a_f,hs_1997_a_f,hs_1998_a_f,hs_1999_a_f,hs_2000_a_f,hs_2001_a_f,...
    hs_2002_a_f,hs_2003_a_f,hs_2004_a_f);

hs_w_f=cat(2,hs_1979_w_f,hs_1980_w_f,hs_1981_w_f,hs_1982_w_f,hs_1983_w_f,hs_1984_w_f,hs_1985_w_f,...
    hs_1986_w_f,hs_1987_w_f,hs_1988_w_f,hs_1989_w_f,hs_1990_w_f,hs_1991_w_f,hs_1992_w_f,hs_1993_w_f,...
    hs_1994_w_f,hs_1995_w_f,hs_1996_w_f,hs_1997_w_f,hs_1998_w_f,hs_1999_w_f,hs_2000_w_f,hs_2001_w_f,...
    hs_2002_w_f,hs_2003_w_f,hs_2004_w_f);

hs_s_f=cat(2,hs_1979_s_f,hs_1980_s_f,hs_1981_s_f,hs_1982_s_f,hs_1983_s_f,hs_1984_s_f,hs_1985_s_f,...
    hs_1986_s_f,hs_1987_s_f,hs_1988_s_f,hs_1989_s_f,hs_1990_s_f,hs_1991_s_f,hs_1992_s_f,hs_1993_s_f,...
    hs_1994_s_f,hs_1995_s_f,hs_1996_s_f,hs_1997_s_f,hs_1998_s_f,hs_1999_s_f,hs_2000_s_f,hs_2001_s_f,...
    hs_2002_s_f,hs_2003_s_f,hs_2004_s_f);


tm_a_f=cat(2,tm_1979_a_f,tm_1980_a_f,tm_1981_a_f,tm_1982_a_f,tm_1983_a_f,tm_1984_a_f,tm_1985_a_f,...
    tm_1986_a_f,tm_1987_a_f,tm_1988_a_f,tm_1989_a_f,tm_1990_a_f,tm_1991_a_f,tm_1992_a_f,tm_1993_a_f,...
    tm_1994_a_f,tm_1995_a_f,tm_1996_a_f,tm_1997_a_f,tm_1998_a_f,tm_1999_a_f,tm_2000_a_f,tm_2001_a_f,...
    tm_2002_a_f,tm_2003_a_f,tm_2004_a_f);

tm_w_f=cat(2,tm_1979_w_f,tm_1980_w_f,tm_1981_w_f,tm_1982_w_f,tm_1983_w_f,tm_1984_w_f,tm_1985_w_f,...
    tm_1986_w_f,tm_1987_w_f,tm_1988_w_f,tm_1989_w_f,tm_1990_w_f,tm_1991_w_f,tm_1992_w_f,tm_1993_w_f,...
    tm_1994_w_f,tm_1995_w_f,tm_1996_w_f,tm_1997_w_f,tm_1998_w_f,tm_1999_w_f,tm_2000_w_f,tm_2001_w_f,...
    tm_2002_w_f,tm_2003_w_f,tm_2004_w_f);

tm_s_f=cat(2,tm_1979_s_f,tm_1980_s_f,tm_1981_s_f,tm_1982_s_f,tm_1983_s_f,tm_1984_s_f,tm_1985_s_f,...
    tm_1986_s_f,tm_1987_s_f,tm_1988_s_f,tm_1989_s_f,tm_1990_s_f,tm_1991_s_f,tm_1992_s_f,tm_1993_s_f,...
    tm_1994_s_f,tm_1995_s_f,tm_1996_s_f,tm_1997_s_f,tm_1998_s_f,tm_1999_s_f,tm_2000_s_f,tm_2001_s_f,...
    tm_2002_s_f,tm_2003_s_f,tm_2004_s_f);

dm_a_f=cat(2,dm_1979_a_f,dm_1980_a_f,dm_1981_a_f,dm_1982_a_f,dm_1983_a_f,dm_1984_a_f,dm_1985_a_f,...
    dm_1986_a_f,dm_1987_a_f,dm_1988_a_f,dm_1989_a_f,dm_1990_a_f,dm_1991_a_f,dm_1992_a_f,dm_1993_a_f,...
    dm_1994_a_f,dm_1995_a_f,dm_1996_a_f,dm_1997_a_f,dm_1998_a_f,dm_1999_a_f,dm_2000_a_f,dm_2001_a_f,...
    dm_2002_a_f,dm_2003_a_f,dm_2004_a_f);

dm_w_f=cat(2,dm_1979_w_f,dm_1980_w_f,dm_1981_w_f,dm_1982_w_f,dm_1983_w_f,dm_1984_w_f,dm_1985_w_f,...
    dm_1986_w_f,dm_1987_w_f,dm_1988_w_f,dm_1989_w_f,dm_1990_w_f,dm_1991_w_f,dm_1992_w_f,dm_1993_w_f,...
    dm_1994_w_f,dm_1995_w_f,dm_1996_w_f,dm_1997_w_f,dm_1998_w_f,dm_1999_w_f,dm_2000_w_f,dm_2001_w_f,...
    dm_2002_w_f,dm_2003_w_f,dm_2004_w_f);

dm_s_f=cat(2,dm_1979_s_f,dm_1980_s_f,dm_1981_s_f,dm_1982_s_f,dm_1983_s_f,dm_1984_s_f,dm_1985_s_f,...
    dm_1986_s_f,dm_1987_s_f,dm_1988_s_f,dm_1989_s_f,dm_1990_s_f,dm_1991_s_f,dm_1992_s_f,dm_1993_s_f,...
    dm_1994_s_f,dm_1995_s_f,dm_1996_s_f,dm_1997_s_f,dm_1998_s_f,dm_1999_s_f,dm_2000_s_f,dm_2001_s_f,...
    dm_2002_s_f,dm_2003_s_f,dm_2004_s_f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load final data for sediment transport analysis
load('/home/profdam/Documents/PhD Project/Sediment Transport/Figures Sediment Transport/hs_dm_tm_final_data.mat')
%% Flip wave height
hs_a_f=flipud(hs_a_f);
hs_w_f=flipud(hs_w_f);
hs_s_f=flipud(hs_s_f);

%% Calculate directions relative to the north for coast

%global loop to compute hs gradients
%ANGLE=[]; ANGG=[]; 
angg=[];
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
    
%ANGG=[ANGG ang_coast];

if ang_coast<0
%ANG=(ang_coast+360)-dm_f(i);
ang=abs(ang_coast)+270;
else
    %ANG=abs((ang_coast)-dm_f(i));
    ang=90-ang_coast;

end
angg=[angg ang];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end


%% Calculate directions relative to the north for wave direction (AANUAL AVERAGE)

%ANGLE=ANGLE';
abcc=[];
for i=1:26
if dm_a_f(:,i)<180 & dm_a_f(:,i)>90
    abb=dm_a_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_a_f(:,i)>180 & dm_a_f(:,i)<270
    abb=(dm_a_f-180);
else
    abb=(dm_a_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)
Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:26
    tm_f=tm_a_f(:,j);
    hs_f=hs_a_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
Thetab_f=[Thetab_f Thetab_a];
Hb_f=[Hb_f;Hb_a];
hb_f=[hb_f;hb_a];
R_f=[R_f;R_a];
S_f=[S_f;S_a];
V_f=[V_f;V_a];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q=transport./conversion;


%% Plot annual LST average
z=nanmean(Q,1);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
m_proj('mercator','longitude',[-11 21],'latitude',[-21 21]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
%m_names
m_scatter(lon_f,lat_f,60,z,'filled'); %shading flat;
m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Annaual average of Longshore Sediment Transport between 1979-2004 in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0


%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
%% Calculate directions relative to the north for wave direction (WINTER AVERAGE)

%ANGLE=ANGLE';
abcc=[];
for i=1:26
if dm_w_f(:,i)<180 & dm_w_f(:,i)>90
    abb=dm_w_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_w_f(:,i)>180 & dm_w_f(:,i)<270
    abb=(dm_w_f-180);
else
    abb=(dm_w_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)
Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:26
    tm_f=tm_w_f(:,j);
    hs_f=hs_w_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_w(i)=Thetab;
Hb_w(i)=Hb;
hb_w(i)=hb;
R_w(i)=R;
S_w(i)=S;
V_w(i)=V;
end
Thetab_f=[Thetab_f Thetab_w];
Hb_f=[Hb_f;Hb_w];
hb_f=[hb_f;hb_w];
R_f=[R_f;R_w];
S_f=[S_f;S_w];
V_f=[V_f;V_w];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q=transport./conversion;


%% Plot annual LST average
z=nanmean(Q,1);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
m_proj('mercator','longitude',[-11 21],'latitude',[-21 21]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
m_names
m_scatter(lon_f,lat_f,60,z,'filled'); %shading flat;
m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Winter average of Longshore Sediment Transport between 1979-2004 in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0


%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
%% Calculate directions relative to the north for wave direction (WINTER AVERAGE)

%ANGLE=ANGLE';
abcc=[];
for i=1:26
if dm_s_f(:,i)<180 & dm_s_f(:,i)>90
    abb=dm_s_f(:,i)+180;
%abb=abs((dm_f-90))+270;
elseif dm_s_f(:,i)>180 & dm_s_f(:,i)<270
    abb=(dm_s_f-180);
else
    abb=(dm_s_f(:,i)-180);
    %abb=abs((dm_f-270))+90;
end
abb=abs(abb);
abc=abs(angg'-abb);
abcc=[abcc abc];
end  


%% Calculate Longshore Sediment Transport (ANNUAL AVERAGE)
Thetab_f=[];
Hb_f=[];
hb_f=[];
R_f=[];
S_f=[];
V_f=[];
for j=1:26
    tm_f=tm_s_f(:,j);
    hs_f=hs_s_f(:,j);
    abc=abcc(:,j);
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm_f(i),hs_f(i),abc(i));
    
Thetab_s(i)=Thetab;
Hb_s(i)=Hb;
hb_s(i)=hb;
R_s(i)=R;
S_s(i)=S;
V_s(i)=V;
end
Thetab_f=[Thetab_f Thetab_s];
Hb_f=[Hb_f;Hb_s];
hb_f=[hb_f;hb_s];
R_f=[R_f;R_s];
S_f=[S_f;S_s];
V_f=[V_f;V_s];
end

%Calculate omega and transport
omega=Hb_f.^2.*V_f;

% transport longshore 
if omega <0.15
    transport = 0.023.*(omega);%% %% p�riodes calmes
else 
    transport = 0.00225 + (0.008.*(omega)); %% p�riodes de tempete
end

% Concert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q=transport./conversion;


%% Plot annual LST average
figure
z=nanmean(Q,1);
cmin=-14*10^5; cmax=8*10^5; int=1*10^5; n= round((cmax-cmin)/int);
%lon1=linspace(-20,20,81);
%lat1=linspace(-20,20,81);
%[X Y]=meshgrid(lon1,lat1);
%z11=griddata(double(Xlong),double(Ylat),z',X,Y);
m_proj('mercator','longitude',[-11 21],'latitude',[-21 21]);
%m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%shading flat;
m_usercoast('coast_name','color','k','linewidth',2);
%labelbordersm
hold on
m_names
m_scatter(lon_f,lat_f,60,z,'filled'); %shading flat;
m_coast('line','color',[0.5 0.5 0.5],'linewidth',2);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
cb =colorbar
%cb =colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax)
%cb.Ruler.Scale = 'log';
%cb.Ruler.MinorTick = 'on';
caxis([cmin cmax])
%set(gca,'ColorScale','log')
set(get(cb,'label'),'string','Longshore sediment transport (m^3 per year)');
title('Summer average of Longshore Sediment Transport between 1979-2004 in the GoG','FontSize',9,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',5,'FontName','Times News Roman','FontWeight','Bold');
%Bias of Historical Significant Wave Height between ERA5 & ACCESS1.0










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
cmin=-14 ;%min(Q) %-14*10^4; 
cmax=8; %max(Q) %8*10^4; 
int=1; n= round((cmax-cmin)/int);

figure;
worldmap([-5 20],[-8 20])
scatterm(lat_f,lon_f,50,nanmean(Q,1),'filled');%colorbar; Q(10,:)
colormap(jet(n)); 
hold on
bordersm
labelbordersm
clb=colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax);
caxis([cmin cmax]);
set(get(clb,'label'),'string','Longshore sediment transport (x10^5 m^3 per year)');


%% Trend analysis
tr = trend(Q,1); %tr=tr*365.25;
significant = mann_kendall(Q); % (may take a second)

cmin=-14 ;%min(Q) %-14*10^4; 
cmax=6; %max(Q) %8*10^4; 
int=1; n= round((cmax-cmin)/int);

figure;
worldmap([-5 20],[-8 20])
scatterm(lat_f,lon_f,50,tr,'filled');%colorbar; Q(10,:)
colormap(jet(n)); 
hold on
bordersm
labelbordersm
clb=colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax);
caxis([cmin cmax]);
set(get(clb,'label'),'string','Longshore sediment transport (x10^2 m^3 per year)');

%%

globeimage
hold on
globescatter(lat_f,lon_f,50,Q_hist(1,:),'filled');colorbar;
hold on
globeborders

%%
lonf=lon_f-1; latf=lat_f-1
inp =1; 
figure
m_proj('mercator','lon',[-20-inp 20+inp],'lat',[-20-inp 20+inp])
m_scatter(lonf,latf,70,dm_f','fill')
colormap('jet')
colorbar
cmin=min(dm_f);
cmax=max(dm_f);
caxis([cmin cmax]);
m_coast('patch',[.6 .6 .6])
% m_gshdm_i('patch',[.5 .5 .5],'edgecolor','black','linewidth',1);
m_grid('box','on')
title('HS')
xlabel('Longitude')
ylabel('Latitude')
 
%%

z=dm_2004;
cmin=min(min(dm_2004)); cmax=max(max(dm_2004)); int=0.1; n= round((cmax-cmin)/int);
[X Y]=meshgrid(double(Xlong),double(Ylat));
z11=griddata(double(Xlong),double(Ylat),z',X,Y);
%m_proj('mercator','longitude',[-20 20],'latitude',[-20 20]);
m_proj('miller','lat',[-20 20],'lon',[-20 20]);% GoG lat and lon
hold on
m_pcolor(X,Y,z11); shading flat;
m_contour(X,Y,z11,cmin:int:cmax,'LineStyle','-','LineWidth',1);
%m_stipple(X,Y,significant');
m_gshdm_h('patch',[0.5 0.5 0.5])
%m_usercoast('coast_name','color','k','linewidth',2);
m_coast('line','color',[0.5 0.5 0.5],'linewidth',6);
m_grid('box','fancy','tickdir','in','xtick',(-15:5:20),'ytick',(-15:5:20),'fontsize',7,'fontweight','bold');
%m_grid('linewi',1,'linest','none','tickdir','out','fontsize',7);% box style
axis equal tight
%cmin=0.5; cmax=2.5; int=0.1; n= (cmax-cmin)/int;
colormap(jet(n)); 
%colorbar('ytick',cmin:1*int:cmax)
clb=colorbar('xtick',cmin:2*int:cmax,'xticklabel',cmin:2*int:cmax);
caxis([cmin cmax]);
set(get(clb,'label'),'string','Chl A (mg.m^-^3 per year)');
%inflon1=-8;suplon1=9;inflat1=-5;suplat1=10;
%m_line([inflon1 suplon1 suplon1 inflon1 inflon1],[inflat1 inflat1 suplat1 suplat1 inflat1],'color','r','linestyle','-','linewidth',2);
title('Winter Mean Chl-Level in the GoG between 1993-2020','FontSize',13,'FontName','Times News Roman','FontWeight','Bold');
xlabel('Longitude','FontSize',13,'FontName','Times News Roman','FontWeight','Bold');
ylabel('Latitude','FontSize',13,'FontName','Times News Roman','FontWeight','Bold');



