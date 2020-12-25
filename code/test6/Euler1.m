function E=Euler1(f,a,b,ya,M)
%function E=euler(f,a,b,ya,M)
% Input  - f �Ǻ������
%        - a �� b�����ҵĽ����ڵ�
%        - ya �ǳ�ʼ����y(a)
%        - M�ǲ���
% Output -E=[T' Y'] T�Ǻ���������
%        - Y������������
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