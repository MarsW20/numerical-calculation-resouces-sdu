% ���շ���pi/2,5*pi���������1.8955
% ��10*pi������-1.8955
clc,clear;
syms x;
tor = 0.000001;
f = 1/2 + x^2/4 - x*sin(x) - cos(2*x)/2;
x0 = [pi/4,pi/2,5*pi,10*pi];
str = ['pi/4','pi/2','5pi','10pi'];
latex_str = {'$$\frac{\pi}{4}$$','$\frac{\pi}{2}$','$5\pi$','$10\pi$'};
disp("Newton ������: ")
for i =1:size(x0,2)
    Values = [];
    [nitr, value, Values] = Newton(x0(i),f,tor);
    display(str(i)+"���������");
    display("��������: "+num2str(nitr));
    display("���xֵ: "+num2str(value));
    fprintf("\n");
    subplot(4,1,i);
        plot(Values);
        h = title(latex_str{i});
        set(h,"Interpreter","latex");
        xlabel("��������");
        ylabel("xvalue");
end