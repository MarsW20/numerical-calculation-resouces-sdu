%% 第三章样条插值
% 参考网站：https://www.cnblogs.com/lingr7/p/9780429.html
% 在[0,pi]生成随机的点
clc,clear;
x = pi*rand(11,1);
x = x';
f = @(x)sin(x);
y = f(x);

%开始构造函数
n=size(x,2); 

for k=2:n %计算h(i)
    h(k-1)=x(k)-x(k-1);
end

for k=1:(n-2) %计算μ和λ
    mu(k)=h(k)/(h(k)+h(k+1));
    lambda(k)=1-mu(k);
end

for k=1:(n-2)
    g(k)=3*(lambda(k)*(y(k+1)-y(k))/h(k)+mu(k)*(y(k+2)-y(k+1))/h(k+1)); %计算g(1)到g(n-2)
end
fprintf('边界条件类型选择:\n1.已知f(a)和f(b)的二阶导数\n2.已知f(a)和f(b)的一阶导数\n3.y=f(x)是以T=b-a为周期的周期函数\n');

in=input('请输入对应序号：');

if in==1
    M(1)=input('请输入f(a)的二阶导数值：');
    M(n)=input('请输入f(b)的二阶导数值：');
    
    A=zeros(n,n);     %构造追赶法所需的A和b
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
    m=zhuigan(A,b);      %利用追赶法求解成功，这里的参数b形式应为行向量而非列向量
 
elseif in==2
    y0=input('请输入f(a)的一阶导数值：');
    yn=input('请输入f(b)的一阶导数值：');
    A=zeros(n-2,n-2);    %构造追赶法所需的A和b

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
    m=zhuigan(A,b);%利用追赶法求解

%这里解出m(1)至m(n-2),为能代入带一阶导数的分段三次埃米尔特插值多项式，要对m进行调整
    for k=(n-2):-1:1
            m(k+1)=m(k);
    end
    m(1)=y0;
    m(n)=yn;

elseif in==3
    A=zeros(n,n);    %构造追赶法所需的A和b
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

    N=LU_fenjieqiuxianxingfangcheng(A,b);    %利用LU分解求解线性方程组

    for k=1:(n-1)
        M(k+1)=N(k,1);
    end

    M(1)=M(n);

else

    fprintf('您输入的序号不正确');

end