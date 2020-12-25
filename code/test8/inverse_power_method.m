    function [lambda,beta]=inverse_power_method(A,times,x0,lambda_star,epsilon)
%[lambda,beta]=inverse_power_method(A,x0,lambda_star,times,epsilon)
%lambda是最后得出的特征值
%beta是最后得到的特征值对应的特征向量
%A是待求矩阵
%x0是初始向量
%lambda_star是特征值lambda的近似值
%times是最大迭代次数
%epsilon是最大误差

format long;
b=eig(A);
c=size(b);
d=c(1)*c(2);  % 矩阵元素数量
e=length(unique(b));  % 有几个代表值
if(d==e)
    fprintf('特征值互异，是对角化矩阵\n');
    [lambda,beta]=inverse_power_method_cal(A,x0,lambda_star,times,epsilon);
else
    error('特征值有重复，不是对角化矩阵\n');
end