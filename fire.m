
%CA driver
%
%forest fire
clf
clear all
n=100;
%燃烧率
Plightning = .000001;
%生长率
Pgrowth = .001; 
z=zeros(n,n);
o=ones(n,n);
veg=2*o;
sum=z;
%边界调节矩阵
cl=zeros(n,1);
l=zeros(1,n);
%image三维调色板
imh = image(cat(3,z,veg==2,z));
set(imh, 'erasemode', 'none')
axis equal
axis tight
% burning -> empty
% green -> burning if one neigbor burning or with prob=f (lightning)
% empty -> green with prob=p (growth)
% veg = {empty=0 burning=1 green=2}
 
 veg(3,2)=1;
for i=1:50002
%nearby fires?]
c=rand(n);%统一的一个随机矩阵 否则执行两次rand会产生不同结果
%查找附近燃烧源
sum = [cl,veg(1:n,[1:n-1])==1]+[veg(1:n,[2:n])==1,cl] + ...
[l;(veg([1:n-1], 1:n)==1)]+[(veg([2:n],1:n)==1);l] ;
%新递归的矩阵
veg =2*((veg==2)&(c>=Plightning)&(sum==0))+((veg==2) &(c<Plightning))...
    +0*(veg==1)+2*((veg==0)&(c<Pgrowth))+((veg==2)&(sum>0));  %加号之间均为互斥的事件 &与|连接的命题最好带括号
set(imh, 'cdata', cat(3,(veg==1),(veg==2),z) )
drawnow
end
