runNr = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"];
meanVal = [0.11, 0.06, 0.04, 0.07, 0.13, 0.11, 0.11, 0.09, 0.12, 0.09, 0.04, 0.07, 0.13, 0.11, 0.11, 0.07, 0.14];
stdDevVal = [0.21, 0.12, 0.12, 0.17, 0.23, 0.21, 0.20, 0.18, 0.22, 0.17, 0.09, 0.16, 0.23, 0.21, 0.21, 0.17, 0.23];

figure;
hold on;
errorbar(1:length(runNr), meanVal, stdDevVal, 'k.', 'LineWidth', 1.5);
scatter(1:length(runNr), meanVal, 'k', 'filled');
ylim([-0.15 1]);
set(gca, 'XTick', 1:length(runNr), 'XTickLabel', runNr, 'FontSize', 10);
xlabel('Run', 'FontSize', 10);
ylabel('Habitat Suitability', 'FontSize', 10);
grid on;
legend({'Standard Deviation', 'Mean'}, 'FontSize', 12);