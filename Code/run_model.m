% This script is a function which simulates the disk stacking model. Given
% the inputs of the number of initial disks in the initial condition k, the
% number of disks placed p, and the function Radius giving the radius of
% the new disk, the function gives the position and radius of disks stacked
% around a cylinder with circumference 1.

function [circles,k,n,left_para,right_para] = run_model(initial_condition,k,p,Radius)

    % notes the parastichy counts

    left_para = [];
    right_para = [];

    % Give the initial condition of circles and add it to the set.

    [circles,n] = initial_condition(k);

    % p is the number of disks we add

    for a = 1:p

        % Find the top chain of the current set of disks.
        top_chain = top_level(circles,n);

        % Radius of ath new disk.

        % r is the radius of the new disk given the last placed disk into
        % the set

        r = Radius(circles(end).y);

        % finds all the possible disks that can be placed given the two
        % possible cases
        
        ndisk_adj = adj(top_chain,r);
        ndisk_dip = dip(top_chain,r);

        ndisk = [ndisk_adj;ndisk_dip];
  
        % gives the set of disks which are permissible and don't overlap
        % the currently placed disk

        poss_ndisk = intersect(ndisk, circles, n);

        % finds the next disk to be placed and adds the new disk to the set
        % of placed circles to be placed

        [circles,n] = next_disk(poss_ndisk,circles,n);

        % finds the parastichy counts per iteration

        [l,r] = para_count(circles,n);
        left_para = [left_para,l];
        right_para = [right_para,r];

    end
    %disp(left_para);
    %disp(right_para);
    
end