function E = rk_4(f,a,b,ya,M)
% function E = rk_4(f,a,b,ya,M)
% Input  - f �Ǻ������
%        - a �� b�����ҵĽ����ڵ�
%        - ya �ǳ�ʼ����y(a)
%        - M�ǲ���
% Output -E=[T' Y'] T�Ǻ���������
%        - Y������������ 
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