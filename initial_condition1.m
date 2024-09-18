% This script is a function which gives the initial condition of a chain of
% a given number of touching disks on the boundary condtion. Using the
% number of disks k, the function determines the position and radius of 
% each circle and outputs a set of disks ini_cond and the number of disks
% n.

function [ini_cond,n] = initial_condition1(k)

    n = k;
    r = 1/(2*k);
    x = r:2*r:1-r;
    y = zeros(k);
    radius = r*ones(k);

    a = 0;
    while a<k
        a = a + 1;
        ini_cond(a).x = x(a);
        ini_cond(a).y = y(a);
        ini_cond(a).r = radius(a);
    end

    % r_dash = 0.05;
    % 
    % if k == 1
    %     ini_cond(1).x = 0.5;
    %     ini_cond(1).y = 0.5;
    %     ini_cond(1).r = 0.5;
    %     ini_cond(2).x = 0;
    %     ini_cond(2).y = ini_cond(1).y+sqrt((0.5+r_dash)^2-0.5^2);
    %     ini_cond(2).r = 0.5-r_dash*ini_cond(1).y;
    %     ini_cond(2).x = 0.5;
    %     ini_cond(2).y = ini_cond(2).y+sqrt((0.5+r_dash)^2-0.5^2);
    %     ini_cond(2).r = 0.5-r_dash*ini_cond(1).y;
    % 
    % 
    % elseif k == 2
    % 
    % 
    % else
    %     n = k;
    %     r = 1/(2*k);
    %     x = r:2*r:1-r;
    %     y = r*ones(k);
    %     radius = r*ones(k);
    % 
    %     a = 0;
    %     while a<k
    %         a = a + 1;
    %         ini_cond(a).x = x(a);
    %         ini_cond(a).y = y(a);
    %         ini_cond(a).r = radius(a);
    %     end
    % end
end