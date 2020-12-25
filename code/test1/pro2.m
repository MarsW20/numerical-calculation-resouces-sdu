% 实验一第二题
clc,clear;
r(1)=0.994;  %设定初始值
p(1)=1; p(2)=0.497;
q(1)=1;q(2)=0.497;
x(1)=1;
for i=2:16    %递推
          if i==2
              r(i)=r(i-1)/2;
              x(i)=x(i-1)/2;
          else
              x(i)=x(i-1)/2;
              r(i)=r(i-1)/2;
              p(i)=1.5*p(i-1)-p(i-2)/2;
              q(i)=2.5*q(i-1)-q(i-2);
          end
    
end

for i=1:15     %计算每一项误差
            dr(i)=x(i)-r(i);
            dp(i)=x(i)-p(i);
            dq(i)=x(i)-q(i);
end
 
m=1:15;    %作图

subplot(1,3,1);
hold on;
scatter(m,dr)
plot(m,dr);
title('$$r_{n}=\frac{r_{n-1}}{2}$$','Interpreter','latex');
hold off;

subplot(1,3,2);
hold on;
plot(m,dp)
scatter(m,dp);
title('$$p_{n}=\frac{3}{2}p_{n-1}-\frac{1}{2}p_{n-2}$$','Interpreter','latex');
hold off;

subplot(1,3,3);
hold on;
scatter(m,dq);
plot(m,dq)
title('$$q_{n}=\frac{5}{2}q_{n-1}-p_{n-2}$$','Interpreter','latex');
hold off;
