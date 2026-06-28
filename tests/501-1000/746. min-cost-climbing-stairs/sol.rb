# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
    cost << 0
    (cost.length - 4).downto(0) do |i|
        cost[i] += [cost[i+1], cost[i+2]].min
    end
    [cost[0], cost[1]].min
end
