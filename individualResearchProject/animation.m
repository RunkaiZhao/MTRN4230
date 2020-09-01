% Author： Runkai Zhao
% zID: z5146927
% Time: 24/8/2020

q0 = [0 0 0];
qf = [pi, 5, 5];
T = 0:0.05:6;
[q,qd,qdd] = jtraj(q0,qf,T);

L(1) = Link('revolute', 'a', 0, 'alpha', 0, 'd', 0.5);
L(2) = Link('prismatic', 'a', 0, 'alpha', -pi/2, 'theta', 0);
L(3) = Link('prismatic', 'a', 0, 'alpha', 0, 'theta', 0);
cylRobot = SerialLink(L, 'name', 'RPP');

t = cylRobot.fkine(q); % use the forward kinematics to get locations of end-effect
q = cylRobot.ikine(t, 'mask', [1 1 1 0 0 0]); % use inverse kinematics to figure out the joint angles and distances

cylRobot.plotopt = {'workspace', [-1 1 -1 1 -1/5 1]*8,'tilesize',1};
figure(1); title("cylindrical manipulator");
cylRobot.plot(q); % animate the robot arm based on the joint angles and distances.