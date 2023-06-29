data = csvread('final points.csv', 1, 0);
latitude = data(:, 2);
longitude = data(:, 3);
figure
geobasemap('bluegreen')
geoplot(latitude, longitude, 'r.')
geolimits('auto')
geobasemap('bluegreen')

shapefile = 'Pantanal.shp';
S = shaperead(shapefile);
info = shapeinfo(shapefile);

hold on
geoplot(x, y, 'k', 'LineWidth', 1);
hold off

ax = gca; % Get the current axes (geoaxes)
latLim = [-60, 15]; 
lonLim = [-90, -30];

% Set the latitude and longitude limits
ax.XLim = lonLim;
ax.YLim = latLim;

ax.XAxis.TickValues = []; % Remove x-axis tick values
ax.YAxis.TickValues = []; % Remove y-axis tick values

xlabel('Longitude', 'FontSize', 12)
ylabel('Latitude', 'FontSize', 12)


