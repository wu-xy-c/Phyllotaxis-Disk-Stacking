% This script is a function which finds the set of new disks given there is
% a 'dip' in the top_level chain of edges. Using the inputs of the set of
% circles in a touching chain on the top level adjacent and the radius of 
% the next placed disk r3, the function computes the set of possible new
% disks that can be placed by finding the dips and giving all the possible
% new disks that could exist.

function ndisk_dip = dip(adjacent,r3)

    [adjacent,s] = order(adjacent);

    grad = [];
    for jj = 1:s(1)-1
        grad = [grad, (adjacent(jj,5)-adjacent(jj,2))/ ...
            (adjacent(jj,4)-adjacent(jj,1))];
    end

    grad = [grad, (adjacent(s(1),5)-adjacent(s(1),2))/ ... 
        (1+adjacent(s(1),4)-adjacent(s(1),1))];

    gdsize = size(grad);
    ndisk_dip = [];
    for kk = 1:gdsize(2)
        if grad(1,kk) < -1e-7 && grad(1,mod(kk,gdsize(2))+1) > 1e-7

            p = 0;
            %disp(size(grad));
            while grad(1,mod(kk,gdsize(2))-p) < -1e-7
                %disp(gdsize(2)-p);
                p = p + 1;
            end

            q = 0;
            while grad(1,mod(kk,gdsize(2))+q) > 1e-7
                q = q + 1;
            end

            for a = [kk-p+gdsize(2):gdsize(2),1:kk]
                for b = [kk+1:gdsize(2),1:kk+q-gdsize(2)]
                    [x3,y3] = newdisk(adjacent(a,1),adjacent(a,2), ...
                                adjacent(a,3),adjacent(b,4),adjacent(b,5), ...
                                adjacent(b,6),r3);
                     ndisk_dip = [ndisk_dip; [x3,y3,r3]];
                end
            end

        end
    end
    
end



    %         if kk-p < 0
    %             if kk + q > gdsize(2)
    %                 for a = 1:kk-p+gdsize(2)
    %                     for b = kk:kk+q
    %                         [x3,y3] = newdisk(adjacent(a,1),adjacent(a,2), ...
    %                             adjacent(a,3),adjacent(b,4),adjacent(b,5), ...
    %                             adjacent(b,6),r3);
    %                         ndisk = [ndisk; [x3,y3,r3]];
    %                     end
    %                 end
    %             else
    %                 for a = 1:kk-p+gdsize(2)
    %                     for b = kk:kk+q
    %                         [x3,y3] = newdisk(adjacent(a,1),adjacent(a,2), ...
    %                             adjacent(a,3),adjacent(b,4),adjacent(b,5), ...
    %                             adjacent(b,6),r3);
    %                         ndisk = [ndisk; [x3,y3,r3]];
    %                     end
    %                 end
    %             end
    % 
    %         else
    %             if kk + q > gdsize(2)
    %                 for a = 1:kk-p+gdsize(2)
    %                     for b = kk:kk+q
    %                         [x3,y3] = newdisk(adjacent(a,1),adjacent(a,2), ...
    %                             adjacent(a,3),adjacent(b,4),adjacent(b,5), ...
    %                             adjacent(b,6),r3);
    %                         ndisk = [ndisk; [x3,y3,r3]];
    %                     end
    %                 end
    %             else
    %                 for a = 1:kk-p+gdsize(2)
    %                     for b = kk:kk+q
    %                         [x3,y3] = newdisk(adjacent(a,1),adjacent(a,2), ...
    %                             adjacent(a,3),adjacent(b,4),adjacent(b,5), ...
    %                             adjacent(b,6),r3);
    %                         ndisk = [ndisk; [x3,y3,r3]];
    %                     end
    %                 end  
    %             end
    %         end
    %     end
    % end 
    % 
    % if grad(1,gdsize(2)) < -1e-10 && grad(1,1) > 1e-10
    %     [x3,y3] = newdisk(adjacent(gdsize(2),1),adjacent(gdsize(2),2), ...
    %             adjacent(gdsize(2),3),adjacent(1,4),adjacent(1,5), ...
    %             adjacent(1,6), r3);
    %     ndisk = [ndisk; [x3,y3,r3]];
    % end
