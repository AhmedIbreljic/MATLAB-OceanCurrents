% Plotting velocity vectors and magnitude for March 2, 2018
% Before running this script,
% 1. Move/incorporate the m_map1.4 folder and its subfolders into your MATLAB search path. 
% https://www.mathworks.com/help/matlab/matlab_env/what-is-the-matlab-search-path.html 
% https://www.mathworks.com/help/matlab/ref/addpath.html
% 2. Load the LAT, LON, UX_Ocurrent, VY_Ocurrent MAT files
load(
'C:\Users\User\Downloads\Project_4_ENGIN211L_data_m_map\DATA\MATLAB DATA\LAT.mat'
)
load(
'C:\Users\User\Downloads\Project_4_ENGIN211L_data_m_map\DATA\MATLAB DATA\LON.mat'
)
load(
'C:\Users\User\Downloads\Project_4_ENGIN211L_data_m_map\DATA\MATLAB DATA\UX_Ocurrent.mat'
)
load(
'C:\Users\User\Downloads\Project_4_ENGIN211L_data_m_map\DATA\MATLAB DATA\VY_Ocurrent.mat'
)
% ENGIN 211L Vector Calculus MATLAB project, GPGP Final Project 
% plotting March 2, 2018
day = 4;
hold on
lon_range = 850:1000;
lat_range = 210:400;
LON_sm = LON(lon_range, lat_range);
LAT_sm = LAT(lon_range, lat_range);
u = UX_Ocurrent(lon_range, lat_range, 1);
v = VY_Ocurrent(lon_range, lat_range, 1);
speed = sqrt(u.^2 + v.^2); 
max_sp = max(max(
(u.^2+v.^2)
.^(1/2)
)
); % max speed
m_proj(
'miller',
'lon',
[min(min(LON_sm)
) max(max(LON_sm)
)
],
.
.
.
 
'lat',
[min(min(LAT_sm)
) max(max(LAT_sm)
)
]
);
m_coast(
'patch',
[.8 .8 .8]
);
% Magnitude plot (speed)
: These contour plot settings are not good on
% purpose. Make better choices so that your plot is more legible and
% effective.
[CS,CH] = m_contourf(LON_sm,LAT_sm,speed,
(0.001:0.001:max_sp),
'edgecolor',
'none'
);
% Velocity arrows: These quiver settings are not good on
% purpose. Make better choices so that your plot is more legible and
% effective.
%m_quiver(LON,LAT,UX_Ocurrent(:,
:,1),VY_Ocurrent(:,
:,1)
); 
m_quiver(LON_sm, LAT_sm, u,v); 
m_grid(
'box',
'fancy',
'tickdir',
'out', 'fontsize', 14);
title(
'Ocean Surface Currents: March 18, 2018', 'fontsize', 16);
colormap(m_colmap(
'Jet',
'step',4)
)
h_cbar = colorbar
set(gca, 'Fontsize', 16)
set(get(h_cbar, 'title'
),
'string',
'm/s',
'Fontsize', 16);
%% Divergence 
divUV = divergence(u,v); 
figure
m_proj(
'miller', 'lon',
[min(min(LON_sm)
) max(max(LON_sm)
)
],
.
.
.
 
'lat',
[min(min(LAT_sm)
) max(max(LAT_sm)
)
]
);
m_coast(
'patch', [.8 .8 .8]
);
hold on
[CS,CH] = m_contourf(LON_sm,LAT_sm,divUV,
.
.
.
 
(-0.2:0.005:0.2),
'edgecolor',
'none'
);
%m_grid(
'box',
'fancy',
'tickdir',
'out', 'fontsize', 14);
m_quiver(LON_sm, LAT_sm, u,v)
title(
'Ocean Surface Divergence (qualitative)
: March 18, 2018', 'fontsize', 16);
colormap(m_colmap(
'Jet',
'step',4)
)
h_cbar = colorbar;
set(gca,
'Fontsize', 16) 
%% Curl 
curlUV = curl(u,v); 
figure
m_proj(
'miller', 'lon',
[min(min(LON_sm)
) max(max(LON_sm)
)
],
.
.
.
 
'lat',
[min(min(LAT_sm)
) max(max(LAT_sm)
)
]
);
m_coast(
'patch', [.8 .8 .8]
);
hold on
[CS,CH] = m_contourf(LON_sm,LAT_sm,curlUV,
(-0.05:0.001:0.05),
'edgecolor',
'none'
);
m_quiver(LON_sm, LAT_sm, u,v)
% m_grid(
'box',
'fancy',
'tickdir',
'out', 'fontsize', 14);
title(
'Ocean Surface Curl (qualitative)
: March 18, 2018', 'fontsize', 16);
colormap(m_colmap(
'Jet',
'step',4)
)
h_cbar = colorbar;
set(gca,
'Fontsize', 16) 
