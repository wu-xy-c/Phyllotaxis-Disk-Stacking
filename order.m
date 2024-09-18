% This script is a function which orders the set of edges on the top
% level starting from 0 to 1. Using the input adjacent, the function orders
% the edges individual to go from left to right and then orders the edges 
% from 0 to 1, outputting the set of edges in increasing order ordered_edges
% and the number of edges s.

function [ordered_edges,s] = order(adjacent)
    
    % Orders the pairs of disks so that the leftmost one is on the left and
    % the rightmost one is on the right, considering the 0,1 boundary.

    s = size(adjacent);
    for ii = 1:s(1)
        % If the difference is larger than 0.5 and the left has the
        % smallest x-value and the right has the larger x-value, then they
        % are passing over the boundary line so they must be swapped.
        if abs(adjacent(ii,1)-adjacent(ii,4)) > 0.5-epsilon && ...
                adjacent(ii,1) < adjacent(ii,4)
            adjacent(ii,:) = [adjacent(ii,4:6), adjacent(ii,1:3)];

        % If the difference is less than 0.5 and the configuration is the
        % wrong way round, then it needs to be swapped.
        elseif abs(adjacent(ii,1)-adjacent(ii,4)) < 0.5+epsilon && ...
                    adjacent(ii,1) > adjacent(ii,4)
                adjacent(ii,:) = [adjacent(ii,4:6), adjacent(ii,1:3)];
        % Otherwise it is the correct way round.
        else
            continue
        end
    end

    % Orders the pairs so that one disk leads to the other all the way back
    % to the start.

    ordered_edges = sortrows(adjacent);

end