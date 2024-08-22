% This script is a function which simulates the disk stacking model where
% the radius is varied by a function radius.

function [circles, n] = run_model

    k = 5;                                 % Number of disks.
    [circles,n] = initial_condition1(k);
    edges = top_level(circles,n);

    p = 100;                                 % Number of new disks placed.
    for a = 1:p

        % Radius of ath new disk.

        %r_dash = 0.05;

        if a == 1
            r3 = 0.1;
        elseif circles(a-1).y < 0.6
            r3 = 0.1;
        elseif circles(a-1).y > 1.1
            r3 = 0.075;
        else
            r3 = -0.05*circles(a-1).y + 0.13;
        end
        
        ndisk_adj = adj(edges,r3);
        ndisk_dip = dip(edges,r3);

        ndisk = [ndisk_adj;ndisk_dip];

        pndisk = intersect(ndisk, circles, n);

        [circles,n] = next_disk(pndisk,circles,n);

        edges = top_level(circles,n);

    end
    
end