function y=bubble_sort(x)
% %ð���㷨��
x_len=length(x);%�����������ȣ�Ϊ������׼��
for i=1:x_len-1%�ظ���ѭ����ֻ�Ǳ�֤ѭ�����������ı�
 for j=1:x_len-i%��ѭ�����ӵ�һ�����ֿ�ʼ��ÿ�����������ֱȽϣ��������ǰ�棡
if(x(j)>x(j+1))
[x(j),x(j+1)]=swap(x(j),x(j+1));%���ú���swap�����������ֵ�λ�á�
end
 end
disp([num2str(i),'.Sort:x=',num2str(x)]);%��ÿ�����������
end
y=x;
end
%% ��������
function [a,b]=swap(x,y)
a=y;
b=x;
end

