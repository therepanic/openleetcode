func canDistribute(nums []int, quantity []int) bool {
    sort.Sort(sort.Reverse(sort.IntSlice(quantity)))
    freqCounts := make(map[int]int)
    freqMap := make(map[int]int)
    for _, n := range nums {
        freqMap[n]++
    }
    for _, f := range freqMap {
        freqCounts[f]++
    }
    
    var backtrack func(int) bool
    backtrack = func(i int) bool {
        if i == len(quantity) {
            return true
        }
        for freq := range freqCounts {
            count := freqCounts[freq]
            if freq >= quantity[i] && count > 0 {
                freqCounts[freq]--
                newFreq := freq - quantity[i]
                freqCounts[newFreq]++
                if backtrack(i + 1) {
                    return true
                }
                freqCounts[freq]++
                freqCounts[newFreq]--
                if freqCounts[newFreq] == 0 {
                    delete(freqCounts, newFreq)
                }
            }
        }
        return false
    }
    
    return backtrack(0)
}
