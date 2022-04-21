close;clear;clc
%参数初始化
n = 250;
chushiqianfuzhe = 5;
% 邻居采用 8邻居式

% 0 ：代表易感者
% 1 ：代表潜伏者
% 2 ：代表患病者
% 3 ：代表免疫者
% 4 ：代表死亡者
% 5 :  代表虚拟值

p01 = 0.1;  %潜伏者对易感者的概率
p02 = 0.2;  %患病者对易感者的概率
p10 = 0.005; %免疫率
p24 = 0.001; %死亡率
p20 = 0.04; %对患病者治愈率 人工影响
p_10 = 0.06; %对潜伏者治愈率
k = 1; %患病系数 越大越说明病毒前期蛰伏越长

rand('state',sum(clock));
present = 5*ones(n+2);
present(2:n+1,2:n+1) = 0;
while chushiqianfuzhe ~= sum(sum(present(2:n+1,2:n+1)))
    present(2+floor(n*rand),2+floor(n*rand)) = 1;
end
%潜伏者时间序列
T = zeros(n+2);

for i = 1:10000
    J  = 5*ones(n+2);
    to_qianfuzhe = zeros(n+2);
    
    for r = 2:n+1
        for l = 2:n+1
            %以下为易感者
            if present(r,l) == 0  % 只受外部影响 故可省略
                J(r,l) = 0;
            elseif present(r,l) == 1           %自我影响 以及 影响外部
                temp = exp(-k*(12 - T(r,l))/T(r,l)); %该公式代表病毒前期潜伏时长
                % 自我影响
                if temp > rand                   %变为病患者
                    J(r,l) = 2;
                    T(r,l) = 0;
                elseif rand < p10               %变为免疫者
                    J(r,l) = 3;
                    T(r,l) = 0;
                elseif rand <  p_10             %变为易感者
                    J(r,l) = 0;
                    T(r,l) = 0;
                else 
                    J(r,l) = 1;
                end
                % 影响邻居
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
                
          elseif present(r,l) == 2 % 自我影响 以及 影响邻居
              % 自我影响
                if p24 > rand                   %变为死亡者
                    J(r,l) = 4;
                elseif p20 > rand           %变为易感者
                    J(r,l) = 0;
                else
                    J(r,l) = 2;
                end
                    
                %影响邻居
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
                    
            %以下为免疫者
            elseif present(r,l) == 3
                J(r,l) = 3;
            %以下为死亡者
            elseif present(r,l) == 4
                J(r,l) = 4;
            end
        end
    end
    % 此处T为0-N矩阵 N代表 仅为上一次潜伏者并且这一次也为潜伏者的潜伏者时间
    
    
    %易感者转变为潜伏着
    J(present == 0 & to_qianfuzhe) =  1;
    % 更新病毒潜伏时间
    T(find(T ~= 0)) = T(find(T ~= 0)) + 1; 
    T(present == 0 & to_qianfuzhe) = 1; %上一次不为潜伏者，这次变为潜伏者的潜伏者时间
    present = J; %更新present矩阵
    
    % 以下为输出结果
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
  title(['时间: ',num2str(i),' 潜伏者']);
  subplot(322),plot(huanbingzhe,'r-'),title(['时间: ',num2str(i),' 患病者']);
  subplot(323),plot(mianyizhe,'g-'),title(['时间: ',num2str(i),' 免疫者']);
  subplot(324),plot(siwangzhe,'k-'),title(['时间: ',num2str(i),' 死亡者']);
  subplot(313),plot(yiganzhe,'b-'),title(['时间: ',num2str(i),' 易感者']);
  pause(0.001);
end
