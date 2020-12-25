% 最终发现pi/2,5*pi结果收敛于1.8955
% 而10*pi收敛于-1.8955
clc,clear;
syms x;
tor = 0.000001;
f = 1/2 + x^2/4 - x*sin(x) - cos(2*x)/2;
x0 = [pi/4,pi/2,5*pi,10*pi];
str = ['pi/4','pi/2','5pi','10pi'];
latex_str = {'$$\frac{\pi}{4}$$','$\frac{\pi}{2}$','$5\pi$','$10\pi$'};
disp("Newton 迭代法: ")
for i =1:size(x0,2)
    Values = [];
    [nitr, value, Values] = Newton(x0(i),f,tor);
    display(str(i)+"迭代结果：");
    display("迭代次数: "+num2str(nitr));
    display("零点x值: "+num2str(value));
    fprintf("\n");
    subplot(4,1,i);
        plot(Values);
        h = title(latex_str{i});
        set(h,"Interpreter","latex");
        xlabel("迭代次数");
        ylabel("xvalue");
end