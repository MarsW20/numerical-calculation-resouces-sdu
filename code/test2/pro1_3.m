%% 实验一的第二题
clc,clear;
syms x;
f = @(x)(2-3*x-sin(x));
xl=0;
xr=1;
judge = inf;
xbefore = 0;
result = [1];
count = 0;
while (judge>0.0005)
    count = count+1;
    xresult =  (xl+xr)/2;
    result = [result,xresult];
    judge = abs(xresult-xbefore);
    xbefore = xresult;
    if(f(xresult)>0)
        xl = xresult;
    else
        xr = xresult;
    end
end

plot(result);
h = title('$$2-3x-sin(x)$$');
set(h,'Interpreter','latex');
xlabel('迭代次数');
ylabel('result');
fprintf("函数迭代的次数为:%d\n",count);