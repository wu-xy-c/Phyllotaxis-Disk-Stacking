% This script counts the left and right parastichy counts given the set if
% circles.

function [left,right] = para_count(circles,n)

    % Find the connected chain of edges on the top level.

    top_edges = top_level(circles,n);
    [ordered_edges,s] = order(top_edges);

    % Finds the gradient between each adjacent pair of disks.

    grad = [];
    for jj = 1:s(1)-1
        grad = [grad, (ordered_edges(jj,5)-ordered_edges(jj,2))/ ...
            (ordered_edges(jj,4)-ordered_edges(jj,1))];
    end

    grad = [grad, (ordered_edges(s(1),5)-ordered_edges(s(1),2))/ ... 
        (1+ordered_edges(s(1),4)-ordered_edges(s(1),1))];

    % counts the number of negative gradients(left) and the number of
    % positive gradients(right)

    left = 0;
    right = 0;
    for g = grad
        if g < 0 - epsilon
            left = left + 1;
        elseif g > 0 + epsilon
            right = right + 1;
        end
    end

end