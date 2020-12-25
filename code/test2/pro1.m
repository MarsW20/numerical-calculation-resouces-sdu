%% problem1 code
% 三种不同的方式迭代求解，并观察解的稳定性与收敛性
% 定义三种迭代方法
clc, clear;
syms x;
x0=2;xf=2;xl=2;
count1=0;
count2=0;
count3=0;

X1 = [2];X2=[2];X3=[2];
% count = 0;
judge = inf;
X = [];
f1 = @(x)(15-x^2);
f2 = @(x)(15/(2*x+1));
f3 = @(x)(x-(2*x^2+x-15)/(4*x+1));
F = {f1,f2,f3};

% 第一种迭代方法
xf = f1(x0);
judge = abs(xf-x0);
while(judge>0.00001)
    if(count1>2)
           break
    end
    count1 = count1+1;
    X1 = [X1,xf];
    xl = xf;
    xf = f1(xf);
    judge = abs(xf-xl);
end
subplot(3,1,1);
plot(X1);
title('x_{k+1}=15-x_{k}^{2}')
axis([0,100,-10000,100]);

x0=2;
xf = f2(x0);
judge = abs(xf-x0);
while(judge>0.00001)
    if(count2>100)
       break
    end
    count2 = count2+1;
    X2 = [X2,xf];
    xl = xf;
    xf = f2(xf);
    judge = abs(xf-xl);
end

subplot(3,1,2);
plot(X2);
h=title('$$x_{k+1}=\frac{15}{2x_{k}+1}$$');
set(h,'Interpreter','latex');

x0=2;
xf = f3(x0);
judge = abs(xf-x0);
while(judge>0.00001)
    if(count3>100)
           break
    end
    count3 = count3+1;
    X3 = [X3,xf];
    xl = xf;
    xf = f3(xf);
    judge = abs(xf-xl);
end

subplot(3,1,3);
plot(X3);
axis([10,5,0,5]);
h = title('$x_{k+1}=x_{k}-\frac{2x_{k}^{2}+x_{k}-15}{4x_{k}+1}$');
set(h,'Interpreter','latex');

fprintf("fun1迭代次数:%s\nfun2迭代次数:%d\nfun3迭代次数:%d\n",'NAN',count2,...
        count3);
