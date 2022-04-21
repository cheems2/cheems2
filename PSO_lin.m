function [xm,fv]=PSO_lin(fitness,N,c1,c2,wmax,wmin,M,D)
format long
%fitness:学习函数
%c1:学习因子1
%c2:学习因子2
%wmax:惯性权重最大值
%wmin:惯性权重最小值
%M:最大迭代次数
%D:搜索空间维数
%N:初始化种群个体数目
%xm:目标函数取最小值时的自变量
%fv:目标函数最小值
%%%%%%%%%%%%%%%%%%%%%%%初始化种群个体%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=1:D
        x(i,j)=randn                %随机初始化位置
        v(i,j)=randn                %随机初始化速度  
    end
end
%%%%%%%%%%%%%%%%%%%%%%先计算各个粒子的适应度，并初始化pi和pg%%%%%%%%%%%%%%%%
for i=1:N
    p(i)=fitness(x(i,:))
    y(i,:)=x(i,:)
end
pg=x(N,:)                           %pg为全局最优
for i=1:(N-1)
    if fitness(x(i,:))<fitness(pg)
        pg=x(i,:)
    end
end
%%%%%%%%%%%%%%%%%%%%%%%主循环，按照公式依次迭代%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for t=1:M
    for i=1:N
        w=wmax-(t-1)*(wmax-wmin)/(M-1)
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:))
        x(i,:)=x(i,:)+v(i,:)
        if fitness (x(i,:))<p(i)
            p(i)=fitness(x(i,:))
            y(i,:)=x(i,:)
        end
        if p(i)<fitness(pg)
            pg=y(i,:)
        end
    end
    pbest(t)=fitness(pg)
end
xm=pg'
fv=fitness(pg)

    