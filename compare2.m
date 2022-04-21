plot(T,yield1,'r*')
line(T,yield1,'Color','b')
hold on
plot(T,yield2,'b*')
line(T,yield2,'Color','r')
xlabel('温度℃')
ylabel('c4烯烃选择性(%)')
legend('装料方式1','','装料方式2','')
title('相同反应条件下装料方式C4烯烃选择性的变化')