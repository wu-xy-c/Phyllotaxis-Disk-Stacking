% This script is a disk stacking model where the initial condition is a
% simple touching chain and the radius of disks are fixed.

radius = 0.125;
[circles, n] = initialcond1(radius);  

m=n;
for p = 1:5                            % number of iterations after initial condition.
    n=m;
    for a = 1:n 
        if abs(circles(a).y - max([circles(1:n).y]))>1e-10 || isnan(circles(a).y) == 1
            continue
        else
            for b = 1:n 
            % Not sure if there is a better way to write this.
            % Tried using just if statement and 'continue' but didn't work
            % as it would stop the for statement.
            % Maybe need to use 'break'.
            % There is a simpler way which I've worked out but not updated.
                if abs(circles(b).y - max([circles(1:n).y]))>1e-10 || isnan(circles(a).y) == 1
                    continue
                else
                    m = m + 1;
                    [circles(m).x, circles(m).y] = newdisk( ...
                            circles(a).x,circles(a).y,circles(a).r, ...
                            circles(b).x,circles(b).y,circles(b).r, ...
                            radius);
                        circles(m).r = radius;     % assigns new disk to structure circles
                end
            end
        end
    end

    isUnique = true(size(circles));                % gives a unique collection of circles
                                                   % (not my code)
    for ii = 1:length(circles)-1
        for jj = ii+1:length(circles)
            if abs(circles(ii).x - circles(jj).x)<1e-10
                if abs(circles(ii).y - circles(jj).y)<1e-10
                    isUnique(ii) = false;
                    break;
                end
            end
        end
    end
    circles(~isUnique) = [];
    
    % Removes all the NaN. Adaptation of the unique code but it replaces
    % the 1 to be empty rather than the 0. The unique code replaces the 0.
    u = true(size(circles));                       
                                                   
    for kk = 1:length(circles)                     
        if isnan(circles(kk).x) == 0 && isnan(circles(kk).y) == 0 
            u(kk) = false;
        end
    end
    circles(u) = [];
    m = length(circles);
end

