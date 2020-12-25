function [alpha,x]=power_method_cal(A,times,x0,epsilon)
%[alpha,x]=power_method_cal(A,times,x0,epsilon)
format long;
k=1;
u=0;

[m,n]=size(x0);
y=zeros(m,n);
y=x0;

while k <= times 
    x=A*y;
    alpha=max(x);   %用max()求一个矩阵中最大的元素
    y=x./alpha;
    fprintf("第%f次迭代\n",k);
    fprintf('主特征值=%.8f\n',alpha)
    fprintf('主特征向量v=\n');
    disp(x);
    if abs(alpha-u)<epsilon
        break
    else
        k=k+1;
        u=alpha;
    end      %QUESTION2:end

end