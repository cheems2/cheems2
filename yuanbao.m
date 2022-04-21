close;clear;clc
%������ʼ��
n = 250;
chushiqianfuzhe = 5;
% �ھӲ��� 8�ھ�ʽ

% 0 �������׸���
% 1 ������Ǳ����
% 2 ����������
% 3 ������������
% 4 ������������
% 5 :  ��������ֵ

p01 = 0.1;  %Ǳ���߶��׸��ߵĸ���
p02 = 0.2;  %�����߶��׸��ߵĸ���
p10 = 0.005; %������
p24 = 0.001; %������
p20 = 0.04; %�Ի����������� �˹�Ӱ��
p_10 = 0.06; %��Ǳ����������
k = 1; %����ϵ�� Խ��Խ˵������ǰ���ݷ�Խ��

rand('state',sum(clock));
present = 5*ones(n+2);
present(2:n+1,2:n+1) = 0;
while chushiqianfuzhe ~= sum(sum(present(2:n+1,2:n+1)))
    present(2+floor(n*rand),2+floor(n*rand)) = 1;
end
%Ǳ����ʱ������
T = zeros(n+2);

for i = 1:10000
    J  = 5*ones(n+2);
    to_qianfuzhe = zeros(n+2);
    
    for r = 2:n+1
        for l = 2:n+1
            %����Ϊ�׸���
            if present(r,l) == 0  % ֻ���ⲿӰ�� �ʿ�ʡ��
                J(r,l) = 0;
            elseif present(r,l) == 1           %����Ӱ�� �Լ� Ӱ���ⲿ
                temp = exp(-k*(12 - T(r,l))/T(r,l)); %�ù�ʽ������ǰ��Ǳ��ʱ��
                % ����Ӱ��
                if temp > rand                   %��Ϊ������
                    J(r,l) = 2;
                    T(r,l) = 0;
                elseif rand < p10               %��Ϊ������
                    J(r,l) = 3;
                    T(r,l) = 0;
                elseif rand <  p_10             %��Ϊ�׸���
                    J(r,l) = 0;
                    T(r,l) = 0;
                else 
                    J(r,l) = 1;
                end
                % Ӱ���ھ�
                if present(r-1,l-1) == 0
                    if rand < p01
                        to_qianfuzhe(r-1,l-1) = 1;
                    end
                end
                if present(r-1,l) == 0
                    if rand < p01
                        to_qianfuzhe(r-1,l) = 1;
                    end
                end
                if present(r-1,l+1) == 0
                    if rand < p01
                        ro_qianfuzhe(r-1,l+1) = 1;
                    end
                end
                if present(r,l+1) == 0
                    if rand < p01
                        to_qianfuzhe(r,l+1) = 1;
                    end
                end
                if present(r+1,l+1) == 0
                    if rand < p01
                        to_qianfuzhe(r+1,l+1) = 1;
                    end
                end
                if present(r+1,l) == 0
                    if rand < p01
                        to_qianfuzhe(r+1,l) = 1;
                    end
                end
                if present(r+1,l-1) == 0
                    if rand < p01 
                        to_qianfuzhe(r+1,l-1) = 1;
                    end
                end    
                if present(r,l-1) == 0
                    if rand < p01 
                        to_qianfuzhe(r,l-1) = 1;
                    end
                end
                
          elseif present(r,l) == 2 % ����Ӱ�� �Լ� Ӱ���ھ�
              % ����Ӱ��
                if p24 > rand                   %��Ϊ������
                    J(r,l) = 4;
                elseif p20 > rand           %��Ϊ�׸���
                    J(r,l) = 0;
                else
                    J(r,l) = 2;
                end
                    
                %Ӱ���ھ�
                if present(r-1,l-1) == 0
                    if rand < p02
                        to_qianfuzhe(r-1,l-1) = 1;
                    end
                end
                if present(r-1,l) == 0
                    if rand < p02
                        to_qianfuzhe(r-1,l) = 1;
                    end
                end
                if present(r-1,l+1) == 0
                    if rand < p02
                        ro_qianfuzhe(r-1,l+1) = 1;
                    end
                end
                if present(r,l+1) == 0
                    if rand < p02
                        to_qianfuzhe(r,l+1) = 1;
                    end
                end
                if present(r+1,l+1) == 0
                    if rand < p02
                        to_qianfuzhe(r+1,l+1) = 1;
                    end
                end
                if present(r+1,l) == 0
                    if rand < p02
                        to_qianfuzhe(r+1,l) = 1;
                    end
                end
                if present(r+1,l-1) == 0
                    if rand < p02 
                        to_qianfuzhe(r+1,l-1) = 1;
                    end
                end
                if present(r,l-1) == 0
                    if rand < p02 
                        to_qianfuzhe(r,l-1) = 1;
                    end
                end
                    
            %����Ϊ������
            elseif present(r,l) == 3
                J(r,l) = 3;
            %����Ϊ������
            elseif present(r,l) == 4
                J(r,l) = 4;
            end
        end
    end
    % �˴�TΪ0-N���� N���� ��Ϊ��һ��Ǳ���߲�����һ��ҲΪǱ���ߵ�Ǳ����ʱ��
    
    
    %�׸���ת��ΪǱ����
    J(present == 0 & to_qianfuzhe) =  1;
    % ���²���Ǳ��ʱ��
    T(find(T ~= 0)) = T(find(T ~= 0)) + 1; 
    T(present == 0 & to_qianfuzhe) = 1; %��һ�β�ΪǱ���ߣ���α�ΪǱ���ߵ�Ǳ����ʱ��
    present = J; %����present����
    
    % ����Ϊ������
    R = zeros(n);
    G = zeros(n);
    B = zeros(n);
    yiganzhe(i) = sum(sum(J == 0));
    qianfuzhe(i) = sum(sum(J == 1));
    huanbingzhe(i) = sum(sum(J == 2));
    mianyizhe(i) = sum(sum(J == 3));
    siwangzhe(i) = sum(sum(J  == 4));
    for r = 1:n
        for l = 1:n 
            if J(r+1,l+1) == 0
                B(r,l) = 1;
            elseif J(r+1,l+1) == 1
                R(r,l) = 160/255;
                G(r,l) = 32/255;
                B(r,l) = 240/255;
            elseif J(r+1,l+1) == 2
                R(r,l) = 1;
            elseif J(r+1,l+1) == 3
                G(r,l) = 1;
            end
      end
    end
  figure(1);
  image(cat(3,R,G,B));
  drawnow
  figure(2);
  subplot(321),temp = plot(qianfuzhe,'-');set(temp,'color',[160/255 32/255 240/255]),
  title(['ʱ��: ',num2str(i),' Ǳ����']);
  subplot(322),plot(huanbingzhe,'r-'),title(['ʱ��: ',num2str(i),' ������']);
  subplot(323),plot(mianyizhe,'g-'),title(['ʱ��: ',num2str(i),' ������']);
  subplot(324),plot(siwangzhe,'k-'),title(['ʱ��: ',num2str(i),' ������']);
  subplot(313),plot(yiganzhe,'b-'),title(['ʱ��: ',num2str(i),' �׸���']);
  pause(0.001);
end
