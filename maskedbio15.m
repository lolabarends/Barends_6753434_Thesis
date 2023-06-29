%bio15
% Load the map images for future scenarios
bioclimatic_data2615 = imread('mc26bi5015.tif');
bioclimatic_data4515 = imread('mc45bi5015.tif');
bioclimatic_data8515 = imread('mc85bi5015.tif');

% Resize images
BIO2615 = double(bioclimatic_data2615);
BIO4515 = double(bioclimatic_data4515);
BIO8515 = double(bioclimatic_data8515);

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
ymin = -60 + 1/48;
ymax = 90 - 1/48;

[X, Y] = meshgrid(xmin:gridSize:xmax, ymax:-gridSize:ymin);
mask = NaN(size(X)); % Initialize mask with NaN values
inPolygon = inpolygon(X, Y, x, y);
mask(inPolygon) = 0; % Set the area inside the polygon to 0

basemapBIO2615 = rescaledprecipitationseasonalitymap26;
maskedBasemapBIO2615 = basemapBIO2615;
maskedBasemapBIO2615(isnan(mask)) = NaN;

basemapBIO4515 = rescaledprecipitationseasonalitymap45;
maskedBasemapBIO4515 = basemapBIO4515;
maskedBasemapBIO4515(isnan(mask)) = NaN;

basemapBIO8515 = rescaledprecipitationseasonalitymap85;
maskedBasemapBIO8515 = basemapBIO8515;
maskedBasemapBIO8515(isnan(mask)) = NaN;

% Create a figure for the subplots
figure;

% Plot Pantanal 1 future - Scenario 2.6
subplot('Position', [0.05, 0.54, 0.2, 0.4]);
h2615 = imagesc(X(1,:), Y(:,1), maskedBasemapBIO2615);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata2615 = ~isnan(maskedBasemapBIO2615);
set(h2615, 'AlphaData', alphadata2615);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'a', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 2 future - Scenario 4.5
subplot('Position', [0.30, 0.54, 0.2, 0.4]);
h4515 = imagesc(X(1,:), Y(:,1), maskedBasemapBIO4515);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata4515 = ~isnan(maskedBasemapBIO4515);
set(h4515, 'AlphaData', alphadata4515);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'b', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 8 future - Scenario 8.5
subplot('Position', [0.55, 0.54, 0.2, 0.4]);
h8515 = imagesc(X(1,:), Y(:,1), maskedBasemapBIO8515);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata8515 = ~isnan(maskedBasemapBIO8515);
set(h8515, 'AlphaData', alphadata8515);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'c', 'FontSize', 16, 'FontWeight', 'bold');

set(gcf, 'Position', [100, 100, 800, 800]);
% Add a common colorbar
cbar = colorbar('Position', [0.78, 0.54, 0.02, 0.4], 'FontSize', 12);
cbar.Title.String = 'Habitat Suitability';