function s=simpson_NURBS(p,U,P,mid,u,u_i1)
%simpson¹«Ê½
    s1=abs(norm(matrixofNURBS_d(p,u,U,P,mid)));
    s2=abs(norm(matrixofNURBS_d(p,0.5*(u+u_i1),U,P,mid)));
    s3=abs(norm(matrixofNURBS_d(p,u_i1,U,P,mid)));
    s=(u_i1-u)/6*(s1+4*s2+s3);
end