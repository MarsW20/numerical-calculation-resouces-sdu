%% ʵ������һ��
% �Է��������LU�ֽ�
clc,clear;
syms L U x;
% AΪ�ֽ����L,U�ֱ�Ϊ�ֽ��ľ���
A = [4,-1,1;4,-8,1;-2,1,5];
b = [7;-21;15];
[L,U,x]=LUresolve(A,b);
fprintf("LU�ֽ�\n");disp(A);
fprintf("L����:\n");disp(L);
fprintf("U����:\n");disp(U);
fprintf("x��:\n");disp(x);