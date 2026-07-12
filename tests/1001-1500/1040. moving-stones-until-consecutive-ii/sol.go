func numMovesStonesII(stones []int) []int {
    sort.Ints(stones)
    n := len(stones)
    
    maxMoves := max(stones[n-1]-stones[1]-(n-2), stones[n-2]-stones[0]-(n-2))
    
    minMoves := n
    left := 0
    for right := 0; right < n; right++ {
        for stones[right]-stones[left]+1 > n {
            left++
        }
        currentWindowSize := right - left + 1
        if currentWindowSize == n-1 && stones[right]-stones[left]+1 == n-1 {
            minMoves = min(minMoves, 2)
        } else {
            minMoves = min(minMoves, n-currentWindowSize)
        }
    }
    
    return []int{minMoves, maxMoves}
}
