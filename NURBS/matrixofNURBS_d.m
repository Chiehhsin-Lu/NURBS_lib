function C = matrixofNURBS_d(p,u,U,P,mid,order)
%NURBS曲线导数的矩阵形式
if p==3
    mid= mid+1;
    M(1,1)=(U(mid+1)-U(mid))^2/((U(mid+1)-U(mid-1))*(U(mid+1)-U(mid-2)));
    M(1,3)=(U(mid)-U(mid-1))^2/((U(mid+1)-U(mid-1))*(U(mid+2)-U(mid-1)));
    M(2,3)=3*(U(mid)-U(mid-1))*(U(mid+1)-U(mid))/((U(mid+1)-U(mid-1))*(U(mid+2)-U(mid-1)));
    M(3,3)=3*(U(mid+1)-U(mid))^2/((U(mid+1)-U(mid-1))*(U(mid+2)-U(mid-1)));
    M(4,4)=(U(mid+1)-U(mid))^2/((U(mid+2)-U(mid))*(U(mid+3)-U(mid)));
    M(4,3)=-(M(3,3)/3+M(4,4)+(U(mid+1)-U(mid))^2/((U(mid+2)-U(mid))*(U(mid+2)-U(mid-1))));
    M(:,1)=M(1,1)*[1;-3;3;-1];
    M_f=[-1 -1 0 0 0 0;
         3  0 -1 0 0 0;
         -3 0 0 -1 0 0;
         1 0 0 0 -1 -1];
    M(:,2)=M_f*[M(1,1);M(1,3);M(2,3);M(3,3);M(4,3);M(4,4)];
    M(1,2)=M(1,2)+1;

    t=(u-U(mid))/(U(mid+1)-U(mid));
    
    switch order
        case 0
            C=[0 1 2*t 3*t^2]*M*[P(:,mid-3)';P(:,mid-2)';P(:,mid-1)';P(:,mid)'];
        case 1
            C=[0 1 2*t 3*t^2]*M*[P(:,mid-3)';P(:,mid-2)';P(:,mid-1)';P(:,mid)']/(U(mid+1)-U(mid));
        case 2
            C=[0 0 2 6*t]*M*[P(:,mid-3)';P(:,mid-2)';P(:,mid-1)';P(:,mid)']/(U(mid+1)-U(mid))^2;    
        case 3
            C=[0 0 0 6]*M*[P(:,mid-3)';P(:,mid-2)';P(:,mid-1)';P(:,mid)']/(U(mid+1)-U(mid))^3; 
    end
    C=C'; 
    C=C(1:2);
end
end