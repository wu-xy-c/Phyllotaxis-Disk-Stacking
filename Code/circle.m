% This script creates a circle with radius r and centre (a,b).

function [x,y] = circle(a,b,r)
    theta = linspace(-2*pi,2*pi,200);
    x = r*cos(theta) + a;
    y = r*sin(theta) + b;
end
