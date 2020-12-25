function s=traprl(f,a,b,M)
% 复合梯形求积公式
% function s=traprl(f,a,b,M)
% Input - f 是被积函数
%       - a 和 b是积分的上下界限
%       - M 为子区间的个数
h = (b-a)/M;
s=0;
for k=1:(M-1)
    x=a+h*k;
    s = s+feval(f,x);
end
s = h*(feval(f,a)+feval(f,b))/2+h*s;
end