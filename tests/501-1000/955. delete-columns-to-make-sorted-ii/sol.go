func minDeletionSize(strs []string) int {
    n := len(strs)
    m := len(strs[0])
    sortedPairs := make([]bool, n-1)
    delCount := 0

    for col := 0; col < m; col++ {
        bad := false
        for i := 0; i < n-1; i++ {
            if !sortedPairs[i] && strs[i][col] > strs[i+1][col] {
                bad = true
                break
            }
        }

        if bad {
            delCount++
            continue
        }

        for i := 0; i < n-1; i++ {
            if !sortedPairs[i] && strs[i][col] < strs[i+1][col] {
                sortedPairs[i] = true
            }
        }

        allSorted := true
        for _, v := range sortedPairs {
            if !v {
                allSorted = false
                break
            }
        }
        if allSorted {
            break
        }
    }

    return delCount
}
