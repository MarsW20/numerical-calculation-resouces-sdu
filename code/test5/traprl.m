function s=traprl(f,a,b,M)
% �������������ʽ
% function s=traprl(f,a,b,M)
% Input - f �Ǳ�������
%       - a �� b�ǻ��ֵ����½���
%       - M Ϊ������ĸ���
h = (b-a)/M;
s=0;
for k=1:(M-1)
    x=a+h*k;
    s = s+feval(f,x);
end
s = h*(feval(f,a)+feval(f,b))/2+h*s;
end