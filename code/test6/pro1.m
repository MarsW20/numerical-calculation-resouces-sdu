%% ʵ������һ��
clc,clear;
% ��ʼֵ
syms y;
f = @(t,y)1+y^2;
left = 0; % ����߽�
right = 1;
y0=0;

figure;
subplot(2,2,1);
hold on;
% ode45����
[type,values] = ode45(f,[0,1],0);
plot(type,values);
title("ODE45");
axis([0,1,0,1.5]);
hold off;

subplot(2,2,2);
hold on;
% ŷ���Ը�ʽ
for M = 1:56
    E = Euler1(f,left,right,0,M);
    plot(E(:,1),E(:,2));
end
err = values-E(:,2);
title('Euler')
axis([0,1,0,1.5]);
hold off;

% ����Ԥ��������ʽ
subplot(2,2,3);
hold on;

h=(right-left)/M;
for j=1:56
    s = 0;
    t = 0;
    for i=1:j
       t = [t,i*h];
       s = [s,trape(f,left,i*h,j)];
    end
    plot(t,s);
end
err = [err,(values-t')];
title('Trapezoid Formula');
axis([0,1,0,1.5]);
hold off;

% �������
subplot(2,2,4);
hold on;
for M=1:56
    h = (right-left)/M;
    E = runge_kutta1(f,0,h,left,right);
    plot(E(:,1),E(:,2));
end
err = [err,(values-E(:,2))];
title("Runge-Kutta");
axis([0,1,0,1.5]);
hold off;

figure;
hold on;
subplot(1,3,1);
    hold on;
    plot(err(:,1));
    title("Euler ����");
    hold off;
subplot(1,3,2);
    hold on;
    title("Trapezoid ����");
    plot(err(:,2));
    hold off;
subplot(1,3,3);
    hold on;
    plot(err(:,3));
    title("Runge-Kutta ����");
    hold off;
hold off;