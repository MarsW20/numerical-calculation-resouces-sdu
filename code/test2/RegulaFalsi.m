function [niter, xvalue, X] = RegulaFalsi(xl, xu, f, tor)
    niter = 0;
    xvalue = 0;
    f = matlabFunction(f);
    X = [xl];
    xvalue = (xu*f(xl)-xl*f(xu))/(f(xl)-f(xu));
    judge = abs(xvalue-xl);
    while(judge>tor)
       niter = niter+1;
       xl = xvalue;
       xvalue = (xu*f(xl)-xl*f(xu))/(f(xl)-f(xu));
       X = [X,xvalue];
       judge = abs(xvalue-xl);
    end
end