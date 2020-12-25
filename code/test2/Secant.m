function [niter, xvalue, X] = Secant(xl, xr, f, tor) 
    % 割线法求根
    % function [niter, xvalue, X] = Secant(xl, xr, f, tor) 
    niter = 0;
    judge = abs(xr-xl);
    X = [0];
    f= matlabFunction(f);
    yxl = f(xl);
    yxr = f(xr);
    while(judge > tor)
        xvalue = xr -((xr-xl)/(yxr-yxl))*yxr;
        X = [X,xvalue];
        niter = niter+1;
        xl = xr;
        xr = xvalue;
        yxl = f(xl);
        yxr = f(xr);
        judge = abs(xl-xr);
    end
end