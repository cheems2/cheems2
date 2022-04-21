clear all;
for i = 0:0.1:10*pi
    t=0+i:0.01:2*pi+i
    for j=0:pi/6:2*pi
        x=t.^3.*exp(-t).*sin(3*t+rand()/2)
        y=t.^3.*exp(-t).*cos(3*t+j+rand()/2)
        z=1./t.^2
        plot3(x,y,z)
        grid on;
    end
    hold off;
    pause(0.1)
end