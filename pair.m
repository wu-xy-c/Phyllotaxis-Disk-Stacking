% This script is a function which will pair two disks (x1,y1,r1), 
% (x2,y2,r2) if they are adjacent. Using inputs of the two disks (x1,y1,r1), 
% (x2,y2,r2), the function finds the smallest distance between the centres
% of the disk and calculates if the distance is the same as the sum of the
% radii.

function p = pair(x1,y1,r1,x2,y2,r2)

    % Gives the smallest distance between the disks.
    xl = max(x1,x2);
    xs = min(x1,x2);
    d12 = min(sqrt((xl-xs)^2+(y2-y1)^2), sqrt(((xs+1)-xl)^2+(y2-y1)^2));
    %disp(d12);
    %disp(abs(r1 + r2 - d12));
    if abs(r1 + r2 - d12)<1e-3
        p = [x1,y1,r1,x2,y2,r2];
    else
        p = [];
    end
end