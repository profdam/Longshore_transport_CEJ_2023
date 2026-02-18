angg=[];
for i=1:length(lon_f)
    
defind=i;
Mr=1; %Radius of the circle (in Â°) to select the coastline which direction will be estimated

shoreind=find(sqrt((lon_f-lon_f(defind)).*(lon_f-lon_f(defind))...
        +(lat_f-lat_f(defind)).*(lat_f-lat_f(defind)))<Mr);

lonx_cote_sel=lon_f(shoreind);
latx_cote_sel=lat_f(shoreind);

  p=polyfit(lonx_cote_sel,latx_cote_sel,1);
    coast_fit=polyval(p,lonx_cote_sel); %invCoast_fit=1/coast_fit;
    ang_coast=atand(p(1));
    
%ANGG=[ANGG ang_coast];

% if ang_coast<0
% %ANG=(ang_coast+360)-dm_f(i);
% ang=abs(ang_coast)+270;
% else
%     %ANG=abs((ang_coast)-dm_f(i));
%     ang=90-ang_coast;
% 
% end
angg=[angg ang_coast];
%ANGLE=[ANGLE ANG];

%     lonx_norm=[-2 2]*cosd(ang_coast+90)+lonx_cote_reg(defind);
 %   laty_norm=[-2 2]*sind(ang_coast+90)+latx_cote_reg(defind);
end

%%
for i=1:45
if i==1 | i<=3
    abb_a(i)=-angg(i)-90;
elseif i==4
    abb_a(i)=angg(i)-90;
elseif i==5 | i<=8
    abb_a(i)=-angg(i)-90;
elseif i==9 | i<=12
    abb_a(i)=angg(i)-90;
elseif i==13 | i<=17
    abb_a(i)=angg(i)+90;
    %abb_a(i)=(90-angg(i))+90;
elseif i==18 | i<=23
    abb_a(i)=angg(i)-90;
elseif i==24 | i<=34
    abb_a(i)=angg(i)+90;
elseif i==35 | i<=38
    abb_a(i)=angg(i)-90;
else
    abb_a(i)=angg(i)+90;
end
end



%%
for i=1:45
    
if abb_a(i)<0
   abb_b(i)=abs(abb_a(i))-dm(i);
else
   abb_b(i)=dm(i)-abb_a(i);
end
end

%%
for i=1:length(lon_f)
    [Thetab,Hb,hb,R,S,V]=Larson2010(tm(i),hs(i),abb_b(i));
    
Thetab_a(i)=Thetab;
Hb_a(i)=Hb;
hb_a(i)=hb;
R_a(i)=R;
S_a(i)=S;
V_a(i)=V;
end
%%

% [Thetab,Hb,hb,R,S,V]=Larson2010(8.66,0.38,-55.59);
% omega_a=Hb.^2.*V;


%Calculate omega and transport
for i=1:45
omega_a(i)=Hb_a(i).^2.*V_a(i);
end
 
for i=1:45
if omega_a(i) <0.15
    transport_a(i) = 0.023.*(omega_a(i));%% %% p�riodes calmes
else 
    transport_a(i) = 0.00225 + (0.008.*(omega_a(i))); %% p�riodes de tempete
end
end
% Convert transport to per year
% 1s=(1/2678400)mois
conversion=1/31536000; %2678400;
Q_hist_a=transport_a./conversion;


