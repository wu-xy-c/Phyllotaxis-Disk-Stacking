% This script is a function that determines the position and plots the new
% disk.

function [x3,y3] = newdisk(x1,y1,r1,x2,y2,r2,r3)

% The centre of the newly placed disk (x3,y3,r3) given disks (x1,y1,r1), 
% (x2,y2,r2).

    grad = (y2-y1)/(x2-x1);                 % Gives the horizontal angle of
    if grad == inf || isnan(grad) == 1      % the line bisecting (x1,y1),
        horz = pi/2;                        % (x2,y2).
    else
        if (x2-x1)<0
            horz = -atan(grad);
        else
            horz = atan(grad);
        end
    end

    d12 = sqrt((y2-y1)^2+(x2-x1)^2);      % smallest distance between disks
    if d12>0.5                            % 1 and 2
        d12 = 1 - d12;
    end
    d13 = r1 + r3;                        % distance between disks 1 and 3
    d23 = r2 + r3;                        % distance between disks 2 and 3
    
    tri = acos((d12^2 + d13^2 - d23^2)/(2*d12*d13));   % angle in triangle
    
    theta = horz + tri;                   % angle needed to compute centre
    
    if -0.5<(x2-x1)<0 || (x2-x1)>0.5
        x3 = mod(x1 - d13*cos(theta), 1);
    else    
        x3 = mod(d13*cos(theta) + x1, 1); % another problem is that not all
    end                                   % values are modulo 1. I get 
                                          % x = 0 and x = 1.

    y3 = d13*sin(theta) + y1;     % the y is imaginary but idk how

    % if -0.5<(x2-x1)<0 || (x2-x1)>0.5
    %     x3 = mod(real(x1 - d13*cos(theta)), 1);
    % else    
    %     x3 = mod(real(d13*cos(theta) + x1), 1);
    % end
    % 
    % y3 = real(d13*sin(theta) + y1);     

    [x,y] = circle(x3,y3,r3);
    plot(x,y);
    hold on;
    plot(x3,y3,'k.');

end
