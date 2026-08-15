func maxHappyGroups(batchSize int, groups []int) int {
    counts := make([]int, batchSize)
    happyCount := 0
    for _, g := range groups {
        rem := g % batchSize
        if rem == 0 {
            happyCount++
        } else {
            counts[rem]++
        }
    }
    
    for i := 1; i <= batchSize/2; i++ {
        if i == batchSize-i {
            pairCount := counts[i] / 2
            happyCount += pairCount
            counts[i] %= 2
        } else {
            pairCount := min(counts[i], counts[batchSize-i])
            happyCount += pairCount
            counts[i] -= pairCount
            counts[batchSize-i] -= pairCount
        }
    }
    
    state := make([]int, batchSize-1)
    for i := 0; i < batchSize-1; i++ {
        state[i] = counts[i+1]
    }
    
    memo := make(map[string]int)
    return happyCount + viterbi(state, 0, batchSize, memo)
}

func viterbi(counts []int, leftover int, batchSize int, memo map[string]int) int {
    key := fmt.Sprint(counts) + "," + strconv.Itoa(leftover)
    if val, ok := memo[key]; ok {
        return val
    }
    
    sum := 0
    for _, c := range counts {
        sum += c
    }
    if sum == 0 {
        memo[key] = 0
        return 0
    }
    
    res := 0
    for i, c := range counts {
        if c > 0 {
            rem := i + 1
            next := make([]int, len(counts))
            copy(next, counts)
            next[i]--
            
            isHappy := 0
            if leftover == 0 {
                isHappy = 1
            }
            newLeftover := (leftover + rem) % batchSize
            
            val := isHappy + viterbi(next, newLeftover, batchSize, memo)
            if val > res {
                res = val
            }
        }
    }
    memo[key] = res
    return res
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
