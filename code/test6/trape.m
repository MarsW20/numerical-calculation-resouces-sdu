function t = trape(f,a,b,n)
% 复化梯形求积公式
%Input  -fun 被积函数 -[a,b] 积分区间 -n n等分
%Output -t 积分值
x = linspace(a,b,n);
h = (b - a)/n;
s = 0;
for i = 2:n-1
    s = s + 2*feval(f,0,x(i));
end
t = h/2*(feval(f,0,a) + feval(f,0,b) + s);