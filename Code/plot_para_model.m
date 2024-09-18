% This script is a function which plots the frequency of each parastichy
% count occuring after each disk is placed.

function plot_para_model(circles,k,n,left,right)

    tiledlayout(2,1)

    nexttile

    xl = unique(left);
    yl = zeros(size(xl));
    sl = size(left);
    for a = xl
        for b = 1:sl(2)
            if a == left(b)
                yl(a) = yl(a) + 1;
            end
        end
    end
    bar(xl,yl,'blue');

    nexttile

    xr = unique(right);
    yr = zeros(size(xr));
    sr = size(right);
    for a = xr
        for b = 1:sr(2)
            if a == right(b)
                yr(a) = yr(a) + 1;
            end
        end
    end
    bar(xr,yr,'red');

end