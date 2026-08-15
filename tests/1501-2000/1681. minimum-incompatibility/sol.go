func minimumIncompatibility(nums []int, k int) int {
    n := len(nums)
    sz := n / k
    
    counts := make(map[int]int)
    for _, num := range nums {
        counts[num]++
    }
    for _, v := range counts {
        if v > k {
            return -1
        }
    }
    
    sort.Ints(nums)
    
    validSubsets := make(map[int]int)
    for mask := 0; mask < (1 << n); mask++ {
        if bits.OnesCount(uint(mask)) == sz {
            subset := []int{}
            for i := 0; i < n; i++ {
                if (mask>>i)&1 == 1 {
                    subset = append(subset, nums[i])
                }
            }
            set := make(map[int]bool)
            for _, val := range subset {
                set[val] = true
            }
            if len(set) == sz {
                minVal := subset[0]
                maxVal := subset[0]
                for _, val := range subset {
                    if val < minVal {
                        minVal = val
                    }
                    if val > maxVal {
                        maxVal = val
                    }
                }
                validSubsets[mask] = maxVal - minVal
            }
        }
    }
    
    memo := make(map[int]int)
    var solve func(int) int
    solve = func(remainingMask int) int {
        if remainingMask == 0 {
            return 0
        }
        if val, ok := memo[remainingMask]; ok {
            return val
        }
        
        firstElement := bits.TrailingZeros(uint(remainingMask & -remainingMask))
        res := math.MaxInt32
        
        for mask, cost := range validSubsets {
            if mask&remainingMask == mask && (mask>>firstElement)&1 == 1 {
                next := solve(remainingMask ^ mask)
                if next != math.MaxInt32 {
                    if cost+next < res {
                        res = cost + next
                    }
                }
            }
        }
        
        memo[remainingMask] = res
        return res
    }
    
    ans := solve((1 << n) - 1)
    if ans == math.MaxInt32 {
        return -1
    }
    return ans
}
