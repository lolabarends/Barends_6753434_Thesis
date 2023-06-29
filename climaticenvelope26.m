%this is the habitat suitability of the giant otter for the whole world for
%RCP2.6
bioclimatic_data261 = imread('mc26bi501.tif');
bioclimatic_data262 = imread('mc26bi502.tif');
bioclimatic_data268 = imread('mc26bi508.tif');
bioclimatic_data2615 = imread('mc26bi5015.tif');
% Resize images
BIO261 = double(bioclimatic_data261);
BIO261 = BIO261/10;
BIO262 = double(bioclimatic_data262);
BIO262 = BIO262/10;
BIO268 = double(bioclimatic_data268);
BIO268 = BIO268/10;
BIO2615 = double(bioclimatic_data2615);

% Plot 1st graph - Annual Mean Temperature 2.6
figure;
annual_mean_temperature_suitability_map_26 = gauss(BIO261, 26.2720, 0.7351);
rescaledannualmeantemperaturemap26 = rescale(annual_mean_temperature_suitability_map_26, 0, 1);
imagesc(rescaledannualmeantemperaturemap26);
colorbar;
axis image;

% Plot 2nd graph - Mean Diurnal Range 2.6
figure;
mean_diurnal_range_suitability_map_26 = gauss(BIO262, 9.6184, 2.1332);
rescaledmeandiurnalrangemap26 = rescale(mean_diurnal_range_suitability_map_26, 0, 1);
imagesc(rescaledmeandiurnalrangemap26);
colorbar;
axis image;

% Plot 3rd graph - Temperature of Wettest Quarter 2.6
figure;
temperature_wettest_quarter_suitability_map_26 = gauss(BIO268, 26.4211, 0.9260);
rescaledwettestquartertemperaturemap26 = rescale(temperature_wettest_quarter_suitability_map_26, 0, 1);
imagesc(rescaledwettestquartertemperaturemap26);
colorbar;
axis image;

% Plot 4th graph - Precipitation Seasonality 2.6
figure;
precipitation_seasonality_suitability_map_26 = gauss(BIO2615, 56.1444, 15.2501);
rescaledprecipitationseasonalitymap26 = rescale(precipitation_seasonality_suitability_map_26, 0, 1);
imagesc(rescaledprecipitationseasonalitymap26);
colorbar;
axis image;