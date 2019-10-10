function [P,m] = GlobalCurveInterp(n,Q,r,p,uk,U)
%算法A9.1 :对给定的n+1个点进行全局曲线插值
    m=n+p+1;
    %确定uk
    %确定节点矢量U
    %将数组A中所有元素初始化为零
    
    A_1=zeros(n+1,n+1);
    A_1_1=[];
    for i=0:n
        span=FindSpan(n,p,uk(i+1),U);
%         A(i+1,span-p+1)=BasisFuns(span,uk(i+1),p,U);
         a=BasisFuns(span,uk(i+1),p,U);
         A_1([i+1],[span-p+1:span-p+4])=a;
        A_1_1=[A_1_1;span-p+1];
        a_up=span-p+1-max(i-1,1);
        a_down=max(0,1-a_up);
        if i~=n
            A(i+1,:)=[zeros(1,a_up),a,zeros(1,a_down)];
        else
            A(i+1,:)=[a(2:end),0,0];
        end

    end
    [L,U_]=LUDecomposition(A,n+1,p-1);

    P=ForwardBackward(L,U_,n+1,p-1,Q);
%     for i=0:n
%         P(j+1)=sol(j+1);
%     end
end