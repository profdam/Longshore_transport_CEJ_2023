%% Load selected ensemble data: hist
clc;clear;
load('D:\Linux_2_Windows\Sediment Transport\Scripts_data\Selected_yearly_Hist_1.mat')

%%
coastline=[];
for i=1:length(lon_f)

    if i<(length(lon_f)-3)
        lat = [lat_f(i:i+3)]; 
        lon = [lon_f(i:i+3)];
    else
        lat = [lat_f(i-3:i)]; 
        lon = [lon_f(i-3:i)];
    end
% Convert coordinates to UTM
[utm_x, utm_y, zone] = deg2utm(lat, lon);

% Find centroid
centroid_x = mean(utm_x);
centroid_y = mean(utm_y);

% Calculate orientation
theta = atan2(utm_y - centroid_y, utm_x - centroid_x) * 180 / pi;

% Adjust for negative angles
theta(theta < 0) = 360 + theta(theta < 0);

% Find maximum and minimum angles
theta_max = max(theta);
theta_min = min(theta);
coast=theta_max - theta_min;
coastline=[coastline, coast];
end
%%
% Define variables
wave_dir = nanmean(dm_a,2); % wave direction in degrees (measured clockwise from North)
coast_dir = coastline'; % coastline orientation in degrees (measured clockwise from North)

% Calculate angle of wave approach relative to coastline
theta = wrapTo360(wave_dir - coast_dir);

%%
% Define variables
coastline_theta = coastline'; % orientation of the coastline in degrees
wave_dir = nanmean(dm_a,2); % direction of the wave in degrees

% Calculate angle of wave approach relative to coastline
wave_approach = mod(wave_dir - coastline_theta, 360);
if wave_approach > 180
    wave_approach = wave_approach - 360;
end
%%
% Define variables
H = nanmean(hs_a,2); % significant wave height in meters
T = nanmean(tm_a,2); % peak wave period in seconds
theta = wave_approach; % angle of wave approach in degrees
D = 2; % water depth in meters
Q = 100; % sediment supply rate from river discharge in m^3/s

% Convert angle to radians
theta = deg2rad(theta);

% Calculate wave energy flux
g = 9.81; % acceleration due to gravity in m/s^2
E = 0.5.*g.*(H.^2).*T;

% Calculate sediment transport rates using CERC, Bayram, and Kamphuis equations
C_b = 0.008; % sediment transport coefficient for Bayram equation
alpha_b = 1.5; % empirical coefficient for Bayram equation
beta_b = 2.0; % empirical coefficient for Bayram equation
HT=H.*T;
q_b = C_b*alpha_b*((HT).^beta_b).*sin(theta).*(D^(5/2)).*(E.^(1/2)); % Bayram equation

C1 = 0.53; % CERC coefficient
C2 = 0.55; % CERC coefficient
q_c = C1 * H^(5/2) * T * sin(theta) * D^(3/2) / (1 + C2 * (H / D)^(3/2)); % CERC equation

C_k = 0.5; % sediment transport coefficient for Kamphuis equation
q_k = C_k * (H * T)^2 * sin(theta) * D * sqrt((H / D)^3 * g / T); % Kamphuis equation

q_total = q_b + q_c + q_k + Q; % total sediment transport rate including river discharge

% Display results
disp(['Sediment transport rate using Bayram equation (kg/m/s) = ', num2str(q_b)])
disp(['Sediment transport rate using CERC equation (kg/m/s) = ', num2str(q_c)])
disp(['Sediment transport rate using Kamphuis equation (kg/m/s) = ', num2str(q_k)])
disp(['Total sediment transport rate including river discharge (kg/m/s) = ', num2str(q_total)])


%%
% Define coastline coordinates (longitude, latitude)
lon = [23.0 23.2 23.4 23.6 23.8];
lat = [40.5 40.8 41.0 41.2 41.4];

% Convert coordinates to UTM (Universal Transverse Mercator) projection
[utm_x, utm_y, ~] = deg2utm(lat, lon);

% Calculate line of best fit using linear regression
p = polyfit(utm_x, utm_y, 1);

% Calculate angle of coastline orientation
theta = atan(p(1)) * 180 / pi;
disp(['Coastline orientation (degrees) = ', num2str(theta)])