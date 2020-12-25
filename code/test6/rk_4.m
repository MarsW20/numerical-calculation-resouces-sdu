function E = rk_4(f,a,b,ya,M)
% function E = rk_4(f,a,b,ya,M)
% Input  - f 是函数句柄
%        - a 和 b是左右的结束节点
%        - ya 是初始条件y(a)
%        - M是步数
% Output -E=[T' Y'] T是横坐标向量
%        - Y是纵坐标向量 
    yout=[];
    tout=[];
    h = (b-a)/M;
    for t = a:h:b
       k1 = feval(f,t,ya);
       k2 = h*feval(f,t+h/2,ya+0.5*k1);
       k3 = h*feval(f,t+h/2,ya+0.5*k2);
       k4 = h*feval(f,t+h,ya+k3);
       ya = ya+(k1+2*k2+2*k3+k4)/6;
       yout = [yout ya];
       tout = [tout t];
    end
    E = [tout;yout];
end