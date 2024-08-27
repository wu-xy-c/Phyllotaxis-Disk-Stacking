% This script runs the simulation.

tic

[circles, n] = run_model(30,600,@R1);
plot_model(circles,n)

toc