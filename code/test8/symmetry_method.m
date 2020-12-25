function [lambda,beta]=symmetry_method(A,times,x0,epsilon)
%这个是一个检验A能不能用幂法的函数
%lambda,beta]=symmetry_method(A,times,x0,epsilon)
%lambda是最后得出的特征值
%beta是最后得到的特征值对应的特征向量
%A是待求矩阵
%times是最大迭代次数
%x0是初始向量
%epsilon是最大误差

if(sum(sum(~(A==A'))))
    error("这不是对称矩阵请检查");
end

format long;
b=eig(A);      %求A的特征值所组成的向量
c=size(b);
d=c(1)*c(2);  % 矩阵元素数量，即特征值的总个数
e=length(unique(b));  % 有几个代表值
if(d==e)
    fprintf('特征值互异，是对角化矩阵\n');  %QUESTION1:fprintf
    [lambda,beta]=symmetry_method_cal(A,times,x0,epsilon);  %再去调用计算函数，代码在下面
else
    error('特征值有重复，不是对角化矩阵\n');
end