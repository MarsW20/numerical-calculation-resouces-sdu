function E=runge_kutta1(f,y0,h,a,b)%������˳��������΢�ַ�����ĺ������ƣ���ʼֵ������������ʱ����㣬ʱ���յ㣨������ʽ�ο���ode45������
n=floor((b-a)/h);%����
x(1)=a;%ʱ�����
y(:,1)=y0;%����ֵ������������������Ҫע��ά��
    for t=1:n
        x(t+1)=x(t)+h;
        k1=f(x(t),y(:,t));
        k2=f(x(t)+h/2,y(:,t)+h*k1/2);
        k3=f(x(t)+h/2,y(:,t)+h*k2/2);
        k4=f(x(t)+h,y(:,t)+h*k3);
        y(:,t+1)=y(:,t)+h*(k1+2*k2+2*k3+k4)/6;
    %���������������������ֵ���
    end
    E = [x' y'];
end