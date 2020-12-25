function [x1,x2]=solve_quadratic_equation(a,b,c,err)
% ���������η���
% [x1,x2]=solve_quadratic_equation(a,b,c,err)
% ������Ҫ����a,b,c �Լ������derta��|b|�Ĳ�  
    deta=(b^2-4*a*c)^(1/2);  
    if abs(b)-deta<err        %�����̫С����ʹ�ý����һ����ʽ����ֹ�������  
                  x1=(deta-b)/2/a;  
                  x2=(-deta-b)/2/a;  
    elseif(b>=0)              %����b>0ʱ�����µõ�x1��x2
                  x1=-2*c/(b+deta);  
                  x2=-2*c/(b-deta);  
    else                      %b<0ʱ�����µõ�x1��x2  
                  x2=-2*c/(b+deta);                    
                  x1=-2*c/(b-deta);  
    end
end  
