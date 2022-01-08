function [myans,err] = GM21(x0,pre_num)
%如 x0=[41,49,61,78,96,104]; %注意这里为行向量
%num 为预测个数
%myans为预测数组
%err为相对误差
 
n=length(x0); 
x1=cumsum(x0);  %计算1次累加序列
a_x0=diff(x0)'; %计算1次累减序列
z=0.5*(x1(2:end)+x1(1:end-1))'; %计算矩阵序列
B=[-x0(2:end)',-z,ones(n-1,1)];
u=B\a_x0;   
x=dsolve('D2x+a1*Dx+a2*x=b','x(0)=c1,x(5)=c2');  
x=subs(x,{'a1','a2','b','c1','c2'},{u(1),u(2),u(3),x1(1),x1(n)});
yuce=subs(x,'t',0:n-1); 
x=vpa(x,6); 
pre = zeros(1,n+pre_num);
for i = 1:n+pre_num
    if(i == 1)
        pre(i) = double(vpa(subs(x,'t',i-1),6));
    else
        pre(i) = double(vpa(subs(x,'t',i-1),6)) - double(vpa(subs(x,'t',i-2),6));
    end
end
myans = pre;
err = zeros(1,n);
step = zeros(1,-1);
for i = 1:n
    err(i) = (x0(i) - pre(i))/x0(i);
end
