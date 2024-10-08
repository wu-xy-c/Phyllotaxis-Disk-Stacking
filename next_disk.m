% This script is a function which determines the next disk to be placed.
% Using inputs of the set of permitted disks that can be placed pndisk, the
% set of placed disks circles and the number of placed disks n, the
% function calculates the disk which is postioned the lowest and adds the
% disk to the set of placed disks to be placed.

function [circles,k] = next_disk(pndisk,circles,n)

    nd = size(pndisk);
    low = [];
    
    % Finds all the y-values of the set of the next possible disks and then
    % finds the index of the lowest next possible disk.

    for d = 1:nd(1)
        low = [low,pndisk(d,2)];
    end

    [~,I] = min(low);

    % Assigns this disk to be placed and it is added to the set of all
    % disks place.
    
    circles(n+1).x = pndisk(I,1);
    circles(n+1).y = pndisk(I,2);
    circles(n+1).r = pndisk(I,3);
    k = n + 1; 

end