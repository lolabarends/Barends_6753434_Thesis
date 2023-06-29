% Calculate statistics for Pantanal 1 current
values1 = maskedBasemapBIOnow1(~isnan(maskedBasemapBIOnow1));
average1 = mean(values1);
minimum1 = min(values1);
maximum1 = max(values1);
fprintf('Pantanal 1 current:\n');
fprintf('Average: %.2f\n', average1);
fprintf('Minimum: %.2f\n', minimum1);
fprintf('Maximum: %.2f\n\n', maximum1);

% Calculate statistics for Pantanal 2 current
values2 = maskedBasemapBIOnow2(~isnan(maskedBasemapBIOnow2));
average2 = mean(values2);
minimum2 = min(values2);
maximum2 = max(values2);
fprintf('Pantanal 2 current:\n');
fprintf('Average: %.2f\n', average2);
fprintf('Minimum: %.2f\n', minimum2);
fprintf('Maximum: %.2f\n\n', maximum2);

% Calculate statistics for Pantanal 8 current
values8 = maskedBasemapBIOnow8(~isnan(maskedBasemapBIOnow8));
average8 = mean(values8);
minimum8 = min(values8);
maximum8 = max(values8);
fprintf('Pantanal 8 current:\n');
fprintf('Average: %.2f\n', average8);
fprintf('Minimum: %.2f\n', minimum8);
fprintf('Maximum: %.2f\n\n', maximum8);

% Calculate statistics for Pantanal 15 current
values15 = maskedBasemapBIOnow15(~isnan(maskedBasemapBIOnow15));
average15 = mean(values15);
minimum15 = min(values15);
maximum15 = max(values15);
fprintf('Pantanal 15 current:\n');
fprintf('Average: %.2f\n', average15);
fprintf('Minimum: %.2f\n', minimum15);
fprintf('Maximum: %.2f\n\n', maximum15);

% Calculate statistics for Pantanal combined current
valuesCombined = maskedBasemapBIOnowcombined(~isnan(maskedBasemapBIOnowcombined));
averageCombined = mean(valuesCombined);
minimumCombined = min(valuesCombined);
maximumCombined = max(valuesCombined);
countThreshold = sum(valuesCombined > 0.00);  % Count values that are 0.00 or higher
totalCells = numel(valuesCombined);
fprintf('Pantanal combined current:\n');
fprintf('Average: %.2f\n', averageCombined);
fprintf('Minimum: %.2f\n', minimumCombined);
fprintf('Maximum: %.2f\n\n', maximumCombined);
fprintf('Number of values >= 0.00: %d\n\n', countThreshold);
fprintf('Total number of cells: %d\n', totalCells);

% Calculate Statistics for Sensitivity Analysis
valuescombined = maskedBasemapBIOnowcombined(~isnan(maskedBasemapBIOnowcombined));
averagecombined = mean(valuescombined);
minimumcombined = min(valuescombined);
maximumcombined = max(valuescombined);
stdSuitability = std(valuescombined(:));
fprintf('Pantanal 1 current:\n');
fprintf('Average: %.2f\n', averagecombined);
fprintf('Minimum: %.2f\n', minimumcombined);
fprintf('Maximum: %.2f\n\n', maximumcombined);
fprintf('Standard Deviation: %.2f\n', stdSuitability);