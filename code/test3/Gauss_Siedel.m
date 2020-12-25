function X = Gauss_Siedel( A ,B )
% function x = gauss_siedel( A ,B )
% check if the entered matrix is a square matrix
[na , ma ] = size (A);
    if na ~= ma
        disp('ERROR: Matrix A must be a square matrix')
        return
    end

% check if B is a column matrix
[nb , mb ] = size (B);
if nb ~= na || mb~=1
   disp( 'ERROR: Matrix B must be a column matrix')
   return
end

D = diag(diag(A));
L = tril(A)- D;
U = triu(A)- D;
[ma,na] = size(A);
X0 = ones(ma,1);


tol = 0.000001*ones(na,1);
k= 1;

X( : , 1 ) = X0;
err= 1000000000*rand(na,1);% initial error assumption for looping
while sum(abs(err) >= tol) ~= zeros(na,1)
    X ( : ,k+ 1 ) = -inv(D+L)*(U)*X( : ,k) + inv(D+L)*B;% Gauss-Seidel formula
    err = X( :,k+1) - X( :, k);% finding error
    k = k + 1;
end

fprintf ('Gaussi-Siedel的迭代次数为%g   \n', k);
n = size(X,2);
i = 1:n;
plot(i,X,'LineWidth',2);
title("Gaussi-Siedel 迭代法解得收敛情况");
xlabel("迭代次数");
ylabel("x值");
legend('x1','x2','x3');