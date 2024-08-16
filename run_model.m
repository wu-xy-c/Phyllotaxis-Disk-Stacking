% This script is a function which simulates the disk stacking model where
% the radius is varied by a function radius.

function [circles, n] = run_model

    k = 10;                                 % Number of disks.
    [circles,n] = initial_condition1(k);
    edges = top_level(circles,n);

    p = 70;                                 % Number of new disks placed.
    for a = 1:p

        %r3 = 0.05*0.99^(a-1);               % Radius of ath new disk.
        r3 = 0.05;
        if a == 32
            r3 = 0.04;
        end

        if a == 43
            r3 = 0.04;
        end
        
        ndisk_adj = adj(edges,r3);
        ndisk_dip = dip(edges,r3);

        ndisk = [ndisk_adj;ndisk_dip];

        pndisk = intersect(ndisk, circles, n);

        [circles,n] = next_disk(pndisk,circles,n);

        edges = top_level(circles,n);

    end
    
end