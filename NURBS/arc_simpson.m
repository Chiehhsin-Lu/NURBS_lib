function arc=arc_simpson(p,U,P,mid,u,u_i1,xi)
% simpson公式求取弧长
% p：    次数
% U：    节点向量
% P：    控制点
% mid;   节点区间
% u:     起始节点
% u_i1:  终止节点
% xi:    ζ，允许误差

    s=simpson_NURBS(p,U,P,mid,u,u_i1);
    s1=simpson_NURBS(p,U,P,mid,u,0.5*(u_i1+u));
    s2=simpson_NURBS(p,U,P,mid,0.5*(u_i1+u),u_i1);
    a=u;b=u_i1;c=0.5*(u+u_i1); 
    while(abs(s1+s2-s)>10*xi)
        s1=arc_simpson(p,U,P,mid,a,c,xi);
        s2=arc_simpson(p,U,P,mid,c,b,xi); 
        s=s1+s2; 
    end
    arc=s1+s2;
end