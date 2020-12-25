function [lambda,beta]=symmetry_method_cal(A,times,x0,epsilon)
%[lambda,beta]=symmetry_method_cal(A,x0,times,epsilon)
format long;
k=1;
x0 = x0/norm(x0);
flag = 0;
    while(k<=times)
       fprintf("��%f�ε���\n",k);
       y=A*x0; 
       mu=x0'*y;
       if(norm(y)==0)
           fprintf("��������v��");
           display(x0);
           fprintf("A������ֵΪ0��ѡ���µĳ�ʼ����x");
       end
       err = norm(x0 - y/(norm(y)));
       x0 = y/norm(y);
       fprintf("�������ֵΪ:%d\n",mu);
       fprintf("��������Ϊ:");
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
        fprintf("��������������");
    end 
end