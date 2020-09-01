%% Referring to the given smaple code from Whitty 

close all; clear variables; clc;
%dbstop if error
scrsz = get(groot,'ScreenSize'); % Get screen size for plotting

% Construct a 2-link simple planar manipulator, using section 7.2.1 of
% Corke. See 'Tutorial problem 1' in the lecture notes for Kinematics 3.
L(1) = Link([0 0 0.5 0]);
L(2) = Link([0 0 0.5 0]);
one_link = SerialLink(L(1), 'name', 'one link');
two_link = SerialLink(L, 'name', 'two link');
q1 = [0, 0];
q2 = [45, 170]/180*pi;
q3 = [45, -170]/180*pi;
q4 = [-45, -170]/180*pi;
% Define matrix over which configuration space will be sampled
n1 = 100;
min1 = -pi;
max1 = pi;
n2 = 100;
min2 = -150/180*pi;
max2 = 150/180*pi;
angles1 = min1:(max1 - min1)/(n1 - 1):max1;
angles2 = min2:(max2 - min2)/(n2 - 1):max2;
config_space_binary = zeros(n1, n2);

% Limits on range of motion in Cartesian plan
y_top = 0.6;
y_bottom = 0;
figure(1)
two_link.plot(q1)
patch( [1 -1 -1 1] , [0 0 0 0], [1 1 -1 -1], [1 1 -1 -1]);
patch( [1 -1 -1 1] , [0.6 0.6 0.6 0.6], [1 1 -1 -1], [1 1 -1 -1]);

%% Generate discretised plot of joint space 
for i = angles1
    % Check position at end of first link
    [x1, y1, z1] = transl(one_link.fkine(i));
    for j = angles2
        % If position of first link invalid, flag it.
        if(y1 < y_bottom || y1 > y_top) 
            index_x = angle2cell(i, min1, max1, n1);
            index_y = angle2cell(j, min2, max2, n2);
            config_space_binary(index_x, index_y) = 1;
            continue;
        end
        % Check position at end of second link
        [x2, y2, z2] = transl(two_link.fkine([i, j]));
        if(y2 < y_bottom || y2 > y_top) % If invalid, flag it.
            index_x = angle2cell(i, min1, max1, n1);
            index_y = angle2cell(j, min2, max2, n2);
            config_space_binary(index_x, index_y) = 1;
        end
    end
end
%% Plot this 
f2 = figure(2);
set(gcf, 'OuterPosition',[100 100 scrsz(3)/2-100 scrsz(4)/2]);
imagesc(config_space_binary'); % Note the transpose of the joint space for convenience
axis xy; % Sets axis with x and y positive directions as expected, not as image coordinates
xlabel('Joint 1')
ylabel('Joint 2')
hold on;

% initialization setup
ds = Dstar(config_space_binary');
target = [175,-5]/180*pi;
start = [5,5]/180*pi;
n1 = 100;
min1 = -pi;
max1 = pi;
n2 = 100;
min2 = -150/180*pi;
max2 = 150/180*pi;
% convert angles to cell coordinates, then appl D* trajectory planning
% method
target(1) = angle2cell(target(1), min1, max1, n1);
target(2) = angle2cell(target(2), min2, max2, n2);
start(1) = angle2cell(start(1), min1, max1, n1);
start(2) = angle2cell(start(2), min2, max2, n2);
ds.start = start; ds.plan(target); traj = ds.query(start);
plot(traj(:,1),traj(:,2),'ro')
hold off;
% convert back to joint angles and animate it
for i = 1:size(traj)
    traj(i,1) = cell2angle(traj(i,1), min1, max1, n1);
    traj(i,2) = cell2angle(traj(i,2), min2, max2, n2);
end
figure(1); hold on;
two_link.plot(traj)


f2 = figure(3);
set(gcf, 'OuterPosition',[100 100 scrsz(3)/2-100 scrsz(4)/2]);
imagesc(config_space_binary'); % Note the transpose of the joint space for convenience
axis xy; % Sets axis with x and y positive directions as expected, not as image coordinates
xlabel('Joint 1')
ylabel('Joint 2')
hold on;
% convert angles to cell coordinates, then appl PRM trajectory planning
% method
target = [175,-5]/180*pi;
start = [5,5]/180*pi;
target(1) = angle2cell(target(1), min1, max1, n1);
target(2) = angle2cell(target(2), min2, max2, n2);
start(1) = angle2cell(start(1), min1, max1, n1);
start(2) = angle2cell(start(2), min2, max2, n2);
prm = PRM(config_space_binary');
prm.plan();
traj = prm.query(start, target);
plot(traj(:,1),traj(:,2),'r*');

% convert back to joint angles and animate it
for i = 1:size(traj)
    traj(i,1) = cell2angle(traj(i,1), min1, max1, n1);
    traj(i,2) = cell2angle(traj(i,2), min2, max2, n2);
end
figure(1)
hold on;
two_link.plot(traj)




