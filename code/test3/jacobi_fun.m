function x = jacobi_fun(A, b, x0, tol, max)
    [n,n] = size(A);
    xold=x0;C=-A;
    for i=1:n
       C(i,i)=0; 
    end
    
    for i =1:n
       C(i,:)=C(i,:)/A(i,i); 
    end
    
    for i=1:n
       d(i,1) = b(i)/A(i,i);
    end
    
    i=1;
        while(i<=max)
       xnew = C*xold+d;
       if norm(xnew-xold)<=tol
          x = xnew;
          disp('jacobi 收敛');
          return;
       else
           xold = xnew;
       end
       disp([xnew']);
       i = i+1;
    end
    disp("jacobi不收敛");
    disp("迭代次数为");
    x = xnew;
end