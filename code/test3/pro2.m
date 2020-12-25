%% 实验三的第二题
% 利用Jacobi方法求解方程组
% Jacobi迭代法求解
clc,clear;
syms L U x1 X;
% A为分解矩阵
A = [4,-1,1;4,-8,1;-2,1,5];
b = [7;-21;15];
k = 10; % 迭代次数
[x1] = Jacobi(A,b,k,0.0001);

% 利用 Gauss-Seidel方法求解方程组
[x2] = Gauss_Siedel(A,b);
subplot(1,2,1);
            n = size(x1,2);
            i = 1:n;
            plot(i,x1,'LineWidth',2);
            axis([0,10,0,5]);
            title("Jacobi 迭代法解得收敛情况");
            xlabel("迭代次数");
            ylabel("x值");
            legend('x1','x2','x3');
subplot(1,2,2);
            n = size(x2,2);
            i = 1:n;
            plot(i,x2,'LineWidth',2);
            axis([0,10,0,5]);
            title("Gauss-Seidel 迭代法解得收敛情况");
            xlabel("迭代次数");
            ylabel("x值");
            legend('x1','x2','x3');