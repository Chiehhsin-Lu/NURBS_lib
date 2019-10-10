function S = SurfacePoint(n,p,U,m,q,V,P,u,v,temp)
%算法A4.3：计算有理B样条曲面上的点
    uspan = FindSpan(n,p,u,U);
    Nu = BasisFuns(uspan,u,p,U);
    uind = uspan-p;

    vspan = FindSpan(m,q,v,V);
    Nv = BasisFuns(vspan,v,q,V);

    for l=0:q

        temp(l+1,:)=zeros(1,size(P{1,1},2));
        vind = vspan-q+l;
        for k =0:p
            temp(l+1,:) = temp(l+1,:)+Nu(k+1)*cell2mat(P(uind+k+1,vind+1));
        end
    end
    S = 0.0;
    for l =0:q
        S =S+Nv(l+1)*temp(l+1,:);
    end
end