function [ G, c1,x0 ] = GreyM( A )

A = rot90(A);
n=length(A); 

%% ���Ȳ���
Ratio = zeros(1,n-1);
for i = 1:n - 1
    Ratio(i) = A(i) / A(i+1);
end
c1 = 0;
x0 = A;
if ( exp(-2 / (n+1)) < min(Ratio) && max(Ratio) < exp(2 / (n+1)) )
%�ܹ�����ifѭ��˵�����ϼ��ȼ�⣬ֱ�ӽ��л�ɫԤ��Ϳɡ�
else
    disp('���ݲ�������飬�������ݽ��д���')
    while(1)
        x0 = x0 + 100;
        Ratio = zeros(1 , n - 1);
         for i = 1:n - 1
            Ratio(i) = x0(i) / x0(i+1);
        end
        if( exp(-2 / (n+1)) < min(Ratio) && max(Ratio) < exp(2 / (n+1)) )
            break;
        end
    end
    c1 = x0(1,1) - A(1,1);
    fprintf( '���ݽ��д�����ɣ�c��ֵΪ%d\n' , c1 );
end


A = x0;
x1=cumsum(A);
for i = 1:(n-1)
    Z(i) = (x1(i)+x1(i+1))/2; 
end
%% Ԥ��
D = A;
D(1) =[];
D= D';
E = [-Z; ones(1,n-1)];
c = inv(E*E')*E*D;
c = c';
a = c(1);b = c(2);

F = [];F(1) =A(1);
for i = 2: (n+4)
   F(i) = (A(1)-b/a)/exp(a*(i-1))+b/a; 
end
G=[]; G(1) = A(1);
for i = 2:(n+4)
    G(i) =F(i) -F(i-1);
end

end

