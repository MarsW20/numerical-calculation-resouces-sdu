function [alpha,x]=power_method_cal(A,times,x0,epsilon)
%[alpha,x]=power_method_cal(A,times,x0,epsilon)
format long;
k=1;
u=0;

[m,n]=size(x0);
y=zeros(m,n);
y=x0;

while k <= times 
    x=A*y;
    alpha=max(x);   %��max()��һ������������Ԫ��
    y=x./alpha;
    fprintf("��%f�ε���\n",k);
    fprintf('������ֵ=%.8f\n',alpha)
    fprintf('����������v=\n');
    disp(x);
    if abs(alpha-u)<epsilon
        break
    else
        k=k+1;
        u=alpha;
    end      %QUESTION2:end

end