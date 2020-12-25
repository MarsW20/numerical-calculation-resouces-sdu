function [niter, xvalue,Values] = Newton(x0, f, tor)
% 该函数利用Newton法对一元方程进行求解
% function [nitr, value] = Newton(x0, f, tor)
% niter: 迭代次数   xvalue为最终解
    tmp = x0;
    xvalue = x0;
    Values = [xvalue];
    niter = 0;
    dif = inf;
    % f = matlabFunction(f);
    df = diff(f);
    df = matlabFunction(df);
    f = matlabFunction(f);
    while(dif > tor)
        if(niter > 10000)
            break;
        end
       niter = niter+1;
       xvalue = tmp;
       Values = [Values,xvalue];
       tmp = xvalue - f(xvalue)/df(xvalue);
       dif = abs(tmp-xvalue);
    end
end