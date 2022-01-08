clc,clear,close all
%% 废弃物
A = load('test2.txt');
A = rot90(A);
% for i = 1:size(A,2)
y = A(:,1)
t = 2004 : 2019;
t = t';
figure
plot(t,y,'-');

%% 废水
% A = load('test3.txt');
% A = rot90(A);
% y = A(:,2);
% t = 2004 : 2017;
% t = t';
% figure
% plot(t,y,'-')

%% 废气
% A = load('gas.txt');
% A = rot90(A);
% y = A(:,1);
% t = 2004 : 2017;
% t = t';
% figure
% plot(t,y,'-');

%% 平稳性检验
% Y =y;
% y_h_adf = adftest(Y);
% y_h_kpss = kpsstest(Y);
% Yd1 =diff(Y);
% y_h_adf = adftest(Yd1);
% y_h_kpss = kpsstest(Yd1);
% Yd1 = diff(Yd1);
% y_h_adf = adftest(Yd1);
% y_h_kpss = kpsstest(Yd1);

%% ACF和PACF 
figure
subplot(211),autocorr( y );
subplot(212),parcorr( y );
figure
dy = diff( y );
subplot(211),autocorr( dy );
subplot(212),parcorr( dy );
figure
dy = diff( dy );
subplot(211),autocorr( dy );
subplot(212),parcorr( dy );

%% ARIMA 模型
Mdl = arima(2,2,4);
EstMdl = estimate(Mdl,y);
res = infer(EstMdl,y);

%% 模型验证00
figure
subplot(2,2,1)
plot(res./sqrt(EstMdl.Variance))
title('Standardized Residuals')
subplot(2,2,2),qqplot(res)
subplot(2,2,3),autocorr(res)
subplot(2,2,4),parcorr(res)
%% 预测
[yF,yMSE] = forecast(EstMdl,7,'Y0',y);
UB = yF + 1.96*sqrt(yMSE);
LB = yF - 1.96*sqrt(yMSE);
0000
figure
h4 = plot(t,y,'b');
hold on
h5 = plot(2019:2025,yF,'r','LineWidth',2);
h6 = plot(2019:2025,UB,'k--','LineWidth',1.5);
plot(2019:2025,LB,'k--','LineWidth',1.5);
hold off
ylabel('Domestic waste cleaning and transportation volume(ton)');
xlabel('years');
legend('Original data','Predict data')