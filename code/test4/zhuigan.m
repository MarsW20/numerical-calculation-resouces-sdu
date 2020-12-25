function [x,y,L,U] = zhuigan(A,d)
%���庯�� zhuigan
    n=size(A,1);%�˴�����A������Ϊn
    n0=size(A,2);
    flag=0;
    k=1;
    c(n-1)=A(end,end-1);
    p=2;
    a(1)=A(1,1);
    a(n)=A(end,end);
    b(1)=A(1,2);
    m=2;
    
    for i=2:(n-1)
        for j=1:n0
            if A(i,j)~=0
                if flag==0
                    c(k)=A(i,j);
                    k=k+1;
                    flag=flag+1;
                elseif flag==1
                    a(p)=A(i,j);
                    p=p+1;
                    flag=flag+1;
                elseif flag==2
                    b(m)=A(i,j);
                    m=m+1;
                    flag=0;
                    break;
                end
            end
        end
    end
    %���Ͻ�a,b,cת���ɹ�
    %����a�洢���Ǿ���A�����Խ���Ԫ�أ�b��c�洢���Խ����ϱ��±ߴ���Ϊ1��Ԫ��
    n=length(a);
    n1=length(b);
    n2=length(c);
    %������
    if n1~=n2%�洢���������ά������
        error('�������ԽǾ��󣬲���������Ԫ�ظ�������.');
    elseif n~=n1+1
        error('MATLAB:Crout:�������ԽǾ��󣬲���������Ԫ�ظ�������.');
    end
    
    %��ʼ��
    L=zeros(n);%����n*n��ȫ�����
    U=zeros(n);
    p=1:n;
    q=1:n-1;
    x=1:n;
    y=1:n;
    
    %׷�Ϸ���������
    p(1)=a(1);
    for i=1:n-1
        q(i)=b(i)/p(i);
        p(i+1)=a(i+1)-c(i)*q(i);%d���±��Ϊ1��n-1
    end
    
    %����y
    y(1)=d(1)/p(1);%��x�洢y
    for i=2:n
        y(i)=(d(i)-c(i-1)*y(i-1))/p(i);
    end
    %����x
    x(n)=y(n);
    for i=(n-1):-1:1
        x(i)=y(i)-q(i)*x(i+1);
    end
    %L,U����
    for i=1:n
        L(i,i)=p(i);
        U(i,i)=1;
    end
    for i=1:n-1
        L(i+1,i)=c(i);
        U(i,i+1)=q(i);
    end
%end of function