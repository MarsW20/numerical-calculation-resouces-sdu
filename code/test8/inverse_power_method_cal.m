function [lambda,x]=inverse_power_method_cal(A,x0,lambda_star,times,epsilon)
%[lambda,beta]=inverse_power_method_cal(A,x0,lambda_star,times,epsilon)
format long;
k=1;
u=1;

[m,n]=size(x0);
y=zeros(m,n);
x=x0;

I=eye(m);
H=A-lambda_star.*I;
[L,U]=lu(H);     %LU分解函数（matlab自带）
while k <= times 
    beta_b=max(x);
    y=x./beta_b;
    z=L\y;
    x=U\z;
    beta_b=max(x);
    fprintf("第%f次迭代\n",k);
    lambda=lambda_star+1/beta_b;
    fprintf('主特征值=%.8f\n',lambda)
    fprintf('主特征向量v=\n');
    disp(x);
    if abs(1/beta_b-1/u)<epsilon
        break
    else
        k=k+1;
        u=beta_b;
    end
end