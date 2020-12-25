function [L,U,x] = LUresolve(A,b)
    % �ú�������LU�ֽ�
    % function [L,U,x] = LUresolve(A,b)
    n=length(A);
    A(2:n,1)=A(2:n,1)/A(1,1);
    for t=2:n-1  %����LU�ֽ�
        A(t,t:n)=A(t,t:n)-A(t,1:t-1)*A(1:t-1,t:n);
        A(t+1:n,t)=(A(t+1:n,t)-A(t+1:n,1:t-1)*A(1:t-1,t))/A(t,t);
    end
    A(n,n)=A(n,n)-A(n,1:n-1)*A(1:n-1,n);
    L=tril(A,-1)+eye(n);
    U=triu(A); %����A�ֽ��L��U
    for t=2:n   %��Lx=b
    b(t)=b(t)-L(t,1:t-1)*b(1:t-1);
    end
    b(n)=b(n)/U(n,n);   %��Ux=b
    for t=1:n-1
        k=n-t;b(k)=(b(k)-U(k,k+1:n)*b(k+1:n))/U(k,k);
    end
    x=b;  %����Ax=b�Ľ⼴Ϊ
end