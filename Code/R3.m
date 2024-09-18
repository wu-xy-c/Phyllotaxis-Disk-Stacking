% This script is a piecewise function of the radius given the height of the
% disk z with the change of radius being r_dash and non-dimensionalised by
% setting r_l = 1/16, z_l = 0.6, z_u = 0.8.

function r = R3(z)

    r_dash = 0.3;
    r_l = 1/16;
    z_l = 0.25;
    z_u = 0.35;

    if z < z_l
        r = r_l;
    elseif z > z_u
        r = r_l - (z_u - z_l)*r_dash;
    else
        r = r_l - r_dash*(z - z_l);
    end

end