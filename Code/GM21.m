function [myans,err] = GM21(x0,pre_num)
%�� x0=[41,49,61,78,96,104]; %ע������Ϊ������
%num ΪԤ�����
%myansΪԤ������
%errΪ������
 
n=length(x0); 
x1=cumsum(x0);  %����1���ۼ�����
a_x0=diff(x0)'; %����1���ۼ�����
z=0.5*(x1(2:end)+x1(1:end-1))'; %�����������
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
