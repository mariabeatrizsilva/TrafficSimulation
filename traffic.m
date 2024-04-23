% initialize
clockmax = 100;
hours = 24;
dt  = hours/clockmax;
tlc = 4*6; %% number of traffic lights?
nb  = 38; %% number of blocks
ni  = 4*6;
nc  = 10; % number of cars
jgreen = zeros(ni);

%%Initializing some arrays 
for i=1:ni
    nbin(i) = sum(i2==i);
    nbin(i) = sum(i1==i);
end 
nbinmax = max(bin);
nboutmax = max(nbout)
bin = zeros(ni, nbinmax)
bout = zeros(ni, nboutmax)
for (i=ni)
    bin(i,1:nbin(i)) = find(i2==i);
    bout(i,1:nbout(i))= find(i1==i);
end 

for clock = 1 : clockmax
    t = clock * dt;
    setlights
    createcars
    morecars
    plotcars
end