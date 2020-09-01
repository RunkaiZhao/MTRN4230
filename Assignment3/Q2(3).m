N = 50;
i = 0;
for theta1=linspace(deg2rad(-180),deg2rad(180),N)
    for theta2=linspace(deg2rad(-180),deg2rad(180),N)
        for d3=linspace(0,0.1,N)
            for theta4=linspace(deg2rad(0),deg2rad(360),N)
                i = i+1;
                ForwKinMatrix = [ cos(theta1 + theta2 - theta4),  sin(theta1 + theta2 - theta4),  0, a2*cos(theta1 + theta2) + a1*cos(theta1);
                                               sin(theta1 + theta2 - theta4), -cos(theta1 + theta2 - theta4), 0, a2*sin(theta1 + theta2) + a1*sin(theta1);
                                               0, 0, -1,-d3-d4;
                                               0, 0,  0, 1];
            
                px(i)= ForwKinMatrix(1,4);
                py(i)= ForwKinMatrix(2,4);
                pz(i)= ForwKinMatrix(3,4);
                
            end                         
        end
    end
end
figure(1);
grid on; hold on;
p = plot3(px,py,pz, 'r.');
xlabel('x')
ylabel('y')
zlabel('z')
title('Workspace');

