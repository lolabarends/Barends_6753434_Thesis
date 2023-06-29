%this is the habitat suitability of the giant otter for the whole world
%for RCP4.5
bioclimatic_data451 = imread('mc45bi501.tif');
bioclimatic_data452 = imread('mc45bi502.tif');
bioclimatic_data458 = imread('mc45bi508.tif');
bioclimatic_data4515 = imread('mc45bi5015.tif');
% Resize images
BIO451 = double(bioclimatic_data451);
BIO451 = BIO451/10;
BIO452 = double(bioclimatic_data452);
BIO452 = BIO452/10;
BIO458 = double(bioclimatic_data458);
BIO458 = BIO458/10;
BIO4515 = double(bioclimatic_data4515);

% Plot 1st graph - Annual Mean Temperature 4.5
figure;
annual_mean_temperature_suitability_map_45 = gauss(BIO451,26.2720, 0.7351);
rescaledannualmeantemperaturemap45 = rescale(annual_mean_temperature_suitability_map_45, 0, 1);
imagesc(rescaledannualmeantemperaturemap45);
colorbar;
axis image;

% Plot 2nd graph - Mean Diurnal Range 4.5
figure;
mean_diurnal_range_suitability_map_45 = gauss(BIO452, 9.96184, 2.1332);
rescaledmeandiurnalrangemap45 = rescale(mean_diurnal_range_suitability_map_45, 0, 1);
imagesc(rescaledmeandiurnalrangemap45);
colorbar;
axis image;

% Plot 3rd graph - Temperature of Wettest Quarter 4.5
figure;
temperature_wettest_quarter_suitability_map_45 = gauss(BIO458, 26.4211, 0.9260);
rescaledwettestquartertemperaturemap45 = rescale(temperature_wettest_quarter_suitability_map_45, 0, 1);
imagesc(rescaledwettestquartertemperaturemap45);
colorbar;
axis image;

% Plot 4th graph - Precipitation Seasonality 4.5
figure;
precipitation_seasonality_suitability_map_45 = gauss(BIO4515, 56.1444, 15.2501);
rescaledprecipitationseasonalitymap45 = rescale(precipitation_seasonality_suitability_map_45, 0, 1);
imagesc(rescaledprecipitationseasonalitymap45);
colorbar;
axis image;
