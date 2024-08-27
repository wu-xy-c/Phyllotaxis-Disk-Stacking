% This script is a function which gives the radius of a disk given the
% height of the centre of the circle.

function r = R1(z)
    if z < 0.1
        r = 1/60;
    elseif z > 0.2
        r = 7/600;
    else
        r = -0.05*z + 13/600;
    end
        
end