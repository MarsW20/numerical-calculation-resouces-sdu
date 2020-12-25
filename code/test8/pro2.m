%% 实验九特征值与特征向量
% 第二题：Houserholder
clc,clear;
A = [1 -1 1;1 -0.5 0.25;1 0 0;1 0.5 0.25;1 1 1];
A_hang = size(A,1);
A_lie = size(A,2);
H = cell( A_lie, 1 );
Hs = eye(A_hang, A_hang);
R2 = A;
Q2 = eye(A_hang,A_hang);
for i = 1:A_lie
    [Hi, vi, betai] = Householder(R2(i:end,i));
    fprintf("第"+num2str(i)+"次Houserholder矩阵为:");
    display(Hi);
    %H{i} = blkdiag(eye(i-1), Hi);
    R2(i:end,i:end) = Hi*R2(i:end,i:end);
    Q2 = Q2*blkdiag(eye(i-1), Hi);
end
Q2(find(abs(Q2) < 1e-10)) = 0;
R2(find(abs(R2) < 1e-10)) = 0;
[Q1, R1] = qr(A); %matlab内部算法（非常非常的快）
Q1*R1 - A;
Q2*R2 - A;
erroQ = Q1 + Q2;
erroR = R1 + R2;