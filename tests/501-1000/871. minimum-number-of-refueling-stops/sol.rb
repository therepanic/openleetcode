# @param {Integer} target
# @param {Integer} start_fuel
# @param {Integer[][]} stations
# @return {Integer}
def min_refuel_stops(target, start_fuel, stations)
    fuel = start_fuel
    count = 0
    i = 0
    best = []
    while fuel < target
        while i < stations.length && stations[i][0] <= fuel
            best << stations[i][1]
            i += 1
        end
        return -1 if best.empty?
        idx = 0
        (1...best.length).each do |j|
            idx = j if best[j] > best[idx]
        end
        fuel += best[idx]
        best[idx] = best[-1]
        best.pop
        count += 1
    end
    count
end
