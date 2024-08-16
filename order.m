% This script is a function which orders the set of edges on the top
% level starting from 0 to 1. Using inputs ..., the function orders the
% edges individual to go from left to right and then orders the edges from
% 0 to 1, outputting the set of edges in increasing order ordered_edges
% and the number of edges s.

function [ordered_edges,s] = order(adjacent)
    
    s = size(adjacent);
    for ii = 1:s(1)
        if abs(adjacent(ii,1)-adjacent(ii,4)) > 0.5 && ...
                adjacent(ii,1) < adjacent(ii,4)
            adjacent(ii,:) = [adjacent(ii,4:6), adjacent(ii,1:3)];
        elseif abs(adjacent(ii,1)-adjacent(ii,4)) < 0.5 && ...
                    adjacent(ii,1) > adjacent(ii,4)
                adjacent(ii,:) = [adjacent(ii,4:6), adjacent(ii,1:3)];
        else
            continue
        end
    end

     ordered_edges = sortrows(adjacent);

end