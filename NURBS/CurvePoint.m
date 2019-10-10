function [C,mid] = CurvePoint(n,p,U,Pw,u)
%算法A4.1：计算有理B样条曲线上的点 
    mid = FindSpan(n,p,u,U);
    N = BasisFuns(mid,u,p,U);
    
    Cw=0.0*ones(1,3);
    for k=0:p
        Cw=Cw+N(k+1)*Pw(:,mid-p+k+1)';
    end
    C=Cw/Cw(end);
    C=C(1:2)';
end