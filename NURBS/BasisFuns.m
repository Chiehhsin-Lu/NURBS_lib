function N = BasisFuns(i,u,p,U)
% 算法A2.2：计算所有非零B样条基函数的值
% 输入：mid,u,p,U
% 输出：N
    N(1)=1.0;
    my_left=0;my_right=0;
    
    for j=1:p
        my_left(j+1)=u-U(i+2-j);
        my_right(j+1)=U(i+j+1)-u;
        saved=0;
        for r=0:j-1
            temp=N(r+1)/(my_right(r+2)+my_left(j-r+1));
            N(r+1)=saved+my_right(r+2)*temp;
            saved=my_left(j-r+1)*temp;
        end
        N(j+1)=saved;
    end
end