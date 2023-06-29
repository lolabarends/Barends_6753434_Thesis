%this is the habitat suitability of the giant otter for the whole world
%for the present
bioclimatic_datanow1 = imread('wc2.1_2.5m_bio_1.tif');
bioclimatic_datanow2 = imread('wc2.1_2.5m_bio_2.tif');
bioclimatic_datanow8 = imread('wc2.1_2.5m_bio_8.tif');
bioclimatic_datanow15 = imread('wc2.1_2.5m_bio_15.tif');
BIOnow1 = bioclimatic_datanow1;
BIOnow2 = bioclimatic_datanow2;
BIOnow8 = bioclimatic_datanow8;
BIOnow15 = bioclimatic_datanow15;

% Plot 1st graph - Current Annual Mean Temperature
figure;
annual_mean_temperature_suitability_map = gauss(BIOnow1, 26.272, 0.7351);
rescaledannualmeantemperaturemap = rescale(annual_mean_temperature_suitability_map, 0, 1);
imagesc(rescaledannualmeantemperaturemap);
colorbar;
axis image;

% Plot 2nd graph - Current Mean Diurnal Range
figure;
mean_diurnal_range_suitability_map = gauss(BIOnow2, 9.6184, 2.1332);
rescaledmeandiurnalrangemap = rescale(mean_diurnal_range_suitability_map, 0, 1);
imagesc(rescaledmeandiurnalrangemap);
colorbar;
axis image;

% Plot 3rd graph - Current Temperature of Wettest Quarter
figure;
temperature_wettest_quarter_suitability_map = gauss(BIOnow8, 26.4211, 0.926);
rescaledwettestquartertemperature = rescale(temperature_wettest_quarter_suitability_map, 0, 1);
imagesc(rescaledwettestquartertemperature);
colorbar;
axis image;
title('Current Temperature of Wettest Quarter');

% Plot 4th graph - Current Precipitation Seasonality
figure;
precipitation_seasonality_suitability_map = gauss(BIOnow15, 53.33718, 15.2501);
rescaledprecipitationseasonalitymap = rescale(precipitation_seasonality_suitability_map, 0, 1);
imagesc(rescaledprecipitationseasonalitymap);
colorbar;
axis image;

%combined maps
figure;
suitability_map_combinedcurrent = annual_mean_temperature_suitability_map .* mean_diurnal_range_suitability_map .* temperature_wettest_quarter_suitability_map .* precipitation_seasonality_suitability_map;
suitability_map_combined_scaledcurrent = rescale(suitability_map_combinedcurrent, 0, 1);
imagesc(suitability_map_combined_scaledcurrent);
colorbar;
axis image;
