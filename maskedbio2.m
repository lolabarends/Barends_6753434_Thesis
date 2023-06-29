% Load the map images for future scenarios
bioclimatic_data262 = imread('mc26bi502.tif');
bioclimatic_data452 = imread('mc45bi502.tif');
bioclimatic_data852 = imread('mc85bi502.tif');

% Resize images
BIO262 = double(bioclimatic_data262);
BIO262 = BIO262/10;
BIO452 = double(bioclimatic_data452);
BIO452 = BIO452/10;
BIO852 = double(bioclimatic_data852);
BIO852 = BIO852/10;

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

basemapBIO262 = rescaledmeandiurnalrangemap26;
maskedBasemapBIO262 = basemapBIO262;
maskedBasemapBIO262(isnan(mask)) = NaN;

basemapBIO452 = rescaledmeandiurnalrangemap45;
maskedBasemapBIO452 = basemapBIO452;
maskedBasemapBIO452(isnan(mask)) = NaN;

basemapBIO852 = rescaledmeandiurnalrangemap85;
maskedBasemapBIO852 = basemapBIO852;
maskedBasemapBIO852(isnan(mask)) = NaN;


% Create a figure for the subplots
figure;

% Plot Pantanal 1 future - Scenario 2.6
subplot('Position', [0.05, 0.54, 0.2, 0.4]);
h262 = imagesc(X(1,:), Y(:,1), maskedBasemapBIO262);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata262 = ~isnan(maskedBasemapBIO262);
set(h262, 'AlphaData', alphadata262);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'a', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 2 future - Scenario 4.5
subplot('Position', [0.30, 0.54, 0.2, 0.4]);
h452 = imagesc(X(1,:), Y(:,1), maskedBasemapBIO452);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata452 = ~isnan(maskedBasemapBIO452);
set(h452, 'AlphaData', alphadata452);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'b', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 8 future - Scenario 8.5
subplot('Position', [0.55, 0.54, 0.2, 0.4]);
h852 = imagesc(X(1,:), Y(:,1), maskedBasemapBIO852);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata852 = ~isnan(maskedBasemapBIO852);
set(h852, 'AlphaData', alphadata852);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'c', 'FontSize', 16, 'FontWeight', 'bold');

set(gcf, 'Position', [100, 100, 800, 800]);
% Add a common colorbar
cbar = colorbar('Position', [0.78, 0.54, 0.02, 0.4], 'FontSize', 12);
cbar.Title.String = 'Habitat Suitability';