%% ʵ������������뺯���ƽ�
clc,clear;
x=-2:1:2;
y=[0,1,2,1,0];
scatter(x,y);

xlabel 'x��'
ylabel 'z��'
title 'ɢ��ͼ'
hold on;
grid on;

m=4;n=2;
A=zeros(n+1);
for j=1:n+1
    for i=1:n+1
        for k=1:m+1
            A(j,i)=A(j,i)+x(k)^(j+i-2);
        end
    end
end
 
B=[0 0 0];
for j=1:n+1
    for i=1:m+1
        B(j)=B(j)+y(i)*x(i)^(j-1);
    end
end

B=B';
a=inv(A)*B;
x=[-2.0:0.0001:2.0];
z=a(1)+a(2)*x+a(3)*x.^2;
plot(x,z)
legend('Points','y=a_{1}+a_{2}x+a_{3}x^{2}','Interpretation','latex')
title('�������ͼ')
fprintf("���򷽳���ϵ��:\n");
disp(A);
fprintf("���򷽳�������:\n")
disp(B);