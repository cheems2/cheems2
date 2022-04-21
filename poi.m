%绘制Poisson分布概率密度图
x=1:48
y1=poisspdf(x,14)
stem(x,y1,'ro')
hold on
y2=poisspdf(x,36)
stem(x,y2,'bo')
hold off
title('到达时刻与离开时刻的Poisson分布概率密度图')
xlabel('时刻')
ylabel('概率')
legend('到达时刻t1','离开时刻t2')