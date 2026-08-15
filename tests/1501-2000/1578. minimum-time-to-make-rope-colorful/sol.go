func minCost(colors string, neededTime []int) int {
    n := len(colors)
    sum := 0
    for i := 1; i < n; i++ {
        if colors[i] == colors[i-1] {
            if neededTime[i] < neededTime[i-1] {
                sum += neededTime[i]
                neededTime[i] = neededTime[i-1]
            } else {
                sum += neededTime[i-1]
            }
        }
    }
    return sum
}
