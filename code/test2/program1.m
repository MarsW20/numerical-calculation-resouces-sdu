clear,clc;
%% ��ֵ�����ϻ�ʵ��һ
% proj 1.1 ����ţ�ٷ���ⷽ��
% ���շ���pi/2,5*pi���������1.8955
% ��10*pi������-1.8955
syms x;
tor = 0.000001;
f = 1/2 + x^2/4 - x*sin(x) - cos(2*x)/2;
x0 = [pi/4,pi/2,5*pi,10*pi];
for i =1:size(x0,2)
    [nitr, value] = Newton(x0(i),f,tor);
    display(num2str(x0(i))+"���������");
    display("��������: "+num2str(nitr));
    display("���xֵ: "+num2str(value));
    fprintf("\n");
end

%%