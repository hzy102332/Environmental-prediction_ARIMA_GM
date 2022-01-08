function [ v ] = GMfunction( A )
m=size(A,2);    
x0=mean(A,2);
x1=cumsum(x0);
alpha=0.4;          
n=length(x0); 
z1=alpha*x1(2:n)+(1-alpha)*x1(1:n-1);
Y=x0(2:n);            
B=[-z1,ones(n-1,1)];         
ab=B\Y;
k=6;
x=(x0(1)-ab(2)/ab(1))*(exp(-ab(1)*k)-exp(-ab(1)*(k-1)));
z=m*x;
u=sum(A)/sum(sum(A));
v=z*u;

end

