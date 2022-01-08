clc, clear
A= load('test2.txt');
A = rot90(A);
B = load('waste_gas.txt');
B = rot90(B);
C = load('waste_water.txt');
C = rot90(C);
U = [];
%% GMP改变u
%% 城市垃圾
% for i = 1:size(A,2)
%     a = A(:,i);
%     [G,u,s,U,S] = gm2(a);
%     U(1,i) = u;
%     t = 2004:2019;
%     t2 = 2004:2021; 
%     figure
%     plot(t,a,'o',t2,G,'-')
%      switch i
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
%     legend('Original data','Forecast data')
%     
%    switch i 
%        case 1 
%               title('u = 0.521');
%        case 2 
%               title('u = 0.523')
%        case 3 
%               title('u = 0.492')
%        case 4
%               title('u = 0.536')
%        case 5
%               title('u = 0.504')
%        case 6
%               title('u = 0.489')
%        case 7
%               title('u = 0.554')
%    end
%     figure
%     plot(U,S,'-')
%     [zmax,I]=min(S);
%     hold on           
%     plot(U(I),S(I),'.','MarkerSize',10)   
%     str = ['u = ' num2str(U(I))];
%     text(U(I),S(I),str)
%     ylabel('Error')
%     xlabel('u-value')
%     hold off
% end


%% 废气
% U = [];
% for i = 1 :size(B,2)
%     b = B(:,i);
%     [G,u,s,U,S] = gm2(b);
%     U(1,i) = u;
%     t = 2011:2017;
%     t2 = 2011:2021; 
%     figure(i)
%     plot(t,b,'o',t2,G,'-')
%     switch i
%         case 1 
%             title('u = 0.498')
%             ylabel('Sulfur dioxide emissions (tons)');
%         case 2
%             title('u = 0.493')
%             ylabel('NOx emission (ton)');
%     end
%     xlabel('years')
%     legend('Original data','Predict data')
%     
%     
%     figure
%     plot(U,S,'-')
%     [zmax,I]=min(S);
%     hold on           
%     plot(U(I),S(I),'.','MarkerSize',10)   
%     str = ['u = ' num2str(U(I))];
%     text(U(I),S(I),str)
%     ylabel('Error')
%     xlabel('u-value')
%     hold off
% end
% U

%% 废水
% U = [];
for i = 1 :size(C,2)
    c = C(:,i);
    [G,u,s,U,S] = gm2(c);
%     U(1,i) = u;
    t = 2011:2017;
    t2 = 2011:2021; 
    figure(i)
    plot(t,c,'o',t2,G,'-')
    switch i
        case 1 
            title('u = 0.497')
            ylabel('Petroleum Emission in Waste Water(ton)');
        case 2
            title('u = 0.496')
            ylabel('Volatile Phenol Emission in Waste Water(ton)');
        case 3
            title('u = 0.496');
              ylabel('Plumbum Emission in Waste Water(ton)');
        case 4 
            title('u = 0.497');
              ylabel('Cadmium Emission in Waste Water(ton)');
        case 5
            title('u = 0.492');
              ylabel('Total Chromium Emission in Waste Water(ton)');
        case 6 
            title('u = 0.49');
              ylabel('Hexavalent Chromium Emission in Waste Water(ton)');
    end
    xlabel('years')
    legend('Original data','Predict data')
%     figure
%     plot(U,S,'-')
%     [zmax,I]=min(S);
%     hold on           
%     plot(U(I),S(I),'.','MarkerSize',10)   
%     str = ['u = ' num2str(U(I))];
%     text(U(I),S(I),str)
%     ylabel('Error')
%     xlabel('u-value')
%     hold off
end
% U

%% GM预测数据
% A = A(:,2);
% [v,c1,x0] = GreyM(A);
% v = v-57490000;
% t = 2004:2019;
% t2 = 2004:2021; 
% plot(t,x0,'o',t2,v,'-')