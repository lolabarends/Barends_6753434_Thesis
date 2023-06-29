%this is the habitat suitability of the giant otter for the whole world
%for RCP8.5
bioclimatic_data851 = imread('mc85bi501.tif');
bioclimatic_data852 = imread('mc85bi502.tif');
bioclimatic_data858 = imread('mc85bi508.tif');
bioclimatic_data8515 = imread('mc85bi5015.tif');
% Resize images
BIO851 = double(bioclimatic_data851);
BIO851 = BIO851/10;
BIO852 = double(bioclimatic_data852);
BIO852 = BIO852/10;
BIO858 = double(bioclimatic_data858);
BIO858 = BIO858/10;
BIO8515 = double(bioclimatic_data8515);

% Plot 1st graph - Annual Mean Temperature 8.5
figure;
annual_mean_temperature_suitability_map_85 = gauss(BIO851, 26.2720, 0.7351);
rescaledannualmeantemperaturemap85 = rescale(annual_mean_temperature_suitability_map_85, 0, 1);
imagesc(rescaledannualmeantemperaturemap85);
colorbar;
axis image;

% Plot 2nd graph - Mean Diurnal Range 8.5
figure;
mean_diurnal_range_suitability_map_85 = gauss(BIO852, 9.6184, 2.1332);
rescaledmeandiurnalrangemap85 = rescale(mean_diurnal_range_suitability_map_85, 0, 1);
imagesc(rescaledmeandiurnalrangemap85);
colorbar;
axis image;

% Plot 3rd graph - Temperature of Wettest Quarter 8.5
figure;
temperature_wettest_quarter_suitability_map_85 = gauss(BIO858, 26.4211, 0.926);
rescaledwettestquartertemperaturemap85 = rescale(temperature_wettest_quarter_suitability_map_85, 0, 1);
imagesc(rescaledwettestquartertemperaturemap85);
colorbar;
axis image;

% Plot 4th graph - Precipitation Seasonality 8.5
figure;
precipitation_seasonality_suitability_map_85 = gauss(BIO8515, 56.1444, 15.2501);
rescaledprecipitationseasonalitymap85 = rescale(precipitation_seasonality_suitability_map_85, 0, 1);
imagesc(rescaledprecipitationseasonalitymap85);
colorbar;
axis image;