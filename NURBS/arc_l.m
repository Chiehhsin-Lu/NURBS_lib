function l=arc_l(x,y,z)
%计算点序列长度
if size(x,1)~=size(y,1)||size(x,1)~=size(z,1)
    warning('size(x)~=size(y)~=size(z)');
end
if (size(x,1)==1)
    k=size(x,2);
else
    k=size(x,1);
end
l=0;
for i=1:k-1
   l=l+sqrt((x(i+1)-x(i))^2+(y(i+1)-y(i))^2+(z(i+1)-z(i))^2); 
end
end