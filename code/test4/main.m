clc,clear;
f = @(x)sin(x);
x0 = pi*rand(21,1);
x1 = pi*rand(21,1);
x1 = sort(x1);
x0 = sort(x0);
f0 = feval(f,x0);
f1 = feval(f,x1);
figure; 
hold on;

subplot(1,2,1);
hold on;
scatter(x0,f0);
y = cubicspline3(f,x0,x0);
title("���ڱ߽����");
xlabel("x");
hold off;

subplot(1,2,2);
hold on;
pp = csape(x0,f0,'not-a-knot');
y = ppval(pp,x1);
plot(x1,y);
scatter(x1,f1);
title("��Ť��������ֵ");
xlabel("x");
hold off;