% Load the map image
bioclimatic_datanow1 = imread('wc2.1_2.5m_bio_1.tif');
bioclimatic_datanow2 = imread('wc2.1_2.5m_bio_2.tif');
bioclimatic_datanow8 = imread('wc2.1_2.5m_bio_8.tif');
bioclimatic_datanow15 = imread('wc2.1_2.5m_bio_15.tif');
BIOnow1 = bioclimatic_datanow1;
BIOnow2 = bioclimatic_datanow2;
BIOnow8 = bioclimatic_datanow8;
BIOnow15 = bioclimatic_datanow15;

% Load and create the mask
shapefile = 'Pantanal.shp';
S = shaperead(shapefile);
info = shapeinfo('Pantanal.shp');

% unit is in meter, not degrees; the code below converts to degrees
minX = S(1,:).BoundingBox(1,1); % point of lowest longitude in BoundingBox
minXdeg = km2deg(minX/1000); % from km to degree
dist_minX = km2deg((S(1,:).X-minX)./1000); % distance to minX from m to deg
x = minXdeg + dist_minX; % all longitudinal points in degree
minY = S(1,:).BoundingBox(1,2); % point of lowest latitude in BoundingBox
minYdeg = km2deg(minY/1000); % from km to degree
dist_minY = km2deg((S(1,:).Y-minY)./1000); % distance to minY from m to deg
y = minYdeg + dist_minY; % all latitudinal points in degree

gridSize = 1/24;
xmin = -180 + 1/48;
xmax = 180 - 1/48;
ymin = -90 + 1/48;
ymax = 90 - 1/48;

[X, Y] = meshgrid(xmin:gridSize:xmax, ymax:-gridSize:ymin);
mask = NaN(size(X)); % Initialize mask with NaN values
inPolygon = inpolygon(X, Y, x, y);
mask(inPolygon) = 0; % Set the area inside the polygon to 0

basemapBIOnow1 = rescaledannualmeantemperaturemap;
maskedBasemapBIOnow1 = basemapBIOnow1;
maskedBasemapBIOnow1(isnan(mask)) = NaN;

basemapBIOnow2 = rescaledmeandiurnalrangemap;
maskedBasemapBIOnow2 = basemapBIOnow2;
maskedBasemapBIOnow2(isnan(mask)) = NaN;

basemapBIOnow8 = rescaledwettestquartertemperature;
maskedBasemapBIOnow8 = basemapBIOnow8;
maskedBasemapBIOnow8(isnan(mask)) = NaN;

basemapBIOnow15 = rescaledprecipitationseasonalitymap;
maskedBasemapBIOnow15 = basemapBIOnow15;
maskedBasemapBIOnow15(isnan(mask)) = NaN;

basemapBIOnowcombined = suitability_map_combined_scaledcurrent;
maskedBasemapBIOnowcombined = basemapBIOnowcombined;
maskedBasemapBIOnowcombined(isnan(mask)) = NaN;

% Create a figure for the subplots
figure;

% Plot Pantanal 1 current
subplot('Position', [0.08, 0.54, 0.2, 0.4]);
h1 = imagesc(X(1,:), Y(:,1), maskedBasemapBIOnow1);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo); % Set the desired colormap (e.g., turbo)
clim([0 1]); % Set the color scale range from 0 to 1
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata1 = ~isnan(maskedBasemapBIOnow1);
set(h1, 'AlphaData', alphadata1);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'a', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 2 current
subplot('Position', [0.35, 0.54, 0.2, 0.4]);
h2 = imagesc(X(1,:), Y(:,1), maskedBasemapBIOnow2);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo); % Set the desired colormap (e.g., turbo)
clim([0 1]); % Set the color scale range from 0 to 1
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata2 = ~isnan(maskedBasemapBIOnow2);
set(h2, 'AlphaData', alphadata2);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'b', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 8 current
subplot('Position', [0.08, 0.08, 0.2, 0.4]);
h8 = imagesc(X(1,:), Y(:,1), maskedBasemapBIOnow8);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo); % Set the desired colormap (e.g., turbo)
clim([0 1]); % Set the color scale range from 0 to 1
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata8 = ~isnan(maskedBasemapBIOnow8);
set(h8, 'AlphaData', alphadata8);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'c', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 15 current
subplot('Position', [0.35, 0.08, 0.2, 0.4]);
h15 = imagesc(X(1,:), Y(:,1), maskedBasemapBIOnow15);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo); % Set the desired colormap (e.g., turbo)
clim([0 1]); % Set the color scale range from 0 to 1
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata15 = ~isnan(maskedBasemapBIOnow15);
set(h15, 'AlphaData', alphadata15);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'd', 'FontSize', 16, 'FontWeight', 'bold');

set(gcf, 'Position', [100, 100, 800, 800]);
% Add a common colorbar
cbar = colorbar('Position', [0.6, 0.15, 0.02, 0.7], 'FontSize', 12);
cbar.Title.String = 'Habitat Suitability';

figure;
hcombined = imagesc(X(1,:), Y(:,1), maskedBasemapBIOnowcombined);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo); % Set the desired colormap (e.g., turbo)
clim([0 1]); % Set the color scale range from 0 to 1
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hcb15 = colorbar;
hcb15.Title.String = 'Habitat Suitability';
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadatacombined = ~isnan(maskedBasemapBIOnowcombined);
set(hcombined, 'AlphaData', alphadatacombined);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'Present', 'FontSize', 10, 'FontWeight', 'bold');
