%���Ƶ���ʱ�̸��ʷֲ�ͼ
x=1:24
 y=poisspdf(x,12)
 plot(x,y,'-ro')
 hold on
 x=linspace(0,1,100)
 y=poisspdf(x,12)
 fill(x,y,'r')
 hold on
 x=linspace(1,2,100)
 y=poisspdf(x,12)
 fill(x,y,'b')
 hold on
 x=linspace(2,3,100)
 y=poisspdf(x,12)
 fill(x,y,'r')
 x=linspace(3,4,100)
 y=poisspdf(x,12)
 fill(x,y,'b')
 hold on
 x=linspace(4,5,100)
 y=poisspdf(x,12)
 fill(x,y,'r')
 hold on
 x=linspace(5,6,100)
 y=poisspdf(x,12)
 fill(x,y,'b')
 hold on
 x=linspace(6,7,100)
 y=poisspdf(x,12)
 fill(x,y,'r')
 hold on
 x=linspace(19,20,100)
 y=poisspdf(x,12)
 fill(x,y,'r')
 hold on
 x=linspace(20,21,100)
 y=poisspdf(x,12)
 fill(x,y,'b')
 hold on
 x=linspace(21,22,100)
 y=poisspdf(x,12)
 fill(x,y,'r')
 hold on
 x=linspace(22,23,100)
 y=poisspdf(x,12)
 fill(x,y,'b')
 hold on
 x=linspace(23,24,100)
 y=poisspdf(x,12)
 fill(x,y,'r')
 hold off
 title('��������ʱ�̸��ʷֲ�')
xlabel('ʱ��')
ylabel('����')
 
 