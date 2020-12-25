%% ʵ�������ֵ����������
% ��һ�⣺
clc,clear;
times = 100;
tol = 1e-9;
A = [4,-1,1;-1,3,-2;1,-2,3];
v0 = [1,1,1]';

% �ݷ�������ֵ����������
fprintf("�ݷ�������ֵ:\n")
[lambda1,beta1] = power_method(A, times,v0,tol);
fprintf("*****************************\n");
fprintf("������ֵΪ:");
display(lambda1);
fprintf("��������Ϊ:\n");
display(beta1);

% �Գ��ݷ�
fprintf("�Գ��ݷ�������ֵ:\n")
[lambda2,beta2] = symmetry_method(A,times,v0,tol);
fprintf("*****************************\n");
fprintf("������ֵΪ:");
display(lambda2);
fprintf("��������Ϊ:\n");
display(beta2);

fprintf("���ݷ�������ֵ:\n")
% ���ݷ�������ֵ����������
lambda_start = 0.8;
[lambda3,beta3] = inverse_power_method(A,times,v0,lambda_start,tol);
fprintf("*****************************\n");
fprintf("������ֵΪ:");
display(lambda3);
fprintf("��������Ϊ:\n");
display(beta3);