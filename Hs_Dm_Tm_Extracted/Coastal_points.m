%% Extract Useful coastal points and save
load('/home/profdam/Downloads/INPUT_DATA/Coastal_reformed.mat')
lonx_cotei = LONX_COTEB; %ncst(:,1); %LONX_COTEB;
latx_cotei = LATX_COTEB; %ncst(:,2); %LATX_COTEB; 
lonx_coteind=find(lonx_cotei<=20 & lonx_cotei>=-20 & latx_cotei <=20 & latx_cotei >=-20);
lonx_cote=lonx_cotei(lonx_coteind);
latx_cote=latx_cotei(lonx_coteind);



load('/home/profdam/Documents/PhD Project/Scripts/Adapted/Final_hs_tm_dm_select1.mat', 'lat_f', 'lon_f');

indd=[];
for i=1:length(lat_f)
    ind=find(lonx_cote==lon_f(i) & latx_cote==lat_f(i));
    if length(ind)>1
        ind=ind(1);
    end
    indd=[indd ind];
end
