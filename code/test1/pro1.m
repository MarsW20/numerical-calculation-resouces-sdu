%% ��һ��problem1��
clc,clear;
format long;
tol=0.1;
a=1;
b=[-1000.001,-1000.0001,-10000.00001,-100000.00001];
c=1;
for i=1:4
    [m1,m2]=solve_quadratic_equation(a,b(i),c,tol);
    M = [m1;m2];
    A(:,i)=M;
end
fprintf("�ĸ����̵Ľ�����:\n");
fprintf("����һ�Ľ�x1=%f, x2=%f\n",A(1,1),A(2,1));
fprintf("���̶��Ľ�x1=%f, x2=%f\n",A(1,2),A(2,2));
fprintf("�������Ľ�x1=%f, x2=%f\n",A(1,3),A(2,3));
fprintf("�����ĵĽ�x1=%f, x2=%f\n",A(1,4),A(2,4));