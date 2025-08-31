%create rotation matrix
theta = pi/6; % 旋转角 30°
Rx = [1 0 0;
      0 cos(theta) -sin(theta);
      0 sin(theta) cos(theta)];

Ry = [cos(theta) 0 sin(theta);
      0 1 0;
      -sin(theta) 0 cos(theta)];

Rz = [cos(theta) -sin(theta) 0;
      sin(theta)  cos(theta) 0;
      0 0 1];

% 先绕 Z，再绕 Y，再绕 X
R = Rz * Ry * Rx;

%create homogeneous transformation matrix
p = [1; 2; 3]; % 平移向量
T = [R p;
     0 0 0 1];

x_local = [1; 0; 0; 1];  % 齐次坐标
x_world = T * x_local

% 画出坐标系
figure; hold on; axis equal; grid on;
% 原始坐标系
quiver3(0,0,0,1,0,0,'r','LineWidth',2);
quiver3(0,0,0,0,1,0,'g','LineWidth',2);
quiver3(0,0,0,0,0,1,'b','LineWidth',2);

% 变换后的坐标系
O = T(1:3,4); % 新坐标原点
quiver3(O(1),O(2),O(3),R(1,1),R(2,1),R(3,1),'r--','LineWidth',2);
quiver3(O(1),O(2),O(3),R(1,2),R(2,2),R(3,2),'g--','LineWidth',2);
quiver3(O(1),O(2),O(3),R(1,3),R(2,3),R(3,3),'b--','LineWidth',2);
xlabel('X'); ylabel('Y'); zlabel('Z');
title('坐标系变换可视化');
