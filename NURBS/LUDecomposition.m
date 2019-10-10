function [L,U]=LUDecomposition(A,n,p)
%五对角LU分解
U=A(1,1:p+1);L=A(1:p+1,1)/U(1,1);
for i=2:n
    for j=i:min(n,i+p)
        sum_1=0;
        for t=max([1,i-p,j-p]):i-1
            l_it=L(i,max(1,t-abs(i-p-1)));
            u_tj=U(t,max(1,j-t+1));
            sum_1=sum_1+l_it*u_tj;
        end
        u_ij=A(i,j-max(i-p-1,0))-sum_1;
        U(i,max(1,j-i+1))=u_ij;
    end
    for k=i+1:min(n,i+p)
        sum_2=0;
        for t=max([1,k-p,i-p]):i-1
            l_kt=L(k,max(1,t-abs(k-p-1)));
            u_ti=U(t,max(1,i-t+1));
            sum_2=sum_2+l_kt*u_ti;
        end
        l_ki=(A(k,i-max(k-p-1,0))-sum_2)/U(i,1);
        L(k,max(1,i-abs(k-p-1)))=l_ki;
    end
    L(i,min(i,p+1))=1;
end
end
% function [L,U]=LUDecomposition(A,n)%A is the square matrix,n is the order of A
% L=eye(n);%常规LU分解
% for i=1:n-1
%     for j=i+1:n            
%             L(j,i)=A(j,i)/A(i,i);
%             A(j,:)=A(j,:)-(A(j,i)/A(i,i))*A(i,:);
%     end
% end
% U=A; %A becomes U matrix after Gauss elimination
% % L
% end
