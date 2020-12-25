function [niter, xvalue, X] = Dichotomy(xl,xr, f, tor)
    % �ú������ö��ַ���һԪ���̽������
    % function [niter, xvalue] = Dichotomy(xl,xr, f, tor)
    % niter: ��������   xvalue�� ���ս�
    xvalue = 0;
    tmp = inf;
    niter = 0;
    f = matlabFunction(f);
    X = [xvalue];
    while(abs(tmp-xvalue)>tor)
        tmp = xvalue;
        xvalue = (xl+xr)/2;
        X = [X, xvalue];
        niter = niter+1;
        if(f(xvalue)>0)
            xr = xvalue;
        elseif(f(xvalue)<0)
            xl = xvalue;
        else
            break;
        end
    end
end