% This script is a function which simulates the disk stacking model. Given
% the inputs of the number of initial disks in the initial condition k, the
% number of disks placed p, and the function Radius giving the radius of
% the new disk, the function gives the position and radius of disks stacked
% around a cylinder with circumference 1.

function [circles, n] = run_model(k,p,Radius)

    [circles,n] = initial_condition1(k);
    top_chain = top_level(circles,n);
    cir = n;                                % Number of disks in the plot

    for a = 1:p

        % Radius of ath new disk.

        cir = n;
        r = Radius(circles(cir).y);

        ndisk_adj = adj(top_chain,r);
        ndisk_dip = dip(top_chain,r);

        ndisk = [ndisk_adj;ndisk_dip];

        poss_ndisk = intersect(ndisk, circles, n);

        [circles,n] = next_disk(poss_ndisk,circles,n);

        top_chain = top_level(circles,n);

    end
    
end