function [lambda,beta]=power_method(A,times,x0,epsilon)
%�����һ������A�ܲ������ݷ��ĺ���
%[lambda,beta]=power_method(A,times,x0,epsilon)
%lambda�����ó�������ֵ
%beta�����õ�������ֵ��Ӧ����������
%A�Ǵ������
%times������������
%x0�ǳ�ʼ����
%epsilon��������

format long;
b=eig(A);      %��A������ֵ����ɵ�����
c=size(b);
d=c(1)*c(2);  % ����Ԫ��������������ֵ���ܸ���
e=length(unique(b));  % �м�������ֵ
if(d==e)
    fprintf('����ֵ���죬�ǶԽǻ�����\n');  %QUESTION1:fprintf
    [lambda,beta]=power_method_cal(A,times,x0,epsilon);  %��ȥ���ü��㺯��������������
else
    error('����ֵ���ظ������ǶԽǻ�����\n');
end