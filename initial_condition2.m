function [circles,n] = initial_condition2
    n = 8;
    circles = struct('x',{0.1,0.23,0.35,0.5,0.675,0.8,0.85,0.9}, ...
        'y',{0.1,0.252,0.412,0.545,0.643,0.487,0.2936,0.1}, ...
        'r',{0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1});

    % Boundary with 1cm circumference:

    plot(linspace(0,1,200),linspace(0,0,200),'k-');
    hold on;
    plot(linspace(0,0,200),linspace(0,2,200),'k-');
    plot(linspace(1,1,200),linspace(0,2,200),'k-');

    p = 0;
    while p<n
        p = p + 1;
        [x,y] = circle(circles(p).x,circles(p).y,circles(p).r);
        plot(x,y);
        plot(circles(p).x,circles(p).y,'k.');
    end

    axis equal
end