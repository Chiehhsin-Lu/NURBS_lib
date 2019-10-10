function arc=arc_simpson(p,U,P,mid,u,u_i1,xi)
% simpson��ʽ��ȡ����
% p��    ����
% U��    �ڵ�����
% P��    ���Ƶ�
% mid;   �ڵ�����
% u:     ��ʼ�ڵ�
% u_i1:  ��ֹ�ڵ�
% xi:    �ƣ��������

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