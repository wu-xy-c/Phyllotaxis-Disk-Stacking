% This script runs the simulation.

tic

[circles,k,n,left,right] = run_model(@initial_condition1,5,1000,@R2);
plot_model(circles,n)
plot_para_model(circles,k,n,left,right)

toc