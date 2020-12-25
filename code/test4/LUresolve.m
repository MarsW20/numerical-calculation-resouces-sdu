function [L,U,x] = LUresolve(A,b)
    % 该函数进行LU分解
    % function [L,U,x] = LUresolve(A,b)
    n=length(A);
    A(2:n,1)=A(2:n,1)/A(1,1);
    for t=2:n-1  %进行LU分解
        A(t,t:n)=A(t,t:n)-A(t,1:t-1)*A(1:t-1,t:n);
        A(t+1:n,t)=(A(t+1:n,t)-A(t+1:n,1:t-1)*A(1:t-1,t))/A(t,t);
    end
    A(n,n)=A(n,n)-A(n,1:n-1)*A(1:n-1,n);
    L=tril(A,-1)+eye(n);
    U=triu(A); %矩阵A分解出L和U
    for t=2:n   %解Lx=b
    b(t)=b(t)-L(t,1:t-1)*b(1:t-1);
    end
    b(n)=b(n)/U(n,n);   %解Ux=b
    for t=1:n-1
        k=n-t;b(k)=(b(k)-U(k,k+1:n)*b(k+1:n))/U(k,k);
    end
    x=b;  %方程Ax=b的解即为
end