function s = trapz1(f,a,b,f0,M)
    h = (b-a)/M;
    Y = f0;
    s = f0;
    for i=2:M
        x = a+(i-1)*h;
        y = feval(f,0,x);
        Y = [Y,y];
        s = [s,trapz(Y)];
    end
end