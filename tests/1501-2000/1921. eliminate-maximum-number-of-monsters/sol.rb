# @param {Integer[]} dist
# @param {Integer[]} speed
# @return {Integer}
def eliminate_maximum(dist, speed)
    arrival = []
    dist.each_with_index do |d, i|
        arrival << (d + speed[i] - 1) / speed[i]
    end
    arrival.sort!
    arrival.each_with_index do |time, minute|
        return minute if time <= minute
    end
    arrival.length
end
