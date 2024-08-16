% This script is a function which determines the set of new disks which 
% interesect the disks currently placed and then removes them from the set
% of new disks. Using the inputs the set of new disks ndisk, the set of
% disks currently placed circles, and the number of disks currently placed 
% n, the function calculates the distance between the centres of disks and 
% determines if there is a large enough gap so that the disks don't overlap. 
% It then outputs the set of permitted new disks that can be placed.

function per_new_disk = intersect(ndisk, circles, n)

    t = size(ndisk);
    N = [];
    for p = 1:t(1)
        for q = 1:n
            xl = max(ndisk(p,1),circles(q).x);
            xs = min(ndisk(p,1),circles(q).x);
            d12 = min(sqrt((xl-xs)^2+(ndisk(p,2)-circles(q).y)^2), ...
                sqrt(((xs+1)-xl)^2+(ndisk(p,2)-circles(q).y)^2));
            if (ndisk(p,3) + circles(q).r - d12) > 1e-10
                N = [N,p];
            end
        end
    end

    N = unique(N);
    N = sort(N);
    N = flip(N);

    % Removes the new disks that would overlap the old disks
    for nn = N
        ndisk(nn,:) = [];
    end

    per_new_disk = ndisk;

end