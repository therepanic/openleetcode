func boxDelivering(boxes [][]int, portsCount int, maxBoxes int, maxWeight int) int {
    n := len(boxes)
    ports := make([]int, n+1)
    weights := make([]int, n+1)
    for i, box := range boxes {
        ports[i+1] = box[0]
        weights[i+1] = box[1]
    }
    prefixWeights := make([]int, n+1)
    for i := 1; i <= n; i++ {
        prefixWeights[i] = prefixWeights[i-1] + weights[i]
    }
    portsCnt := make([]int, n+2)
    for i := 2; i <= n; i++ {
        if ports[i] != ports[i-1] {
            portsCnt[i] = portsCnt[i-1] + 1
        } else {
            portsCnt[i] = portsCnt[i-1]
        }
    }
    portsCnt[n+1] = portsCnt[n]
    dp := make([]int, n+1)
    queue := make([]int, 0, n+1)
    queue = append(queue, 0)
    left := 0
    for i := 1; i <= n; i++ {
        for i-left > maxBoxes || prefixWeights[i]-prefixWeights[left] > maxWeight {
            if len(queue) > 0 && queue[0] == left {
                queue = queue[1:]
            }
            left++
        }
        dp[i] = 2 + portsCnt[i] + (dp[queue[0]] - portsCnt[queue[0]+1])
        idx := dp[i] - portsCnt[i+1]
        for len(queue) > 0 && dp[queue[len(queue)-1]]-portsCnt[queue[len(queue)-1]+1] >= idx {
            queue = queue[:len(queue)-1]
        }
        queue = append(queue, i)
    }
    return dp[n]
}
