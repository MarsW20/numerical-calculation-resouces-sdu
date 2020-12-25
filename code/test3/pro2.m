%% ʵ�����ĵڶ���
% ����Jacobi������ⷽ����
% Jacobi���������
clc,clear;
syms L U x1 X;
% AΪ�ֽ����
A = [4,-1,1;4,-8,1;-2,1,5];
b = [7;-21;15];
k = 10; % ��������
[x1] = Jacobi(A,b,k,0.0001);

% ���� Gauss-Seidel������ⷽ����
[x2] = Gauss_Siedel(A,b);
subplot(1,2,1);
            n = size(x1,2);
            i = 1:n;
            plot(i,x1,'LineWidth',2);
            axis([0,10,0,5]);
            title("Jacobi ����������������");
            xlabel("��������");
            ylabel("xֵ");
            legend('x1','x2','x3');
subplot(1,2,2);
            n = size(x2,2);
            i = 1:n;
            plot(i,x2,'LineWidth',2);
            axis([0,10,0,5]);
            title("Gauss-Seidel ����������������");
            xlabel("��������");
            ylabel("xֵ");
            legend('x1','x2','x3');