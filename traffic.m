% initialize
clockmax = 100;
hours = 24;
dt = hours / clockmax;
tlcstep = 1; % time interval between light changes
tlc = tlcstep;
tlcmax = 100; % maximum time for traffic light change
tlcgreen = 20; % time for green light

nb = 20; % number of blocks
ni = 15; % number of intersections
nc = 2; % number of cars per intersection

L = ones(nb);

% Define block coordinates
yi = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
xi = repmat([1; 2], numel(yi)/2, 1);

R = 0.5;

onroad = zeros(1, nc);

% Initialize previous and current block indices for cars
i1 = randi(ni, nc, 1); % initialize i1 with random values representing the previous block for each car
i2 = randi(ni, nc, 1); % initialize i2 with random values representing the current block for each car

jgreen = ones(1, ni); % Initialize jgreen as a row vector with all ones

% Initialize arrays to store entering and exiting cars for each intersection
nbin = zeros(1, ni); % Initialize nbin as a row vector
nbout = zeros(1, ni); % Initialize nbout as a row vector

% Update the number of entering and exiting cars for each intersection
for i = 1:ni
    nbin(i) = sum(i2 == i);
    nbout(i) = sum(i1 == i);
end

% Calculate the maximum number of entering and exiting cars for each intersection
nbinmax = max(nbin);
nboutmax = max(nbout);

% Initialize arrays to store entering and exiting car indices for each intersection
bin = zeros(ni, nb); % Initialize bin with the maximum number of possible cars
bout = zeros(ni, nb); % Initialize bout with the maximum number of possible cars

% Update the arrays with valid block indices for entering and exiting cars
for i = 1:ni
    bin(i, 1:nbin(i)) = find(i2 == i);
    bout(i, 1:nbout(i)) = find(i1 == i);
end


% Simulation loop
for clock = 1:clockmax
    t = clock * dt;
    
    % Call setlights function
    S = setlights(bin, jgreen, nbin, t, tlc, tlcstep);
    
    % Proceed with the rest of the simulation
    createcars;
    movecars;
    plotcars;
end
