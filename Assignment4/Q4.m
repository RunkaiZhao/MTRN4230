% Get the jocabian matrix, referring the codes done on Assignment 3
syms theta1 alpha1 a1 d1
T_0_1 = [cos(theta1), -sin(theta1), 0, a1*cos(theta1);
         sin(theta1), cos(theta1), 0, a1*sin(theta1);
         0, 0, 1, 0;
         0, 0, 0, 1];

syms theta2 alpha2 a2 d2
T_1_2 = [cos(theta2), sin(theta2), 0, a2*cos(theta2);
         sin(theta2), -cos(theta2), 0, a2*sin(theta2);
         0, 0, -1, 0;
         0, 0, 0, 1];
    
syms theta3 alpha3 a3 d3
T_2_3 = [1, 0, 0, 0;
         0, 1, 0, 0;
         0, 0, 1, d3;
         0, 0, 0, 1];
     
syms theta4 alpha4 a4 d4
T_3_4 = [cos(theta4), -sin(theta4), 0, 0;
         sin(theta4), cos(theta4), 0, 0;
         0, 0, 1, d4;
         0, 0, 0, 1];
  
T_0_4 = T_0_1*T_1_2*T_2_3*T_3_4;
T_0_3 = T_0_1*T_1_2*T_2_3;
T_0_2 = T_0_1*T_1_2;
T_0_4 = simplify(T_0_4);
T_0_3 = simplify(T_0_3);
T_0_2 = simplify(T_0_2);
T_0_1 = simplify(T_0_1);

k = [0;0;1];
O_0_0 = [0;0;0];
O_0_4 = [T_0_4(1:3, 4)];
O_0_3 = [T_0_3(1:3, 4)];
O_0_1 = [T_0_1(1:3, 4)];

% generate the appropriate matrix
Jw1 = [[0;0;1], zeros(3,1), zeros(3,1), zeros(3,1)];
Jw2 = [[0;0;1], T_0_1(1:3, 3), zeros(3,1), zeros(3,1)];
Jw3 = [[0;0;1], T_0_1(1:3, 3), zeros(3,1), zeros(3,1)];
Jw4 = [[0;0;1], T_0_1(1:3, 3), zeros(3,1), T_0_3(1:3, 3)];
Jv1 = [cross(k, (O_0_4-O_0_0)), zeros(3,1), zeros(3,1), zeros(3,1)];
Jv2 = [cross(k, (O_0_4-O_0_0)), cross(T_0_1(1:3, 3), (O_0_4-O_0_1)), zeros(3,1), zeros(3,1)];
Jv3 = [cross(k, (O_0_4-O_0_0)), cross(T_0_1(1:3, 3), (O_0_4-O_0_1)), T_0_2(1:3, 3), zeros(3,1)];
Jv4 = [cross(k, (O_0_4-O_0_0)), cross(T_0_1(1:3, 3), (O_0_4-O_0_1)), T_0_2(1:3, 3), cross(T_0_3(1:3, 3), (O_0_4-O_0_3))];

% generate the joint angles and displacement as joint variables.
q = [theta1; theta2; d3; theta4];
% generate the derivative od joint variables w.r.t. time
syms dtheta1 dtheta2 dd3 dtheta4
dfq = [dtheta1; dtheta2; dd3; dtheta4];

% linear velocity kinetic
syms m1 m2 m3 m4 
temp1 = m1*Jv1'*Jv1 + m2*Jv2'*Jv2 + m3*Jv3'*Jv3 + m4*Jv4'*Jv4;
LinearKinetic = (1/2)*dfq'*temp1*dfq;

% angualr velocity kinetic
syms I1 I2 I3 I4
R2 = T_0_1(1:3, 1:3);
R3 = T_0_2(1:3, 1:3);
R4 = T_0_3(1:3, 1:3);
rotationK1 = Jw1'*I1*Jw1;
rotationK2 = Jw2'*R2*I2*R2'*Jw2;
rotationK3 = Jw3'*R3*I3*R3'*Jw3;
rotationK4 = Jw4'*R4*I4*R4'*Jw4;
temp2 = rotationK1 + rotationK2 + rotationK3 + rotationK4;
RotationalKinetic = (1/2)*dfq'*temp2*dfq;

% subquestion a&b: D matrix 4x4
D = temp1 + temp2;

% subquestion c: C matrix, referring to the Christoffel Symbols of the first kind equation
C = sym('a', [4 4 4]);
for k = 1:4
    for j = 1:4
        for i = 1:4
            C(i,j,k) = (1/2)*(diff(D(k,j), q(i)) + diff(D(k,i), q(j)) - diff(D(i,j), q(k)));
        end
    end
end

% subquestion d: the overall kinetic
K = LinearKinetic + RotationalKinetic;

% subquestion e: potential energy
P = (m3 + m4)*d3*9.81;

% subquestion f: g matrix
g1 = diff(P, theta1);
g2 = diff(P, theta2);
g3 = diff(P, d3);
g4 = diff(P, theta4);
g = [g1; g2; g3; g4];


