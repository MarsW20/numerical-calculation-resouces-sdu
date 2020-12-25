%% ʵ�����������ֵ΢������ֵ����
clc,clear;
format long;
syms x t;
xl=0;
xr=1;
M = 2;
f = @(x) exp(-x^2/2)/sqrt(2*pi);
%��׼��
s0 = int(f,x,0,1);
s0 = double(s0);
fprintf("��׼����ֽ��:%.12f\n\n",s0);

fprintf("��������Ϊ:"+num2str(M)+"\n\n");
% �����ݶȻ���
s1 = traprl(f,xl,xr,M);
fprintf("�������ͻ��ֽ��:%.12f\n",s1);
deta0 = abs(s0-s1);
fprintf("�����ݶȻ��ַ�����������ֵ:%.12f\n\n",deta0);

% Simpson����
s2 = simprl(f,xl,xr,M);
fprintf("Simpson��ʽ���ֽ��:%.12f\n",s2);
deta1 = abs(s0-s2);
fprintf("Simpson��ʽ������������ֵ:%.12f\n\n",deta1);

if (deta0<deta1)
    fprintf("�����ݶȻ��ַ���������С��\n")
else
    fprintf("Simpson��ʽ����������С��\n")
end