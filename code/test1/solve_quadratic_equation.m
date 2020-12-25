function [x1,x2]=solve_quadratic_equation(a,b,c,err)
% 用于求解二次方程
% [x1,x2]=solve_quadratic_equation(a,b,c,err)
% 函数需要输入a,b,c 以及允许的derta和|b|的差  
    deta=(b^2-4*a*c)^(1/2);  
    if abs(b)-deta<err        %如果差太小，则使用解的另一种形式，防止巨量误差  
                  x1=(deta-b)/2/a;  
                  x2=(-deta-b)/2/a;  
    elseif(b>=0)              %否则，b>0时，如下得到x1，x2
                  x1=-2*c/(b+deta);  
                  x2=-2*c/(b-deta);  
    else                      %b<0时，如下得到x1，x2  
                  x2=-2*c/(b+deta);                    
                  x1=-2*c/(b-deta);  
    end
end  
