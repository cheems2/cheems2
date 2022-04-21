%%%%%%%�Ŵ��㷨������%%%%%%%%%
%%%%%%%%%�������%%%%%%%%%%%%%
N=10           %ͣ��·�θ���
M=20            %��Ⱥ����
C=100            %��������
C_old=C
m=2              %��Ӧֵ��һ����̭����ָ��
Pc=0.4           %�������
Pmutation=0.2    %�������
%%%%%%%%���ɽڵ�֮��ľ������%
D
%%%%%%%���ɳ�ʼȺ��%%%%%%%%%%%%
popm=zeros(M,N)
for i=1:M
    popm(i,:)=randperm(N)
end
%%%%%%%���ѡ��һ����Ⱥ%%%%%%%%
R=popm(1,:)
%%%%%%��ʼ����Ⱥ������Ӧ����%%%%
fitness=zeros(M,1)
len=zeros(M,1)
for i=1:M
    len(i,1)=myLength(D,popm(i,:))
end
maxlen=max(len)
minlen=min(len)
fitness=fit(len,m,maxlen,minlen)
rr=find(len==minlen)
R=popm(rr(1,1),:)
for i=1:N
    fprintf('%d',R(i))
end
fprintf('\n')
fitness=fitness/sum(fitness)
distance_min=zeros(C+1,1)            %���ε�������С��Ⱥ����
while C>=0
    fprintf('������%d��\n',C)
%%%%%%%%%%ѡ�����%%%%%%%%%%%%%%
nn=0
for i=1:size(popm,1)
    len_1(i,1)=myLength(D,popm(i,:))
    jc=rand*0.3
    for j=1:size(popm,1)
        if fitness(j,1)>=jc
            nn=nn+1
            popm_sel(nn,:)=popm(j,:)
            break
        end
    end
end
%%%%%ÿ��ѡ�񶼱���һ�����ŵ���Ⱥ%
popm_sel=popm_sel(1:nn,:)
[len_m len_index]=min(len_1)
popm_sel=[popm_sel;popm(len_index,:)]
%%%%%�������%%%%%%
nnper=randperm(nn)
A=popm_sel(nnper(1),:)
B=popm_sel(nnper(2),:)
for i=1:nn*Pc
    [A,B]=cross(A, B)
    popm_sel(nnper(1),:)=A
    popm_sel(nnper(2),:)=B
end
%%%%%%%%%%%%%�������%%%%%%%%%%
for i=1:nn
    pick=rand
    while pick==0
        pick=rand
    end
    if pick<=Pmutation
        popm_sel(i,:)=mutation2(popm_sel(i,:))
    end
end
%%%%%%%%%%%%%����Ӧ�Ⱥ���%%%%%
NN=size(popm_sel,1)
len=zeros(NN,1)
for i = 1:NN
    len(i,1)=myLength(D,popm_sel(i,:))
end
maxlen=max(len)
minlen=min(len)
distance_min(C+1,1)=minlen
fitness=fit(len,m,maxlen,minlen)
rr=find(len==minlen)
fprintf('minlen=%d\n',minlen)
R=popm_sel(rr(1,1),:)
for i = 1:N
    fprintf('%d',R(i))
end
fprintf('\n')
popm=[]
popm=popm_sel
C=C-1
end
%������Ӧ�Ⱥ���
figure(1)
plot(fitness)
xlabel('��������')
ylabel('��Ⱥ��Ӧ��')
title('��Ⱥ��Ӧ�ȱ仯���')
%������̾���仯���
figure(2)
plot(distance_min)
xlabel('��������')
ylabel('��̾���')
title('��̾���仯���')
