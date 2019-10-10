function mid = FindSpan(n,p,u,U)
%算法A2.1：计算参数u所在节点区间的下标
%输入：n,p,u,U
%返回：节点区间下标
    if u==U(n+2)
        mid=n;
    else
        low=p;high=n+1;
        mid=floor(double(low+high)/2);
        while (u<U(mid+1)||u>=U(mid+2))
            if u<U(mid+1)
                high=mid;
            else
                low=mid;
            end
            mid=floor(double(low+high)/2);
        end
    end
end