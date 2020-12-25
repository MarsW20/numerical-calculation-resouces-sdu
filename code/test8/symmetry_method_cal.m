function [lambda,beta]=symmetry_method_cal(A,times,x0,epsilon)
%[lambda,beta]=symmetry_method_cal(A,x0,times,epsilon)
format long;
k=1;
x0 = x0/norm(x0);
flag = 0;
    while(k<=times)
       fprintf("第%f次迭代\n",k);
       y=A*x0; 
       mu=x0'*y;
       if(norm(y)==0)
           fprintf("特征向量v：");
           display(x0);
           fprintf("A有特征值为0，选择新的初始向量x");
       end
       err = norm(x0 - y/(norm(y)));
       x0 = y/norm(y);
       fprintf("最大特征值为:%d\n",mu);
       fprintf("特征向量为:");
       display(x0);
       if(err<epsilon)
           flag=1;
           lambda=mu;
           beta=x0;
           break;
       else
           k=k+1;
       end
    end
    if(~flag)
        fprintf("超出最大迭代次数");
    end 
end