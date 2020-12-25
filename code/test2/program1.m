clear,clc;
%% 数值计算上机实验一
% proj 1.1 利用牛顿法求解方程
% 最终发现pi/2,5*pi结果收敛于1.8955
% 而10*pi收敛于-1.8955
syms x;
tor = 0.000001;
f = 1/2 + x^2/4 - x*sin(x) - cos(2*x)/2;
x0 = [pi/4,pi/2,5*pi,10*pi];
for i =1:size(x0,2)
    [nitr, value] = Newton(x0(i),f,tor);
    display(num2str(x0(i))+"迭代结果：");
    display("迭代次数: "+num2str(nitr));
    display("零点x值: "+num2str(value));
    fprintf("\n");
end

%%