function CK=CurveDerivsAlg1(n,p,U,P,u,d)
%算法A3.2：计算曲线上的导矢
du=min(d,p);
for k=p+1:d
    CK(:,k+1)=0.0;
end
span=FindSpan(n,p,u,U);
nders=DersBasisFuns(span,u,p,du,U);
for k=0:du
    CK(:,k+1)=0.0*zeros(1,2)';
    for j=0:p
        CK(:,k+1)=CK(:,k+1)+nders(k+1,j+1)*P(:,span-p+j+1);
    end
end
end