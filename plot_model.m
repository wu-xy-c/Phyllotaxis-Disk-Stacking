% This script is a function which plots the disks and the boundary
% conditions. Using the set of disks circles and the number of disks n, the
% function plots the boundary conditions and the disks using function
% circle.

function plot_model(circles,n)

    max_height = max([circles.y]);

    tiledlayout(2,2)
    nexttile

    % Boundary with 1cm circumference.

    plot(linspace(0,1,200),linspace(0,0,200),'k-');
    hold on;
    plot(linspace(0,0,200),linspace(0,max_height,200),'k-');
    plot(linspace(1,1,200),linspace(0,max_height,200),'k-');

    % Plot right parastichy lines

    for a = 1:n
        for b = 1:n
            k = size(pair(circles(a).x,circles(a).y,circles(a).r, ...
                    circles(b).x,circles(b).y,circles(b).r));
            if k(2) > 0
                line = order(pair(circles(a).x,circles(a).y,circles(a).r, ...
                        circles(b).x,circles(b).y,circles(b).r));
                if line(1) > line(4)
                    line(4) = line(4) + 1;
                end
                if ((line(2)-line(5))/(line(1)-line(4))) > epsilon
                    plot([line(1),line(4)],[line(2),line(5)],'r-')
                    hold on
                end
            end
        end
    end

    axis equal

    nexttile([2,1])

    % Boundary with 1cm circumference.

    plot(linspace(0,1,200),linspace(0,0,200),'k-');
    hold on;
    plot(linspace(0,0,200),linspace(0,max_height,200),'k-');
    plot(linspace(1,1,200),linspace(0,max_height,200),'k-');

    % Plots the disks.

    p = 0;
    while p<n

        p = p + 1;
        [x,y] = circle(circles(p).x,circles(p).y,circles(p).r);
        plot(x,y,'g-');
        hold on
        plot(circles(p).x,circles(p).y,'k.');

        if (circles(p).x + circles(p).r) > 1 
            [x,y] = circle(circles(p).x-1,circles(p).y,circles(p).r);
            plot(x,y,'g-');
            plot(circles(p).x-1,circles(p).y,'k.');
        elseif (circles(p).x - circles(p).r) < 0
            [x,y] = circle(circles(p).x+1,circles(p).y,circles(p).r);
            plot(x,y,'g-');
            plot(circles(p).x+1,circles(p).y,'k.');
        end

    end

    axis equal

    nexttile

    % Boundary with 1cm circumference.

    plot(linspace(0,1,200),linspace(0,0,200),'k-');
    hold on;
    plot(linspace(0,0,200),linspace(0,max_height,200),'k-');
    plot(linspace(1,1,200),linspace(0,max_height,200),'k-');

    % Plot left parastichy lines

    for a = 1:n
        for b = 1:n
            k = size(pair(circles(a).x,circles(a).y,circles(a).r, ...
                    circles(b).x,circles(b).y,circles(b).r));
            if k(2) > 0
                line = order(pair(circles(a).x,circles(a).y,circles(a).r, ...
                        circles(b).x,circles(b).y,circles(b).r));
                if line(1) > line(4)
                    line(4) = line(4) + 1;
                end
                if ((line(2)-line(5))/(line(1)-line(4))) < -epsilon
                    plot([line(1),line(4)],[line(2),line(5)],'b-')
                    hold on
                end
            end
        end
    end

    axis equal

end