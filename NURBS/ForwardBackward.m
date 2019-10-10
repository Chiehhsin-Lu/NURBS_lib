function x =ForwardBackward(L,U,n,p,Q)
%五对角追赶法求解
y(1,:)=Q{1,1};
y(2,:)=Q{1,2}-L(2,1)*y(1);
for k=3:n
    l_kk1=L(k,max(1,k-1-abs(k-p-1)));
    l_kk2=L(k,max(1,k-2-abs(k-p-1)));
    y(k,:)=Q{1,k}-l_kk1*y(k-1,:)-l_kk2*y(k-2,:);
end
x(n,:)=y(n,:)/U(n,1);
x(n-1,:)=(y(n-1,:)-U(n-1,2)*x(n,:))/U(n-1,1);
for k=n-2:-1:1
    u_kk1=U(k,2);
    u_kk2=U(k,3);
    x(k,:)=(y(k,:)-u_kk1*x(k+1,:)-u_kk2*x(k+2,:))/U(k,1);
end
end
% function M =ForwardBackward(L,U,Q,n)
% 三对角追赶法
% %   此处显示详细说明
% for i=1:n
%     a(i)
% end
% u(1)=b(1);z(1)=d(1);r=c;
% for k=2:n+1
%     l(k)=a(k)/u(k-1);
%     u(k)=b(k)-l(k)*r(k-1);
%     z(k)=d(k)-l(k)*z(k-1);
% end
% M(n+1)=z(n+1)/u(n+1);
% for k=n:-1:1
%     M(k)=(z(k)-r(k)*M(k+1))/u(k);
% end
% end