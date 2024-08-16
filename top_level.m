% This script is a function which finds the chain of touching disks
% top_level at the top of the stack. Using the inputs of the set of disks
% circles and the number of disks n, the function starts with the disk at
% the highest point and then iteratively until it returns back to that disk,
% it finds the highest touching disk to the right of the current disk.

function e = top_level(circles,n)
    [~,I] = max([circles.y]);
    circles_top(1).x = circles(I).x;
    circles_top(1).y = circles(I).y;
    circles_top(1).r = circles(I).r;

    possnextdisk = [];
    for a = 1:n
        if circles_top(end).x < circles(a).x && ...
                abs(circles(a).x - circles_top(end).x) < ...
                    abs(circles(a).x - circles_top(end).x - 1)
            possnextdisk = [possnextdisk; 
                pair(circles_top(end).x,circles_top(end).y,circles_top(end).r, ...
                circles(a).x,circles(a).y,circles(a).r)];
        elseif circles_top(end).x < circles(a).x + 1 && ...
                    abs(circles(a).x + 1 - circles_top(end).x) < ...
                    abs(circles(a).x - circles_top(end).x)
                possnextdisk = [possnextdisk; 
                    pair(circles_top(end).x,circles_top(end).y,circles_top(end).r, ...
                    circles(a).x,circles(a).y,circles(a).r)];
        end
    end
    
    %disp(possnextdisk);
    [~,II] = max(possnextdisk(:,5));
    %disp(II)
    top_edges = [possnextdisk(II,:)];
    k = 2;
    circles_top(k).x = possnextdisk(II,4);
    circles_top(k).y = possnextdisk(II,5);
    circles_top(k).r = possnextdisk(II,6);
    
    while abs(top_edges(1,1) - top_edges(end,4))>1e-3 || ...
            abs(top_edges(1,2) - top_edges(end,5))>1e-3 || ...
            abs(top_edges(1,3) - top_edges(end,6))>1e-3
        %disp(abs(top_edges(1,1) - top_edges(end,4)));
        possnextdisk = [];
        for b = 1:n
            % disp(circles_top(1))
            % disp(circles_top(end))
            % disp('b ='), disp(abs(circles(b).x + 1 - circles_top(end).x));
            % disp('c ='), disp(abs(circles(b).x - circles_top(end).x));
            if circles_top(end).x < circles(b).x && ...
                abs(circles(b).x - circles_top(end).x) < ...
                    abs(circles(b).x - circles_top(end).x - 1)
                possnextdisk = [possnextdisk; 
                    pair(circles_top(end).x,circles_top(end).y,circles_top(end).r, ...
                    circles(b).x,circles(b).y,circles(b).r)];
            elseif circles_top(end).x < circles(b).x + 1 && ...
                        abs(circles(b).x + 1 - circles_top(end).x) < ...
                        abs(circles(b).x - circles_top(end).x)
                possnextdisk = [possnextdisk; 
                    pair(circles_top(end).x,circles_top(end).y,circles_top(end).r, ...
                    circles(b).x,circles(b).y,circles(b).r)];
            end
            %disp(top_edges)
        end
        %disp('a'), disp(possnextdisk)
        %disp(possnextdisk(:,5))
        [~,II] = max(possnextdisk(:,5));
        %disp(II)
        top_edges = [top_edges; possnextdisk(II,:)];
        k = k + 1;
        circles_top(k).x = possnextdisk(II,4);
        circles_top(k).y = possnextdisk(II,5);
        circles_top(k).r = possnextdisk(II,6);
        %disp(circles_top(k))
    end
    
    e = top_edges;
    %[e,~] = order(e);
    %disp(e);

end