pricesCounts = (1:10)';
pricesPoint = [0.05 0.07 0.09 0.1 0.11 0.13 0.15 0.17 0.19 0.2]';
prices = [5 7 9 10 11 13 15 17 19 20]';
pricesHour = [3 4.2 5.4 6 6.6 7.8 9 10.2 11.4 12]';
vehs = [39 107 186 268 347]';
priceDay = 16;
Manteinance = [0.007 0.007 0.007 0.007 0.007 0.007 0.007 0.007 0.007 0.007]';
supplySame = 4464;
supplyAdd1 = 6432;
supplyAdd2 = 8328;
supplyMinus1 = 2568;
supplyMinus2 = 936;

columnsProfit = {'A','B','C','D','E'};
columnsRevenue = {'G','H','I','J','K'};
pricesStr = {'cinque';'sette';'nove';'dieci';'undici';'tredici';...
    'quindici';'diciassette';'diciannove';'venti'};
simStr = {'MunichAdd1010','MunichAdd10','Munich','MunichMinus10','MunichMinus1010'};
expStr = {'MunichXS','MunichXS_veh'};

for exp = 1:length(expStr)
    for sim = 1:length(simStr)
        cost = [];
        for i = 1:length(pricesCounts)
            inputAddress1 = compose('/Users/giulio.giorgione/Documents/MATLAB/SE_RevenueMax/%s/',expStr{exp});
            inputAddress2 = compose('%s/',simStr{sim});
            inputAddress3 = sprintf('%i/',prices(i));
            inputAddress4 = sprintf('ITERS/it.400/');
            inputAddress = strcat(inputAddress1,inputAddress2,inputAddress3,inputAddress4);
            csText = strcat(inputAddress,'run1.400.CS.txt');                     %Reads the .CS.txt file with carsharing data
            delimiterIn = ",";
            csText = char(csText);
            inputTable = readtable(csText,'Delimiter',',');
            bookingTimeTab = inputTable(:,15);
            bookingTime.(pricesStr{i}) = table2array(bookingTimeTab);
            inputTable = [inputTable(:,9) inputTable(:,10) inputTable(:,14) inputTable(:,13)];
            values.(pricesStr{i}) = table2array(inputTable,'Delimiter',',');
        end

        for i = 1:length(pricesCounts)
            distances.(pricesStr{i}) = sum(values.(pricesStr{i})(:,1));
            inVehicleTime.(pricesStr{i}) = sum(values.(pricesStr{i})(:,2));
            cost.(pricesStr{i}) = sum(values.(pricesStr{i})(:,3));
            vehUsed.(pricesStr{i}) = length(unique(values.(pricesStr{i})(:,4)));
            bookingTime.(pricesStr{i}) = sum(bookingTime.(pricesStr{i}));
        end
        for i = 1:length(pricesCounts)
            distancesTot(i,1) = distances.(pricesStr{i});
            inVehicleTimeTot(i,1) = inVehicleTime.(pricesStr{i});
            costTot(i,1) = cost.(pricesStr{i});
            vehUsedTot(i,1) = vehUsed.(pricesStr{i});
            bookingTimeTot(i,1) = bookingTime.(pricesStr{i});
        end

        bookingTimeTot = bookingTimeTot/60;
        inVehicleTimeTot = inVehicleTimeTot/60;
        profit = costTot - ((Manteinance .* inVehicleTimeTot) .* vehUsedTot);

%         %Plot revenue
%         revenuePlot = plot(pricesPoint,costTot);
%         hold on
%         profitPlot = plot(pricesPoint,profit);
% %         grid on
% %         grid minor
%         legend('Revenue','Profit');
%         xlabel('Price [€/h]');
%         xticks(pricesHour);
%         ylabel('Revenue/Profit [€]');
%         filename1 = compose('%s/',expStr{exp});
%         filename2 = compose('%s_Profit.svg',simStr{sim});
%         filename = char(strcat(filename1,filename2));
%         saveas(gca,filename);
%         filename1 = compose('%s/',expStr{exp});
%         filename2 = compose('%s_Profit.png',simStr{sim});
%         filename = char(strcat(filename1,filename2));
%         saveas(gca,filename);
%         close
%         filename = char(compose('%s_Profit.xls',expStr{exp}));
%         colProfit = char(compose('%s1',columnsProfit{sim}));
%         writematrix(profit,filename,'Sheet',1,'Range',colProfit);
%         filename = char(compose('%s_Profit.xls',expStr{exp}));
%         colRevenue = char(compose('%s1',columnsRevenue{sim}));
%         writematrix(costTot,filename,'Sheet',1,'Range',colRevenue);
        
        %Usage rate
        
        
        
    end
end

