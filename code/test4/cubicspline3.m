function y=cubicspline3(f,x0,x) 
%���������ڱ߽�����������������ֵ��
%x = linspace(-1,1,40);
%x����㣻
%y����㺯��ֵ��
%x0 ��֪��ֵ�㣻
%y0 ��֪��ֵ�㺯��ֵ��
%f_0��˵�һ�ε���ֵ��
%f_n�Ҷ˵�һ�ε���ֵ��
% x0 = linspace(0,2*pi,20);
y0=feval(f,x0);
n = length(x0);
z = length(y0);
h = zeros(n-1,1);
k=zeros(n-2,1);
l=zeros(n-2,1);
S=2*eye(n);
for i=1:n-1
    h(i)= x0(i+1)-x0(i);
end

for i=1:n-2
    k(i)= h(i+1)/(h(i+1)+h(i));
    l(i)= 1-k(i);
end

%���ڵ�һ�ֱ߽�������
k = [0;k];              
l = [l;0];	

%����ϵ������A��
for i = 1:n-1
    S(i,i+1) = k(i);
    S(i+1,i) = l(i);
end
S(2,n)=S(2,1);
S(2,1)=0;
S(n,2)=h(1)/(h(1)+h(n-1));
S(n,n-1)=h(n-1)/(h(1)+h(n-1));

%���������
F=zeros(n-1,2);
for i = 1:n-1
    F(i,1) = (y0(i+1)-y0(i))/(x0(i+1)-x0(i));
end
D = zeros(n-2,1);
for i = 1:n-2
    F(i,2) = (F(i+1,1)-F(i,1))/(x0(i+2)-x0(i));
    D(i,1) = 6 * F(i,2);
end

%��������D��
d0 =0;        
dn = 6*(F(1,1)+F(n-1,1))/(h(1)+h(n-1));     
D = [d0;D;dn];                
m= S\D;
m(1)=m(n);
%Ѱ��x����λ�ã��������Ӧ��ֵ��
for i = 1:length(x)
    for j = 1:n-1
        if (x(i)<=x0(j+1))&&(x(i)>=x0(j))
                 y(i) =( m(j)*(x0(j)-x(i))^3)/(6*h(j))+...
                (m(j+1)*(x(i)-x0(j))^3)/(6*h(j))+...
                (m(j)*(x(i)-x0(j))^2)/2+...
                (y0(j)+(m(j)*h(j)^2)/6)*(x0(j)-x(i))/h(j)+...
                (y0(j+1)-(m(j+1)*h(j)^2)/6)*(x(i)-x0(j))/h(j)+...
                y0(j);      
            break;
        else
            continue;
        end
    end
end   
plot(x,y,'b')%��ֵ����ͼ��
% t=sin(x);
% hold on
% plot(x,t,'r') %ԭ����ͼ��