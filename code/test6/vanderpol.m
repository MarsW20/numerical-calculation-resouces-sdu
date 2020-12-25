function xdot=vanderpol(mu,t,x)
    xdot1(1)=mu*x(1)*(1-x(2)^2)-x(2);
    xdot1(2)=x(1);
    xdot=xdot1';
end