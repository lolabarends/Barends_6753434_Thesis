%Combined Maps 2.6
suitability_map_combined26 = annual_mean_temperature_suitability_map_26 .* mean_diurnal_range_suitability_map_26 .* temperature_wettest_quarter_suitability_map_26 .* precipitation_seasonality_suitability_map_26;
suitability_map_combined_scaled26 = rescale(suitability_map_combined26, 0, 1);
imagesc(suitability_map_combined_scaled26);
colorbar;
axis image;

%Combined Maps 4.5
suitability_map_combined45 = annual_mean_temperature_suitability_map_45 .* mean_diurnal_range_suitability_map_45 .* temperature_wettest_quarter_suitability_map_45 .* precipitation_seasonality_suitability_map_45;
suitability_map_combined_scaled45 = rescale(suitability_map_combined45, 0, 1);
imagesc(suitability_map_combined_scaled45);
colorbar;
axis image;

%Combined Maps 8.5
suitability_map_combined85 = annual_mean_temperature_suitability_map_85 .* mean_diurnal_range_suitability_map_85 .* temperature_wettest_quarter_suitability_map_85 .* precipitation_seasonality_suitability_map_85;
suitability_map_combined_scaled85 = rescale(suitability_map_combined85, 0, 1);
imagesc(suitability_map_combined_scaled85);
colorbar;
axis image;