function [ temp3,temp,temp2,U,S2] = gm2( A )

u = 0;
temp = 0;%uֵ�����
temp2 = 0;%���ƽ����Сֵ
temp3 = [];%G
S2 = [];%������
U = [];%u����
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

B = A;
A = x0;
c1 = repmat(c1,1,11);%��11
x1 = cumsum(A);

while u <= 1
    
    for i = 1:(n-1)
        Z(i) = u*x1(i)+x1(i+1)*(1-u); 
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
        G = G - c1;
        S = G(1:n)-B;
        S = sum(S.*S,2);
        S2(end +1) = S;
        U(end +1) = u;
        if u == 0
            temp2 = S;
        end
        if temp2 >= S
            temp2 = S;
            temp = u;   
            temp3 = G;
        end
        u = u +0.001;
end
end

