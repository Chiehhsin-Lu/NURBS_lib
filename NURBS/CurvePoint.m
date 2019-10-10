function [C,mid] = CurvePoint(n,p,U,Pw,u)
%�㷨A4.1����������B���������ϵĵ� 
    mid = FindSpan(n,p,u,U);
    N = BasisFuns(mid,u,p,U);
    
    Cw=0.0*ones(1,3);
    for k=0:p
        Cw=Cw+N(k+1)*Pw(:,mid-p+k+1)';
    end
    C=Cw/Cw(end);
    C=C(1:2)';
end