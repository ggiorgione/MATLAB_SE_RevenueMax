surf(Price,Supply,ProfitS,'FaceAlpha',1);
xlabel('Price [€/h]');
ylabel('Supply [h]');
zlabel('Profit [€]');
shading interp;
filename = 'ProfitWSupplyChanging.svg';
saveas(gca,filename);
filename = 'ProfitWSupplyChanging.png';
saveas(gca,filename);

surf(Price,Demand,ProfitD,'FaceAlpha',1);
xlabel('Price [€/h]');
ylabel('Demand');
zlabel('Profit [€]');
shading interp;
filename = 'ProfitWDemandChanging.svg';
saveas(gca,filename);
filename = 'ProfitWDemandChanging.png';
saveas(gca,filename);
