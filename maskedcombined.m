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

basemapBIO26all = suitability_map_combined_scaled26;
maskedBasemapBIO26all = basemapBIO26all;
maskedBasemapBIO26all(isnan(mask)) = NaN;

basemapBIO45all = suitability_map_combined_scaled45;
maskedBasemapBIO45all = basemapBIO45all;
maskedBasemapBIO45all(isnan(mask)) = NaN;

basemapBIO85all = suitability_map_combined_scaled85;
maskedBasemapBIO85all = basemapBIO85all;
maskedBasemapBIO85all(isnan(mask)) = NaN;

% Create a figure for the subplots
figure;

% Plot Pantanal 1 future - Scenario 2.6
subplot('Position', [0.05, 0.54, 0.2, 0.4]);
h26all = imagesc(X(1,:), Y(:,1), maskedBasemapBIO26all);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata26all = ~isnan(maskedBasemapBIO26all);
set(h26all, 'AlphaData', alphadata26all);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'a', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 2 future - Scenario 4.5
subplot('Position', [0.30, 0.54, 0.2, 0.4]);
h45all = imagesc(X(1,:), Y(:,1), maskedBasemapBIO45all);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata45all = ~isnan(maskedBasemapBIO45all);
set(h45all, 'AlphaData', alphadata45all);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'b', 'FontSize', 16, 'FontWeight', 'bold');

% Plot Pantanal 8 future - Scenario 8.5
subplot('Position', [0.55, 0.54, 0.2, 0.4]);
h85all = imagesc(X(1,:), Y(:,1), maskedBasemapBIO85all);
set(gca, 'YDir', 'normal');
axis equal;
colormap(turbo);
clim([0 1]);
xlabel('Longitude', 'FontSize', 14);
ylabel('Latitude', 'FontSize', 14);
hold on;
plot(x, y, 'k', 'LineWidth', 0.5);
hold off;
alphadata85all = ~isnan(maskedBasemapBIO85all);
set(h85all, 'AlphaData', alphadata85all);
xlim([-60.7 -53.7])
ylim([-23.5 -15.3])
text(-60, -16, 'c', 'FontSize', 16, 'FontWeight', 'bold');

set(gcf, 'Position', [100, 100, 800, 800]);
% Add a common colorbar
cbar = colorbar('Position', [0.78, 0.54, 0.02, 0.4], 'FontSize', 12);
cbar.Title.String = 'Habitat Suitability';