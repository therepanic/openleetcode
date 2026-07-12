# @param {Integer[][]} costs
# @return {Integer}
def two_city_sched_cost(costs)
    res = 0
    costs.sort_by! { |x| x[0] - x[1] }
    n = costs.length
    (0...n).each do |i|
        if i < n / 2
            res += costs[i][0]
        else
            res += costs[i][1]
        end
    end
    res
end
