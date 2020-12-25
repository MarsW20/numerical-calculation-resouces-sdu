function [x,y,L,U] = zhuigan(A,d)
%定义函数 zhuigan
    n=size(A,1);%此处矩阵A的行数为n
    n0=size(A,2);
    flag=0;
    k=1;
    c(n-1)=A(end,end-1);
    p=2;
    a(1)=A(1,1);
    a(n)=A(end,end);
    b(1)=A(1,2);
    m=2;
    
    for i=2:(n-1)
        for j=1:n0
            if A(i,j)~=0
                if flag==0
                    c(k)=A(i,j);
                    k=k+1;
                    flag=flag+1;
                elseif flag==1
                    a(p)=A(i,j);
                    p=p+1;
                    flag=flag+1;
                elseif flag==2
                    b(m)=A(i,j);
                    m=m+1;
                    flag=0;
                    break;
                end
            end
        end
    end
    %以上将a,b,c转换成功
    %数组a存储三角矩阵A的主对角线元素，b、c存储主对角线上边下边带宽为1的元素
    n=length(a);
    n1=length(b);
    n2=length(c);
    %错误检查
    if n1~=n2%存储矩阵的数组维数错误
        error('不是三对角矩阵，参数数组中元素个数错误.');
    elseif n~=n1+1
        error('MATLAB:Crout:不是三对角矩阵，参数数组中元素个数错误.');
    end
    
    %初始化
    L=zeros(n);%生成n*n的全零矩阵
    U=zeros(n);
    p=1:n;
    q=1:n-1;
    x=1:n;
    y=1:n;
    
    %追赶法程序主体
    p(1)=a(1);
    for i=1:n-1
        q(i)=b(i)/p(i);
        p(i+1)=a(i+1)-c(i)*q(i);%d的下标改为1到n-1
    end
    
    %正解y
    y(1)=d(1)/p(1);%用x存储y
    for i=2:n
        y(i)=(d(i)-c(i-1)*y(i-1))/p(i);
    end
    %倒解x
    x(n)=y(n);
    for i=(n-1):-1:1
        x(i)=y(i)-q(i)*x(i+1);
    end
    %L,U矩阵
    for i=1:n
        L(i,i)=p(i);
        U(i,i)=1;
    end
    for i=1:n-1
        L(i+1,i)=c(i);
        U(i,i+1)=q(i);
    end
%end of function