%% subquestion 1
mdl_twolink
q1 = [0, 0];
q2 = [-47, 125];
t = [0:0.05:3];
[q, qd, qdd] = jtraj(deg2rad(q1), deg2rad(q2), t);
twolink.plot(q);

figure(1);
subplot(3,2,1);
plot(t, q(:,1));hold on;
plot(t, q(:,2)); legend("q1", "q2");
title("Joint Angels"); xlabel("Time"); ylabel("Angle")

subplot(3,2,2);
plot(t, qd(:,1));hold on;
plot(t, qd(:,2)); legend("q1", "q2");
title("Velocity"); xlabel("Time"); ylabel("Velocity")

subplot(3,2,3);
plot(t, qdd(:,1));hold on;
plot(t, qdd(:,2)); legend("q1", "q2");
title("Acceleration"); xlabel("Time"); ylabel("Acceleration")

subplot(3,2,4);
plot(t(1:end-1), diff(qdd(:,1)));hold on;
plot(t(1:end-1), diff(qdd(:,2))); legend("q1", "q2");
title("Jerk"); xlabel("Time"); ylabel("Jerk")

a1 = 1; a2 = 1; q1 = q(:, 1); q2 = q(:, 2);
x = a1*cos(q1)+a2*cos(q1+q2);
y = a1*sin(q1)+a2*sin(q1+q2);
subplot(3,2,5);
plot(x, y);
title("locus of the end effector"); xlabel("x"); ylabel("y")

%% subquestion 2
mdl_twolink
q1 = [0, 0];
q2 = [-47, 125];
t = [0:0.05:3];
[q, qd, qdd] = mtraj(@lspb, deg2rad(q1), deg2rad(q2), t);
twolink.plot(q);

figure(2);
subplot(3,2,1);
plot(t, q(:,1));hold on;
plot(t, q(:,2)); legend("q1", "q2");
title("Joint Angels"); xlabel("Time"); ylabel("Angle")

subplot(3,2,2);
plot(t, qd(:,1));hold on;
plot(t, qd(:,2)); legend("q1", "q2");
title("Velocity"); xlabel("Time"); ylabel("Velocity")

subplot(3,2,3);
plot(t, qdd(:,1));hold on;
plot(t, qdd(:,2)); legend("q1", "q2");
title("Acceleration"); xlabel("Time"); ylabel("Acceleration")

subplot(3,2,4);
plot(t(1:end-1), diff(qdd(:,1)));hold on;
plot(t(1:end-1), diff(qdd(:,2))); legend("q1", "q2");
title("Jerk"); xlabel("Time"); ylabel("Jerk")

a1 = 1; a2 = 1; q1 = q(:, 1); q2 = q(:, 2);
x = a1*cos(q1)+a2*cos(q1+q2);
y = a1*sin(q1)+a2*sin(q1+q2);
subplot(3,2,5);
plot(x, y);
title("locus of the end effector"); xlabel("x"); ylabel("y")

%% subquestion 3
% mdl_twolink
% T0 = SE3(2, 0.003403, 0);
% T1 = SE3(0.1084, 0.0878, 0);
% Ts = ctraj(T0, T1, 50);
% temp = Ts.transl;
% plot(temp(:,1), temp(:,2))
% 
% 
% x = temp(:, 1); y = temp(:, 2);
% q2 = real(acos((x.^2+y.^2-2)/2));
% a = sin(q2);
% a(20:end) = 2-a(20:end);
% q1 = atan(y./x)-atan(a/sqrt(x.^2+y.^2));
%a = atan(sin(q2)/sqrt(x.^2+y.^2))
%b = sin(q2)/sqrt(x.^2+y.^2)
%t = linspace(0,1,50);

%figure(3);
%subplot(2,2,1);
%plot(t, q1(:,1)); hold on;
%plot(t, q2); legend("q1", "q2");he
%title("Joint Angels"); xlabel("Time"); ylabel("Angle")
%twolink.plot([q1(:,1),q2])
%diff...

mdl_twolink
q0 = [0 0];
qf = [125 -47];
T0 = twolink.fkine(q0, 'deg');
T1 = twolink.fkine(qf, 'deg');
Ts = ctraj(T0,T1,50);
temp = Ts.transl;
q = twolink.ikine(Ts, 'mask', [1 1 0 0 0 0]);
twolink.plot(q)

q0 = deg2rad([0 0]);
qf = deg2rad([125 -47]);
t = linspace(0,1,50);

figure(3);
subplot(4,2,1);
plot(t, q(:,1));hold on;
plot(t, q(:,2)); legend("q1", "q2");
title("Joint Angels"); xlabel("Time"); ylabel("Angle")

subplot(3,2,2);
qd = [diff(q); 0, 0];
plot(t, qd(:,1));hold on;
plot(t, qd(:,2)); legend("q1", "q2");
title("Velocity"); xlabel("Time"); ylabel("Velocity")

subplot(3,2,3);
qdd = [diff(qd); 0, 0];
plot(t, qdd(:,1));hold on;
plot(t, qdd(:,2)); legend("q1", "q2");
title("Acceleration"); xlabel("Time"); ylabel("Acceleration")

subplot(3,2,4);
plot(t(1:end-1), diff(qdd(:,1)));hold on;
plot(t(1:end-1), diff(qdd(:,2))); legend("q1", "q2");
title("Jerk"); xlabel("Time"); ylabel("Jerk")

subplot(3,2,5);
plot(temp(:,1), temp(:,3));
title("locus of the end effector"); xlabel("x"); ylabel("y")
