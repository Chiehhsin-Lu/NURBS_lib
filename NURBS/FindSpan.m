function mid = FindSpan(n,p,u,U)
%�㷨A2.1���������u���ڽڵ�������±�
%���룺n,p,u,U
%���أ��ڵ������±�
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