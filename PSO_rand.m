function [xm,fv]=PSO_rand(fitness,N,c1,c2,wmax,wmin,rande,M,D)
format long
%fitnessѧϰ����
%c1:ѧϰ����1
%c2:ѧϰ����2
%wmax:����Ȩ�����ֵ
%wmin:����Ȩ����Сֵ
%M:����������
%D:�����ռ�ά��
%N:��ʼ��Ⱥ�������Ŀ
%xm:Ŀ�꺯��ȡ��Сֵʱ���Ա���
%fv:Ŀ�꺯����Сֵ
%rande:���Ȩ�ط���
%%%%%%%%%%%%%%%%%%%%%%��ʼ����Ⱥ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=1:D
        x(i,j)=randn                %�����ʼ��λ��
        v(i,j)=randn                %�����ʼ���ٶ�
    end
end
%%%%%%%%%%%%%%%%%%%%%%�ȼ���������ӵ���Ӧ�ȣ�����ʼ��Pi��Pg%%%%%%%%%%%%%%%
for i=1:N
    p(i)=fitness(x(i,:))
    y(i,:)=x(i,:)
end
pg=x(N,:)                             %pgΪȫ������
for i=1:(N-1)
    if fitness(x(i,:))<fitness(pg)
        pg=x(i,:)
    end
end
%%%%%%%%%%%%%%%%%%%%%%������Ҫѭ�������չ�ʽ���ε���%%%%%%%%%%%%%%%%%%%%%%%%
for t=1:M
    for i=1:N
        miu=wmin+(wmax-wmin)*rand()
        w=miu+rande*randn()
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:))
        x(i,:)=x(i,:)+v(i,:)
        if fitness(x(i,:))<p(i)
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