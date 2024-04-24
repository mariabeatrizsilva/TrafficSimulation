% initialize
clockmax = 100;
hours = 24;
dt = hours / clockmax;
tlcstep = 1; % time interval between light changes
tlc = tlcstep;
tlcmax = 100; % maximum time for traffic light change
tlcgreen = 20; % time for green light

nb = 38; % number of blocks
ni = 24; % number of intersections
nc = 10; % number of cars per intersection

xi = 

R = 0.5;

i1 = randi(ni, nc, 1); % initialize i1 with random values representing the previous block for each car
i2 = randi(ni, nc, 1); % initialize i2 with random values representing the current block for each car

jgreen = ones(1, ni); % Initialize jgreen as a row vector with all ones

% Initializing some arrays
nbin = zeros(1, ni); % Initialize nbin as a row vector
nbout = zeros(1, ni); % Initialize nbout as a row vector
for i = 1:ni
    nbin(i) = sum(i2 == i);
    nbout(i) = sum(i1 == i);
end
nbinmax = max(nbin);
nboutmax = max(nbout);
bin = zeros(ni, nbinmax);
bout = zeros(ni, nboutmax);
for i = 1:ni
    bin(i, 1:nbin(i)) = find(i2 == i);
    bout(i, 1:nbout(i)) = find(i1 == i);
end

for clock = 1:clockmax
    t = clock * dt;
    
    % Call setlights function
    S = setlights(bin, jgreen, nbin, t, tlc, tlcstep);
    
    % Proceed with the rest of the simulation
    createcars;
    morecars;
    plotcars;
end
