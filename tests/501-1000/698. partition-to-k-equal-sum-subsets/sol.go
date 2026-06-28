func canPartitionKSubsets(nums []int, k int) bool {
    total := 0
    for _, v := range nums {
        total += v
    }
    if total % k != 0 {
        return false
    }
    target := total / k
    sort.Slice(nums, func(i, j int) bool {
        return nums[i] > nums[j]
    })
    if nums[0] > target {
        return false
    }
    n := len(nums)
    memo := make(map[int]bool)
    
    var dfs func(int, int) bool
    dfs = func(used int, curr int) bool {
        if used == (1 << n) - 1 {
            return true
        }
        key := (used << 10) | curr
        if val, ok := memo[key]; ok {
            return val
        }
        for i := 0; i < n; i++ {
            if (used >> i) & 1 == 0 && curr + nums[i] <= target {
                newCurr := curr + nums[i]
                nxt := 0
                if newCurr != target {
                    nxt = newCurr
                }
                if dfs(used | (1 << i), nxt) {
                    memo[key] = true
                    return true
                }
            }
        }
        memo[key] = false
        return false
    }
    
    return dfs(0, 0)
}
