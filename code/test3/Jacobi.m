function [X] = Jacobi(A,b,k,tol)
    % function [x] = Jacobi(A,b,k)
    % 矩阵A，b，以及迭代次数k
    judge = 0;
    col = size(A,1);
    x0 = ones(col,1);
    X = [x0];
    L = -tril(A,-1);U=triu(A,1);D=A+L+U;
    T = D\(L+U);
    c = D\b;
    while(judge <= k)
        x = T*x0+c;
        if(sum(abs(x-x0))<tol)
            fprintf("Jacobi 迭代法收敛\n");
            fprintf("迭代次数：%d\n",judge);
            fprintf("解：\n")
            disp(x);
            n = size(X,2);
            i = 1:n;
            plot(i,X,'LineWidth',2);
            title("Jacobi 迭代法解得收敛情况");
            xlabel("迭代次数");
            ylabel("x值");
            legend('x1','x2','x3');
            return;
        end
        judge = judge+1;
        x0 = x;
        X = [X,x];
    end
    fprintf("Jacobi 迭代法不收敛\n");
    n = size(X,2);
    i = 1:n;
    plot(i,X);
end