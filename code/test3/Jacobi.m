function [X] = Jacobi(A,b,k,tol)
    % function [x] = Jacobi(A,b,k)
    % ����A��b���Լ���������k
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
            fprintf("Jacobi ����������\n");
            fprintf("����������%d\n",judge);
            fprintf("�⣺\n")
            disp(x);
            n = size(X,2);
            i = 1:n;
            plot(i,X,'LineWidth',2);
            title("Jacobi ����������������");
            xlabel("��������");
            ylabel("xֵ");
            legend('x1','x2','x3');
            return;
        end
        judge = judge+1;
        x0 = x;
        X = [X,x];
    end
    fprintf("Jacobi ������������\n");
    n = size(X,2);
    i = 1:n;
    plot(i,X);
end