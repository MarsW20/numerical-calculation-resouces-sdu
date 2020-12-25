%% ʵ��һ�ĵڶ���
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
xlabel('��������');
ylabel('result');
fprintf("���������Ĵ���Ϊ:%d\n",count);