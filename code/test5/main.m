%% 实验五第四章数值微分与数值积分
clc,clear;
format long;
syms x t;
xl=0;
xr=1;
M = 2;
f = @(x) exp(-x^2/2)/sqrt(2*pi);
%标准解
s0 = int(f,x,0,1);
s0 = double(s0);
fprintf("标准解积分结果:%.12f\n\n",s0);

fprintf("子区间数为:"+num2str(M)+"\n\n");
% 复合梯度积分
s1 = traprl(f,xl,xr,M);
fprintf("复合梯型积分结果:%.12f\n",s1);
deta0 = abs(s0-s1);
fprintf("复合梯度积分方法的误差绝对值:%.12f\n\n",deta0);

% Simpson积分
s2 = simprl(f,xl,xr,M);
fprintf("Simpson公式积分结果:%.12f\n",s2);
deta1 = abs(s0-s2);
fprintf("Simpson公式方法的误差绝对值:%.12f\n\n",deta1);

if (deta0<deta1)
    fprintf("复合梯度积分方法的误差较小。\n")
else
    fprintf("Simpson公式方法的误差较小。\n")
end