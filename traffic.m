initialize
for clock = 1 : clockmax
    t = clock * dt
    setlights
    createcars
    morecars
    plotcars
end