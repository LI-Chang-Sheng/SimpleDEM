function [x, y] =GenerateCircle(Xcenter,Ycenter,r,IniAngle)
%����Բ�����ĵ㡢�뾶����Բ�εĶ����
%�ʥ 2018��01��07���޸�
%�޸ı�����
%�ʥ 2015��03��15���޸�
%ʩ���� 2008��10��22��
%���룺��Xcenter,Ycenter��Ϊ���ĵ����꣬r�뾶
% ʾ����
% PlotCircle(0,0,3,5) %Բ��(0,0), �뾶3, ��ʼ�Ƕ�5��
% ������������ [x y]
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
    % ��ȡʵ�����鲿
    z_real = real(z);
    z_imag = imag(z);
  % ��������
    x = [z_real z_real(:,1)];
    y = [z_imag z_imag(:,1)];
 
end