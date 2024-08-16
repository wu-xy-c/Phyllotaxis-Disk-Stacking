% This script is a function which plots the disks and the boundary
% conditions. Using the set of disks circles and the number of disks n, the
% function plots the boundary conditions and the disks using function
% circle.

function plot_model(circles,n)

    % Boundary with 1cm circumference.

    plot(linspace(0,1,200),linspace(0,0,200),'k-');
    hold on;
    plot(linspace(0,0,200),linspace(0,2,200),'k-');
    plot(linspace(1,1,200),linspace(0,2,200),'k-');


    % Plots the disks.

    p = 0;
    while p<n
        p = p + 1;
        [x,y] = circle(circles(p).x,circles(p).y,circles(p).r);
        plot(x,y);
        plot(circles(p).x,circles(p).y,'k.');
    end

    axis equal
end