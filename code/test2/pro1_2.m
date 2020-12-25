%% problem1 code
% 三种不同的方式迭代求解，并观察解的稳定性与收敛性
% 定义三种迭代方法
clc, clear;
syms x;
x = [-5,0.1,5];
xf=0;
f2 = @(x)(15/(2*x+1));
f3 = @(x)(x-(2*x^2+x-15)/(4*x+1));

% 第二种方式
judge = inf;

for i=1:3
    count=0;
    x0 = x(i);
    xl = f2(x0);
    xr = f2(x0);
    X = [x0];
    judge = abs(xr-x0);
    while(judge>0.00001)
        if(count>100)
           break
        end
        count = count+1;
        X = [X,xr];
        xl = xr;
        xr = f2(xr);
        judge = abs(xr-xl);
    end
    subplot(2,3,i);
    plot(X);
end

% 第二种方式
judge = inf;
for i=1:3
    count=0;
    x0 = x(i);
    xl = f3(x0);
    xr = f3(x0);
    X = [x0];
    judge = abs(xr-x0);
    while(judge>0.00001)
        if(count>100)
           break
        end
        count = count+1;
        X = [X,xr];
        xl = xr;
        xr = f3(xr);
        judge = abs(xr-xl);
    end
    subplot(2,3,i+3);
    plot(X);
end