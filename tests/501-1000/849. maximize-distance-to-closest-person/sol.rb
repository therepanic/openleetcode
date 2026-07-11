# @param {Integer[]} seats
# @return {Integer}
def max_dist_to_closest(seats)
    previous = -1
    best = 0
    seats.each_with_index do |seat, index|
        next unless seat == 1
        best = [best, previous == -1 ? index : (index - previous) / 2].max
        previous = index
    end
    [best, seats.length - 1 - previous].max
end
