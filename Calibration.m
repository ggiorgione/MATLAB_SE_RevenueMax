load CalibrationConstants.mat

red = [1 0 0.2];
plot(CSC1(:,1),CSC1(:,2),'.','Color',red);
hold on
[CSC,Bookings] = fit(CSC1(:,1),CSC1(:,2),'poly2');
plot(CSC,CSC1(:,1),CSC1(:,2));

[CSC,Bookings] = fit(CSC2(:,1),CSC2(:,2),'poly2');
plot(CSC,CSC2(:,1),CSC2(:,2));

[CSC,Bookings] = fit(CSC3(:,1),CSC3(:,2),'poly2');
CSC1plot = plot(CSC,CSC3(:,1),CSC3(:,2));

filename = sprintf('CarsharingConstantCalibration.svg');
saveas(gca,filename);