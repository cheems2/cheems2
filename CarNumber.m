%%%%%%%%%随机产生到达的车辆数%%%%%%%%%%%
function X = CarNumber
%产生一个到达车辆数的随机数
Car=0:12 %到达车数的取值范围
Prob=[0.05,0.05,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.05,0.05,0.05,0.05]
%到达车数概率分布
n=length(Prob)
Qu=zeros(1,n+1)
Qu(1)=0
for i = 1:n
    Qu(i+1)=Qu(i)+Prob(i)
    %产生概率区间
end
Qu(n+1)=1.01
%将最后一个数值超过1，以便后面的随机数r取到1
r=rand(1) %产生一个[0,1]随机变量
for i = 1:n
    if(r>=Qu(i)&&r<Qu(n+1))
        X=Car(i)
    end
end
return