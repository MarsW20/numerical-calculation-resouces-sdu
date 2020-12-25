%% ������������ֵ
% �ο���վ��https://www.cnblogs.com/lingr7/p/9780429.html
% ��[0,pi]��������ĵ�
clc,clear;
x = pi*rand(11,1);
x = x';
f = @(x)sin(x);
y = f(x);

%��ʼ���캯��
n=size(x,2); 

for k=2:n %����h(i)
    h(k-1)=x(k)-x(k-1);
end

for k=1:(n-2) %����̺ͦ�
    mu(k)=h(k)/(h(k)+h(k+1));
    lambda(k)=1-mu(k);
end

for k=1:(n-2)
    g(k)=3*(lambda(k)*(y(k+1)-y(k))/h(k)+mu(k)*(y(k+2)-y(k+1))/h(k+1)); %����g(1)��g(n-2)
end
fprintf('�߽���������ѡ��:\n1.��֪f(a)��f(b)�Ķ��׵���\n2.��֪f(a)��f(b)��һ�׵���\n3.y=f(x)����T=b-aΪ���ڵ����ں���\n');

in=input('�������Ӧ��ţ�');

if in==1
    M(1)=input('������f(a)�Ķ��׵���ֵ��');
    M(n)=input('������f(b)�Ķ��׵���ֵ��');
    
    A=zeros(n,n);     %����׷�Ϸ������A��b
    for k=2:(n-1)          
            A(k,k)=2;
            A(k,k+1)=mu(k-1);
            A(k,k-1)=lambda(k-1);
    end

    A(1,1)=2;
    A(1,2)=1;
    A(end,end)=2;
    A(end,end-1)=1;
    b=zeros(n,1);

    for k=2:(n-1)
            b(k,1)=g(k-1);
    end

    b(1,1)=3*((y(2)-y(1))/h(1)-2*h(1)*M(1));
    b(n,1)=3*((y(n)-y(n-1))/h(n-1)+2*h(n-1)*M(n));
    b=b';
    m=zhuigan(A,b);      %����׷�Ϸ����ɹ�������Ĳ���b��ʽӦΪ����������������
 
elseif in==2
    y0=input('������f(a)��һ�׵���ֵ��');
    yn=input('������f(b)��һ�׵���ֵ��');
    A=zeros(n-2,n-2);    %����׷�Ϸ������A��b

    for k=2:(n-3)           
        A(k,k)=2;
        A(k,k+1)=mu(k);
        A(k,k-1)=lambda(k);
    end

    A(1,1)=2;
    A(1,2)=mu(1);
    A(end,end)=2;
    A(end,end-1)=lambda(n-2);
    b=zeros(n-2,1);

    for k=2:(n-3)
          b(k,1)=g(k);
    end

    b(1,1)=g(1)-lambda(1)*y0;
    b(end,1)=g(n-2)-mu(n-2)*yn;
    b=b';
    m=zhuigan(A,b);%����׷�Ϸ����

%������m(1)��m(n-2),Ϊ�ܴ����һ�׵����ķֶ����ΰ��׶��ز�ֵ����ʽ��Ҫ��m���е���
    for k=(n-2):-1:1
            m(k+1)=m(k);
    end
    m(1)=y0;
    m(n)=yn;

elseif in==3
    A=zeros(n,n);    %����׷�Ϸ������A��b
    for k=2:(n-1)
          A(k,k)=2;
          A(k,k+1)=mu(k-1);
          A(k,k-1)=lambda(k-1);
    end

    A(1,1)=2;
    A(1,2)=mu(1);
    A(1,end)=lambda(1);
    A(end,end)=2;
    A(end,end-1)=lambda(n-1);
    A(end,1)=mu(n-1);
    b=zeros(n-1,1);

    for k=1:(n-1)
          b(k,1)=d(k+1);
    end

    N=LU_fenjieqiuxianxingfangcheng(A,b);    %����LU�ֽ�������Է�����

    for k=1:(n-1)
        M(k+1)=N(k,1);
    end

    M(1)=M(n);

else

    fprintf('���������Ų���ȷ');

end