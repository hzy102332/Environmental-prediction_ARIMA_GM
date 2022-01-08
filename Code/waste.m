clc,clear
%数据得前后置换
A = load('domestic_garbage.txt');
A = rot90(A);
B = load('waste_gas.txt');
B = rot90(B);
C = load('waste_water.txt');
C = rot90(C);
D = load('test.txt');
D = rot90(D);

%% A数据GM预测
% A= load('test2.txt');
% A = rot90(A);
% for i = 1 :size(A,2)
% 
%     a = A(:,i);
%     [v,c1,x0] = GreyM(a);
%     c1 = repmat(c1,1,18);
%     v1 = v-c1;
%     t = 2004:2019;
%     t2 = 2004:2021; 
%     
%     figure
%     plot(t,a,'o',t2,v1,'-')
%     switch i
%         case 1 
%             ylabel('Domestic waste clearing and transportation volume (ton)');
%         case 2
%             ylabel('Harmless treatment capacity of domestic waste (T / D)');
%         case 3
%             ylabel('Harmless treatment capacity of domestic waste sanitary landfill (T / D)');
%         case 4
%             ylabel('Harmless treatment capacity of domestic waste incineration (T / D)');
%         case 5
%             ylabel('Harmless treatment capacity of domestic waste (tons)');
%         case 6
%             ylabel('Harmless treatment capacity of domestic waste sanitary landfill (tons)');
%         case 7 
%             ylabel('Harmless treatment capacity of domestic waste incineration (tons)');
%     end
%     xlabel('years')
%     legend('Original data','Forecast data','2018 and 2019 data')
% end

%% 重新测试A数据第六个数据
% a = A(:,6)
% a(8,1) = 117060000;
% a(9,1) = 109480000;
% v = GreyM(a)
% t = 2011:2019;
% t2 = 2011:2021; 
% plot(t,a,'o',t2,v)
% ylabel('Harmless treatment capacity of domestic waste sanitary landfill (tons)');
% xlabel('years');
% legend('Available data','Forecast data','2018 and 2019 data')

%% B数据测试
for i = 1 :size(B,2)
    b = B(:,i);
    [v,c1,x0] = GreyM(b);
    c1 = repmat(c1,1,11);
    v1 = v-c1;
%     v = GreyM(b);
    t = 2011:2017;
    t2 = 2011:2021; 
    figure
    plot(t,b,'o',t2,v1) 
    switch i
        case 1 
            ylabel('Sulfur dioxide emissions (tons)');
        case 2
            ylabel('NOx emission (ton)');
        case 3
            ylabel('Smoke (dust) emission (ton)');
    end
    xlabel('years')
    legend('Available data','Forecast data')
end

%% C数据测试
% for i = 1 :size(C,2)
%     c = C(:,i);
%     v = GreyM(c);
%     t = 2011:2017;
%     t2 = 2011:2021; 
%     figure(i)
%     plot(t,c,'o',t2,v) 
%     switch i
%         case 1 
%             ylabel('Chemical oxygen demand emission (ton)');
%         case 2
%             ylabel('Ammonia nitrogen emission (ton)');
%         case 3
%             ylabel('Total nitrogen emission (ton)');
%         case 4
%             ylabel('Total phosphorus emission (ton)');
%         case 5
%             ylabel('Oil emissions (tons)');
%         case 6
%             ylabel('Volatile phenol emission (ton)');
%         case 7 
%             ylabel('Lead emissions (tons)');
%         case 8
%             ylabel('Mercury emissions (tons)')
%         case 9
%             ylabel('Cadmium emission (ton)')
%         case 10
%              ylabel('Total chromium emissions (tons)')
%         case 11
%             ylabel('Arsenic emission (ton)')
%         case 12
%             ylabel('Hexavalent chromium emission (ton)')
%     end
%     xlabel('years')
%     legend('Available data','Forecast data')
% end







   