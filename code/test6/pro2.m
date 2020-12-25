%% pro2 第二题求解van der pol
clc,clear;
ts=[0 30];
x0=[1;0];
M=300;
mu = [0.01 0.1 1];
for i=1:3
    f = @(t,x)vanderpol(mu(i),t,x);
    E = rk_4(f,ts(1),ts(2),x0,M);
    E = E';
    t = E(:,1);
    x1 = E(:,2);x2 = E(:,3);

    figure;
    hold on;
    subplot(1,2,1);plot(t,E(:,2:3));
    str = ['van der Pol ','$\mu=',num2str(mu(i)),'$'];
    title(str,'Interpreter','latex');
    subplot(1,2,2);plot(x1,x2);
    str = ['van der Pol ','$\mu=',num2str(mu(i)),'$'];
    title(str,'Interpreter','latex');
    hold off;
end