function SKL = SurfaceDerivsAlgl(n,p,U,m,q,V,P,u,v,d)
%算法A3.6：计算B样条曲面上的点及其所有直到d阶的偏导矢
du=min(d,p);
for k=p+1:d
    for l=0:d-k
        SKL(k+1,l+1)={0.0*zeros(1,3)};
    end
end
dv=min(d,q);
for l=q+1:d
    for k=0:d-l
        SKL(k+1,l+1)={0.0*zeros(1,3)};
    end
end
uspan=FindSpan(n,p,u,U);
Nu=DersBasisFuns(uspan,u,p,du,U)
% Nu=[Nu(1:3,1:3),zeros(3,3)];
vspan=FindSpan(m,q,v,V);
Nv=DersBasisFuns(vspan,v,q,dv,V);
for k=0:du
    for s=0:q
        temp(s+1,:)=0.0*zeros(1,3);
        for r=0:p
            temp(s+1,:)=temp(s+1,:)+Nu(k+1,r+1)*P{uspan-p+r+1,vspan-q+s+1};
        end
    end
    dd=min(d-k,dv);
    for l=0:dd
        SKL(k+1,l+1)={0.0*zeros(1,3)};
        for s=0:q
            SKL{k+1,l+1}=SKL{k+1,l+1}+Nv(l+1,s+1)*temp(s+1,:);
        end
    end
end
end