% This script is a function which finds the chain of touching disks
% top_level at the top of the stack. Using the inputs of the set of disks
% circles and the number of disks n, the function starts with the disk at
% the highest point and then iteratively until it returns back to that disk,
% it finds the highest touching disk to the right of the current disk.

function e = top_level(circles,n)

    % We set the circle at the highest point to be the first disk in
    % the chain on the top level.

    [~,I] = max([circles.y]);
    circles_top(1).x = circles(I).x;
    circles_top(1).y = circles(I).y;
    circles_top(1).r = circles(I).r;

    % We find the disks that are touching the last placed disks and order
    % them so that the disk in the first three columns are on the left and
    % the disk in the last three columns are on the right given that the
    % position of the disk gives the smallest possible distance between
    % them.

    poss_nextdisk = [];
    for a = 1:n
        poss_nextdisk = [poss_nextdisk;
            pair(circles(a).x,circles(a).y,circles(a).r, ...
            circles_top(1).x,circles_top(1).y,circles_top(1).r)];
    end

    [poss_nextdisk, poss_size] = order(poss_nextdisk);

    % We pick the disks to the right of the last disk in the top chain by
    % picking the disks where the last placed circle is in the first 3
    % columns, then the disks in the last 3 columns are to the right of the
    % last chosen disk and it is added to right_nextdisk.

    right_nextdisk = [];
    for b = 1:poss_size(1)
        if abs(circles_top(1).x - poss_nextdisk(b,1))<epsilon && ...
            abs(circles_top(1).y - poss_nextdisk(b,2))<epsilon && ...
            abs(circles_top(1).r - poss_nextdisk(b,3))<epsilon
            right_nextdisk = [right_nextdisk; poss_nextdisk(b,:)];
        end
    end

    % We then pick the disk that is the highest (largest y-value) and add
    % this disk to the top level chain, and also add the edge that links
    % the chosen disk with the highest next disk.

    [~,II] = max(right_nextdisk(:,5));
    k = 2;
    circles_top(k).x = right_nextdisk(II,4);
    circles_top(k).y = right_nextdisk(II,5);
    circles_top(k).r = right_nextdisk(II,6);
    top_edges = [right_nextdisk(II,:)];

    % We repeat this algorithm until the next chosen disk is the first disk
    % we chose (ie the highest position disk). We create a loop after one
    % iteration as there must be at least 2 circles to compare in the top
    % level.

    while abs(circles_top(end).x - circles_top(1).x)>epsilon || ...
            abs(circles_top(end).y - circles_top(1).y)>epsilon || ...
            abs(circles_top(end).r - circles_top(1).r)>epsilon

        poss_nextdisk = [];
        for c = 1:n
            poss_nextdisk = [poss_nextdisk;
                pair(circles(c).x,circles(c).y,circles(c).r, ...
                circles_top(end).x,circles_top(end).y,circles_top(end).r)];
        end

        [poss_nextdisk, poss_size] = order(poss_nextdisk);

        right_nextdisk = [];
        for d = 1:poss_size(1)
            if abs(circles_top(end).x - poss_nextdisk(d,1))<epsilon && ...
                abs(circles_top(end).y - poss_nextdisk(d,2))<epsilon && ...
                abs(circles_top(end).r - poss_nextdisk(d,3))<epsilon
                right_nextdisk = [right_nextdisk; poss_nextdisk(d,:)];
            end
        end

          
        [~,II] = max(right_nextdisk(:,5));
        k = k+1;
        circles_top(k).x = right_nextdisk(II,4);
        circles_top(k).y = right_nextdisk(II,5);
        circles_top(k).r = right_nextdisk(II,6);
        top_edges = [top_edges; right_nextdisk(II,:)];
            
    end

    e = top_edges;

end