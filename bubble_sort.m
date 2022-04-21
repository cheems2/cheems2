function y=bubble_sort(x)
% %冒泡算法：
x_len=length(x);%度量数量长度，为排序做准备
for i=1:x_len-1%重复内循环，只是保证循环次数发生改变
 for j=1:x_len-i%内循环，从第一个数字开始，每相邻两个数字比较，大的排在前面！
if(x(j)>x(j+1))
[x(j),x(j+1)]=swap(x(j),x(j+1));%调用函数swap交换两个数字的位置。
end
 end
disp([num2str(i),'.Sort:x=',num2str(x)]);%将每次排序结果输出
end
y=x;
end
%% 交换函数
function [a,b]=swap(x,y)
a=y;
b=x;
end

