function [x, y] =GenerateCircle(Xcenter,Ycenter,r,IniAngle)
%根据圆的中心点、半径生成圆形的多边形
%李长圣 2018年01月07日修改
%修改变量名
%李长圣 2015年03月15日修改
%施云涛 2008年10月22日
%输入：（Xcenter,Ycenter）为中心点坐标，r半径
% 示例：
% PlotCircle(0,0,3,5) %圆心(0,0), 半径3, 初始角度5°
% 输出多边形坐标 [x y]
    radian=IniAngle/180*3.1415926;
    t1=(radian+0):0.5:(radian+pi);
    t2=(radian+pi):0.5:(radian+2*pi);
    z1=exp(i*t1);
    z2=exp(i*t2);
    z1=(r*real(z1)+i*r*imag(z1));
    z2=(r*real(z2)+i*r*imag(z2));
    z1=z1+Xcenter+Ycenter*i;
    z2=z2+Xcenter+Ycenter*i;
    %plot(z1,'r*')
    %hold on
    %plot(z2,'b*')
    %hold on;
    %grid on
    %axis equal
    z=[z1 z2];
    % 提取实部和虚部
    z_real = real(z);
    z_imag = imag(z);
  % 构造多边形
    x = [z_real z_real(:,1)];
    y = [z_imag z_imag(:,1)];
 
end