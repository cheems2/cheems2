
%CA driver
%
%forest fire
clf
clear all
n=100;
%ȼ����
Plightning = .000001;
%������
Pgrowth = .001; 
z=zeros(n,n);
o=ones(n,n);
veg=2*o;
sum=z;
%�߽���ھ���
cl=zeros(n,1);
l=zeros(1,n);
%image��ά��ɫ��
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
c=rand(n);%ͳһ��һ��������� ����ִ������rand�������ͬ���
%���Ҹ���ȼ��Դ
sum = [cl,veg(1:n,[1:n-1])==1]+[veg(1:n,[2:n])==1,cl] + ...
[l;(veg([1:n-1], 1:n)==1)]+[(veg([2:n],1:n)==1);l] ;
%�µݹ�ľ���
veg =2*((veg==2)&(c>=Plightning)&(sum==0))+((veg==2) &(c<Plightning))...
    +0*(veg==1)+2*((veg==0)&(c<Pgrowth))+((veg==2)&(sum>0));  %�Ӻ�֮���Ϊ������¼� &��|���ӵ�������ô�����
set(imh, 'cdata', cat(3,(veg==1),(veg==2),z) )
drawnow
end
