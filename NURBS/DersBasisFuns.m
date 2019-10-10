function ders = DersBasisFuns(i,u,p,n,U)
%算法A2.3：计算非零B样条基函数及其导数
%ders[k,j]存储的是基函数N_(i-p+j,p)的k阶导数
ndu(1,1) = 1.0;
left(1)=0;right(1)=0;
for j=1:p
    left(j+1)=u-U(i+2-j);
    right(j+1)=U(i+j+1)-u;
    saved=0.0;
    for r=0:j-1
        %
        ndu(j+1,r+1)=right(r+2)+left(j-r+1);
        temp=ndu(r+1,j)/ndu(j+1,r+1);
        %
        ndu(r+1,j+1)=saved+right(r+2)*temp;
        saved=left(j-r+1)*temp;
    end
    ndu(j+1,j+1)=saved;
end
%
for j=0:p
    ders(1,j+1)=ndu(j+1,p+1);
end
%
for r=0:p
    s1=0;s2=1;
    a(1,1)=1.0;
    %
    for k=1:n
        d=0.0;
        rk=r-k;pk=p-k;
        if r>=k
            a(s2+1,1)=a(s1+1,1)/ndu(pk+2,rk+1);
            d=a(s2+1,1)*ndu(rk+1,pk+1);
        end
        if rk>=-1
            j1=1;
        else
            j1=-rk;
        end
        if r-1<=pk
            j2=k-1;
        else
            j2=p-r;
        end
        for j=j1:j2
            a(s2+1,j+1)=(a(s1+1,j+1)-a(s1+1,j))/ndu(pk+2,rk+j+1);
            d=d+a(s2+1,j+1)*ndu(rk+j+1,pk+1);
        end
        if r<=pk
            a(s2+1,k+1)=-a(s1+1,k)/ndu(pk+2,r+1);
            d=d+a(s2+1,k+1)*ndu(r+1,pk+1);
        end
        ders(k+1,r+1)=d;
        j=s1;s1=s2;s2=j;
    end
end
r=p;
for k=1:n
    for j=0:p
        ders(k+1,j+1)=ders(k+1,j+1)*r;
    end
    r=r*(p-k);
end
end