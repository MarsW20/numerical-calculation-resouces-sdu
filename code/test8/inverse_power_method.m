    function [lambda,beta]=inverse_power_method(A,times,x0,lambda_star,epsilon)
%[lambda,beta]=inverse_power_method(A,x0,lambda_star,times,epsilon)
%lambda�����ó�������ֵ
%beta�����õ�������ֵ��Ӧ����������
%A�Ǵ������
%x0�ǳ�ʼ����
%lambda_star������ֵlambda�Ľ���ֵ
%times������������
%epsilon��������

format long;
b=eig(A);
c=size(b);
d=c(1)*c(2);  % ����Ԫ������
e=length(unique(b));  % �м�������ֵ
if(d==e)
    fprintf('����ֵ���죬�ǶԽǻ�����\n');
    [lambda,beta]=inverse_power_method_cal(A,x0,lambda_star,times,epsilon);
else
    error('����ֵ���ظ������ǶԽǻ�����\n');
end