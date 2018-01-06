%Modified by lichangsheng@nanjing university 2018/01/06
%add GenerateCircle()
%Modified by lichangsheng@nanjing university 2014/07/11
%lichangsheng@nanjing university 2013/6/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a disk fall under gravity (*_*)
% open matlab click run , just for fun!
% MATLAB R2017a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
m  = 1;%小球质量    mass
r  = 1;%小球的半径  rad
g  = -1;%重力加速度 acceleration of gravity
k  = 40;%弹簧的弹性系数 stiffness
t  = 0;%起始时间 inital time
dt = 0.02;%单位时间 it is too big now, just for fun!
v  = 0;%小球的初始速度 disk's inital velocity
y1 = 2;%小球的起始位置 disk's inital position
y0 = 0;%地面的位置 ground
viscous = 0;%粘滞衰减系数
F = m*g; %gravity

filename='a_free_falling_disk.gif';
%inital state
subplot(1,2,1)
hold on;
axis equal;
grid on;
href  = plot([0 0],[-1 3]); 
[x, y] = GenerateCircle(0,y1,r,0);
hfig   = plot(x,y);
drawnow;

for i=1:300
    L=abs(y1-y0);
    if L<r
        h=r-L;
        F=m*g+k*h-viscous*v;
    else
        h=0;
        F=m*g-viscous*v;
    end
    v  = v+dt*F/m;
    y1 = y1+dt*v;
    t  = t+dt;
    fprintf('t:%f\n',t);
    
    %plot disk right now
    [x, y] = GenerateCircle(0,y1,r,0);
    set(hfig ,'xdata',x,'ydata',y);
    set(href,'xdata',[0 0],'ydata',[-1 3]);
    if (mod(i,20) ==0 ) 
        drawnow;
    end

    %plot disk's position
    subplot(1,2,2) 
    hold on;
    grid on;
    plot(t,y1,'r*')
    legend('disk''s position') 

    %write to gif
    f = getframe(gcf); 
    [IM,map] = frame2im(f);
    if isempty(map)
        [IM,map] = rgb2ind(IM,256);
    end
    if i == 1
        imwrite(IM,map,filename,'gif', 'Loopcount',inf,'DelayTime',0.00001);
    else
        imwrite(IM,map,filename,'gif','WriteMode','append','DelayTime',0.00001);
    end
end

