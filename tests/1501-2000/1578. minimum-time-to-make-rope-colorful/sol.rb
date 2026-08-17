# @param {String} colors
# @param {Integer[]} needed_time
# @return {Integer}
def min_cost(colors, needed_time)
    n = colors.length
    sum_ = 0
    (1...n).each do |i|
        if colors[i] == colors[i - 1]
            sum_ += [needed_time[i], needed_time[i - 1]].min
            needed_time[i] = [needed_time[i], needed_time[i - 1]].max
        end
    end
    sum_
end
