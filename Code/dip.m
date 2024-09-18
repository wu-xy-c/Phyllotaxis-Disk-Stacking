% This script is a function which finds the set of new disks given there is
% a 'dip' in the top_level chain of edges. Using the inputs of the set of
% circles in a touching chain on the top level adjacent and the radius of 
% the next placed disk r3, the function computes the set of possible new
% disks that can be placed by finding the dips and giving all the possible
% new disks that could exist.

function ndisk_dip = dip(adjacent,r3)

    % adjacent is a mx6 matrix where m is the number of unique disks
    % touching and the first 3 coulumns are of disk 1 (x1,y1,r1) and the
    % last three columns are of disk 2 (x2,y2,r2).

    % We order the matrix so that the left most disk is in the first three
    % columns and the right most disk is in the last three columns unless
    % it loops back around the cylinder from 1 to 0. We the order the rows
    % so that the disks move from the one closest to 0 and around the
    % cylinder and back to the starting disk.

    [adjacent,s] = order(adjacent);

    % We first determine the gradient between the touching disks to
    % determine the shape of the top chain. The last gradient where the
    % chain goes back to the start is done separately since we take the
    % gradient of the smallest distance between disks mod 1.

    grad = [];
    for jj = 1:s(1)-1
        grad = [grad, (adjacent(jj,5)-adjacent(jj,2))/ ...
            (adjacent(jj,4)-adjacent(jj,1))];
    end

    grad = [grad, (adjacent(s(1),5)-adjacent(s(1),2))/ ... 
        (1+adjacent(s(1),4)-adjacent(s(1),1))];


    % We determine where there is a dip in the chain, that is where the
    % gradient is negative and then positive in the next entry.

    gdsize = size(grad);
    ndisk_dip = [];
    for kk = 1:gdsize(2)
        if grad(1,kk) < -epsilon && grad(1,mod(kk,gdsize(2))+1) > epsilon

            % We determine how "deep" this dip is by finding the number of
            % gradients before the lowest point that are negative, and
            % finding the number of gradients after the lowest point that 
            % are positive.

            p = 0;
            l = kk;

            while grad(1,l) < -epsilon 
                p = p + 1;
                if kk-p == 0
                    l = gdsize(2);
                else
                    l = mod(kk-p,gdsize(2));
                end
            end

            q = 0;
            while grad(1,mod(kk+q,gdsize(2))+1) > epsilon
                q = q + 1;
            end

            % We then retrive the edges(rows) in the chain(matrix) that
            % have negative and positive gradient respectively. This
            % considers if the gradient loops around near the 0 and 1 mark.

            if kk-(p-1)>0
                down = kk-(p-1):kk;
            else
                down = [kk-(p-1)+gdsize(2):gdsize(2),1:kk];
            end

            if kk+1+(q-1)>gdsize(2)
                up = [kk+1:gdsize(2),1:kk+1+(q-1)-gdsize(2)];
            else
                up = kk+1:kk+1+(q-1);
            end

            % We pair up the disks on the negative gradient side with the
            % disks on the positive gradient by picking the disk which are
            % in the first 3 columns of the matrix and pair up with the
            % last three columns of the matrix. We ignore the bottom disk
            % since new disk given by that disk can only be the touching
            % ones which have been considered in adj. The pairs of disks
            % can allow a new disk to be placed such that they dont overlap
            % the pair of disk. If the distance is too far apart, the new
            % disk would be "hovering" but I think there will always be a 
            % lower disk on the top level.
            
            for a = down
                for b = up
                    [x3,y3] = newdisk(adjacent(a,1),adjacent(a,2), ...
                                adjacent(a,3),adjacent(b,4),adjacent(b,5), ...
                                adjacent(b,6),r3);
                     ndisk_dip = [ndisk_dip; [x3,y3,r3]];
                end
            end

        end
    end
    
end
