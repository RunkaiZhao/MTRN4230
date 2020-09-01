zero = zeros(3,1);
syms theta1 alpha1 a1 d1 theta2 alpha2 a2 d2 theta3 alpha3 a3 d3 theta4 alpha4 a4 d4
T = [ cos(theta1 + theta2 - theta4),  sin(theta1 + theta2 - theta4),  0, a2*cos(theta1 + theta2) + a1*cos(theta1);
      sin(theta1 + theta2 - theta4), -cos(theta1 + theta2 - theta4), 0, a2*sin(theta1 + theta2) + a1*sin(theta1);
      0, 0, -1,-d3-d4;
      0, 0,  0, 1];
Jacob1 = [cross(T(1:3,3), T(1:3,4));T(1:3,3)];
Jacob2 = [cross(T(1:3,3), T(1:3,4));T(1:3,3)];
Jacob3 = [T(1:3,3);zero];
Jacob4 = [cross(T(1:3,3), T(1:3,4));T(1:3,3)];
J = [Jacob1 Jacob2 Jacob3 Jacob4];