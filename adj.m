% This script is a function which determines all the possible new disks
% that can be placed given two adjacent disks. Using inputs of the set of 
% edges on the top row adjacent and the radius of new disk r3, we use 
% the function newdisk to compute the set of possible new disks.

function ndisk_adj = adj(adjacent,r3)

    ndisk_adj = [];
    m = size(adjacent);
    for a = 1:m(1)
        [x3,y3] = newdisk(adjacent(a,1),adjacent(a,2),adjacent(a,3), ...
            adjacent(a,4),adjacent(a,5),adjacent(a,6),r3);
        ndisk_adj = [ndisk_adj;[x3,y3,r3]];
    end

end