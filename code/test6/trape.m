function t = trape(f,a,b,n)
% �������������ʽ
%Input  -fun �������� -[a,b] �������� -n n�ȷ�
%Output -t ����ֵ
x = linspace(a,b,n);
h = (b - a)/n;
s = 0;
for i = 2:n-1
    s = s + 2*feval(f,0,x(i));
end
t = h/2*(feval(f,0,a) + feval(f,0,b) + s);