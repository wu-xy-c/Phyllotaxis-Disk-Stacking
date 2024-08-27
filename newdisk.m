% This script is a function that determines the position the new disk given
% two disks and the radius of the new disk. Using disks (x1,y1,r1), 
% (x2,y2,r2) and the radius of the new disk r3, the function calculates the
% position of the next disk by finding the horizontal angle and the
% hypotenuses which is the sum of two radii and using trigonometric
% functions.

function [x3,y3] = newdisk(x1,y1,r1,x2,y2,r2,r3)

% The centre of the newly placed disk (x3,y3,r3) given disks (x1,y1,r1), 
% (x2,y2,r2).

% We set x1 to be the leftmost disk such that the distance between disks 1
% and 2 is the smallest possible distance.

    x = [x1,x2];
    [x22,h] = max(x);
    [x11,l] = min(x);
    y = [y1,y2];
    y22 = y(h);
    y11 = y(l);
    r = [r1,r2];
    r22 = r(h);
    r11 = r(l);

    [d12,I] = min([sqrt((x22-x11)^2+(y22-y11)^2), ...
        sqrt(((x11+1)-x22)^2+(y22-y11)^2)]);

    if I == 2
        x1 = x22;
        x2 = x11 + 1;
        y1 = y22;
        y2 = y11;
        r1 = r22;
        r2 = r11;
    else
        x1 = x11;
        x2 = x22;
        y1 = y11;
        y2 = y22;
        r1 = r11;
        r2 = r22;
    end

    % Using the cosine trigonometric equation, we calculate the position of
    % the next circle and the angle in the corner (d13,d12).

    d13 = r1 + r3;                        % distance between disks 1 and 3
    d23 = r2 + r3;                        % distance between disks 2 and 3

    % Gives the argument of disks 1 and 2

    grad = (y2-y1)/(x2-x1);                 % Gives the horizontal angle of
    if grad == inf || isnan(grad) == 1      % the line bisecting (x1,y1),
        horz = pi/2;                        % (x2,y2).
    else
        horz = atan(grad);
    end

    tri = acos((d12^2 + d13^2 - d23^2)/(2*d12*d13));   % angle in triangle

    theta = horz + tri;                   % angle needed to compute centre

    % Picks the smaller angle as that is the angle we need to compute the
    % position of the new centre given the angle. 

    if theta>pi/2
        theta = pi - theta;
        x3 = mod(real(x1 - d13*cos(theta)), 1);
    else 
        x3 = mod(real(d13*cos(theta) + x1), 1);   
    end

    y3 = real(d13*sin(theta) + y1);     % the y is imaginary but idk how

end
