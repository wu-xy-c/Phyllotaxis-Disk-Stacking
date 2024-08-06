% This script plots the initial condition where the disks of fixed radius 
% are touching and in a horizontal chain.

function [circles, n] = initialcond1(radius)

% Boundary with 1cm circumference:

    plot(linspace(0,1,200),linspace(0,0,200),'k-');
    hold on;
    plot(linspace(0,0,200),linspace(0,2,200),'k-');
    plot(linspace(1,1,200),linspace(0,2,200),'k-');

% Touching horizontal chain of disk:
                             
    circles(1).x = radius;
    circles(1).y = radius;
    circles(1).r = radius;

    m = 3;
    n = 1;
    while m<1/radius                           % chain of touching circles
        n = n + 1;                             % number of disks
        circles(n).x = m*radius;       
        circles(n).y = radius;       
        circles(n).r = radius;
        m = m + 2;
    end

    p = 0;
    while p<n
        p = p + 1;
        [x,y] = circle(circles(p).x,circles(p).y,circles(p).r);
        plot(x,y);
        plot(circles(p).x,circles(p).y,'k.');
    end

    axis equal

end
