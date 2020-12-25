function E=Euler1(f,a,b,ya,M)
%function E=euler(f,a,b,ya,M)
% Input  - f 是函数句柄
%        - a 和 b是左右的结束节点
%        - ya 是初始条件y(a)
%        - M是步数
% Output -E=[T' Y'] T是横坐标向量
%        - Y是纵坐标向量
h=(b-a)/M;
% T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
    for j=1:M
       Y(j+1)=Y(j)+h*feval(f,0,Y(j)); 
    end
E = [T',Y'];
end