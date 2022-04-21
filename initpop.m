%%%%%%%%%%%%%%%%%%遗传算法子程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%初始化%%%%%%%%%%%%%%%%%%%%
function pop=initpop(popsize,chromlength)
    pop=round(rand(popsize,chromlength))
    %rand随机产生每个单元为{0，1}行数为popsize,列数为chromlength的矩阵
    %round对矩阵的每个单元进行元进行圆整，这样产生初始种群
end