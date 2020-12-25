%% 实验九特征值与特征向量
% 第一题：
clc,clear;
times = 100;
tol = 1e-9;
A = [4,-1,1;-1,3,-2;1,-2,3];
v0 = [1,1,1]';

% 幂法求特征值与特征向量
fprintf("幂法求特征值:\n")
[lambda1,beta1] = power_method(A, times,v0,tol);
fprintf("*****************************\n");
fprintf("主特征值为:");
display(lambda1);
fprintf("特征向量为:\n");
display(beta1);

% 对称幂法
fprintf("对称幂法求特征值:\n")
[lambda2,beta2] = symmetry_method(A,times,v0,tol);
fprintf("*****************************\n");
fprintf("主特征值为:");
display(lambda2);
fprintf("特征向量为:\n");
display(beta2);

fprintf("反幂法求特征值:\n")
% 反幂法求特征值与特征向量
lambda_start = 0.8;
[lambda3,beta3] = inverse_power_method(A,times,v0,lambda_start,tol);
fprintf("*****************************\n");
fprintf("主特征值为:");
display(lambda3);
fprintf("特征向量为:\n");
display(beta3);