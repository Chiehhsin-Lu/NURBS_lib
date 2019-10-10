function C = SolveTridiagonal(n,Q,U,P)
%算法A9.2：通过求解三对角方程组计算3次样条曲线
%P的 0,1,n+1,n+2已经经过初始化
    R=zeros(1,n+1);
    dd=zeros(1,n+1);
    for i=3:n-1
        R(i+1)=Q(i);
    end
    abc = BasisFuns(4,U(5),3,U);
    den=abc(2);
    P(3)=(Q(2)-abc(1)*P(2))/den;
    for i=3:n-1
        dd(i+1)=abc(3)/den;
        abc = BasisFuns(i+2,U(i+3),3,U);
        den=abc(2)-abc(1)*dd(i+1);
        P(i+1)=(R(i+1)-abc(1)*P(i))/den;
    end
    dd(n+1)=abc(3)/den;
    abc = BasisFuns(n+2,U(n+3),3,U);
    den=abc(2)-abc(1)*dd(n+1);
    P(n+1)=(Q(n)-abc(3)*P(n+2)-abc(1)*P(n))/den;
    for i=n-1:-1:2
        P(i+1)=P(i+1)-dd(i+2)*P(i+2);
    end
end