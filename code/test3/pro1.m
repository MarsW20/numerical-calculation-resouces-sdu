%% 实验三第一题
% 对方程组进行LU分解
clc,clear;
syms L U x;
% A为分解矩阵，L,U分别为分解后的矩阵
A = [4,-1,1;4,-8,1;-2,1,5];
b = [7;-21;15];
[L,U,x]=LUresolve(A,b);
fprintf("LU分解\n");disp(A);
fprintf("L矩阵:\n");disp(L);
fprintf("U矩阵:\n");disp(U);
fprintf("x解:\n");disp(x);