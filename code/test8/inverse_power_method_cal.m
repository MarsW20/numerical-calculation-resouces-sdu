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
[L,U]=lu(H);     %LU�ֽ⺯����matlab�Դ���
while k <= times 
    beta_b=max(x);
    y=x./beta_b;
    z=L\y;
    x=U\z;
    beta_b=max(x);
    fprintf("��%f�ε���\n",k);
    lambda=lambda_star+1/beta_b;
    fprintf('������ֵ=%.8f\n',lambda)
    fprintf('����������v=\n');
    disp(x);
    if abs(1/beta_b-1/u)<epsilon
        break
    else
        k=k+1;
        u=beta_b;
    end
end