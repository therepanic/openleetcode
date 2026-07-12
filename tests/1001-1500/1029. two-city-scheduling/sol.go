func twoCitySchedCost(costs [][]int) int {
    res := 0
    sort.Slice(costs, func(i, j int) bool {
        return costs[i][0]-costs[i][1] < costs[j][0]-costs[j][1]
    })
    n := len(costs)
    for i := 0; i < n; i++ {
        if i < n/2 {
            res += costs[i][0]
        } else {
            res += costs[i][1]
        }
    }
    return res
}
