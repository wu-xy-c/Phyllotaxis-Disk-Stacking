% This script is a function which finds the set of new disks given there is
% a 'dip' in the top_level chain of edges. Using the inputs of the set of
% circles in a touching chain on the top level adjacent and the radius of 
% the next placed disk r3, the function computes the set of possible new
% disks that can be placed by finding the dips and giving all the possible
% new disks that could exist.

function ndisk_dip = dip(adjacent,r3)

    [adjacent,s] = order(adjacent);

    grad = [];
    for jj = 1:s(1)-1
        grad = [grad, (adjacent(jj,5)-adjacent(jj,2))/ ...
            (adjacent(jj,4)-adjacent(jj,1))];
    end

    grad = [grad, (adjacent(s(1),5)-adjacent(s(1),2))/ ... 
        (1+adjacent(s(1),4)-adjacent(s(1),1))];

    gdsize = size(grad);
    ndisk_dip = [];
    for kk = 1:gdsize(2)
        if grad(1,kk) < epsilon && grad(1,mod(kk,gdsize(2))+1) > epsilon

            p = 0;
            l = kk;

            while grad(1,l) < epsilon 
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

            if kk-p>0
                down = kk-p:kk;
            else
                down = [kk-p+gdsize(2):gdsize(2),1:kk];
            end

            if kk+1+q>gdsize(2)
                up = [kk+1:gdsize(2),1:kk+1+q-gdsize(2)];
            else
                up = kk+1:kk+1+q;
            end

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
