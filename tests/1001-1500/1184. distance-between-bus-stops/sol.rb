# @param {Integer[]} distance
# @param {Integer} start
# @param {Integer} destination
# @return {Integer}
def distance_between_bus_stops(distance, start, destination)
    if destination < start
        start, destination = destination, start
    end
    s = distance[start...destination].sum
    [s, distance.sum - s].min
end
