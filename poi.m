%����Poisson�ֲ������ܶ�ͼ
x=1:48
y1=poisspdf(x,14)
stem(x,y1,'ro')
hold on
y2=poisspdf(x,36)
stem(x,y2,'bo')
hold off
title('����ʱ�����뿪ʱ�̵�Poisson�ֲ������ܶ�ͼ')
xlabel('ʱ��')
ylabel('����')
legend('����ʱ��t1','�뿪ʱ��t2')