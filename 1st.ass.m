% Housekeeping
% ------------
clear 
clc
close all

% Set parameters
% --------------
sigma = 1.5; % utility parameter

% Define grid for k and specify convergence parameter
% ---------------------------------------------------
nbk = 1000; % number of data points in the grid
epsi = 1e-6; % convergence parameter

kss = 0.002; % steady state value of k

dev = 0.9; % maximal deviation from steady state
kmin = (1-dev)*kss; % grid's lower bound
kmax = (1+dev)*kss; % grid's upper bound

dk = (kmax - kmin)/(nbk-1); % compute distance between two consecutive data points on the grid (step size)
kgrid = kmin:dk:kmax; % build the grid as a COLUMN vector


% Create vectors of zeros for value function, decision rule and Bellman operator
% (pre-allocation increases speed)
% ---------------------------------------------------------------------------------------------
v = zeros(nbk); % COLUMN vector of zeros (size = nbk x 1) for value function (will be overwritten)
dr = zeros(nbk); % COLUMN vector of zeros (size = nbk x 1) for decision rule (will contain indices)
Bv = zeros(nbk); % COLUMN vector of zeros (size = nbk x 1) for Bellman operator (will be overwritten)

% Define initial condition for value function
% -------------------------------------------
% As we know from Contraction Mapping Theorem, this could be anything.
% To start with, you could leave the vector of zeros as initial condition and later on think about something better

% Main loop
% ---------
crit = 1; % could be anything bigger than stopping criterion - the algorithm will keep iterating until crit < epsi
iter = 0; % iteration counter (not really needed, just FYI)
    alpha = 0.3;

while crit > epsi % Matlab will keep doing whatever you write between "while" and "end" as long as crit > epsi (i.e. until convergence is reached)
    
    % #######################################################################
    % What Matlab should do at each grid point (i.e. for a given value of k):
    % -----------------------------------------------------------------------
    
    % 1. Compute u + beta*v for all possible values of k' (i.e. all values in the grid of capital)
    




    c = kgrid.^alpha - kgrid;
    u = (c^(1-sigma)-1)/(1-sigma);

    
    % 2. Find k' that maximizes u + beta*v and store maximum value of u + beta*v in vector Bv as well as the
    %    position (index) of optimal k' in the grid of capital values in vector dr


    
    % 2.1 Remember to enforce constraint c > 0!
    % #######################################################################
    
    

    % After having looped over all grid points 
    % ----------------------------------------
    
    crit = max(abs(Bv-v)); % compute convergence criterion
    v = Bv; % update the value function
    
end


% After the algorithm has converged
% ---------------------------------

k1 = ; % compute optimal next period capital choice at each grid point (recall that you have save the position of optimal k' at each grid point in vector dr)
c = ; % compute optimal consumption at each grid point 



