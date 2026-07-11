func splitArraySameAverage(nums []int) bool {
    n := len(nums)
    if n < 2 {
        return false
    }
    total := 0
    for _, v := range nums {
        total += v
    }
    transformed := make([]int, n)
    for i, v := range nums {
        transformed[i] = v * n - total
    }
    
    mid := n >> 1
    generate := func(arr []int) map[int]map[int]bool {
        mp := make(map[int]map[int]bool)
        for mask := 1; mask < (1 << len(arr)); mask++ {
            sum, cnt := 0, 0
            for i, v := range arr {
                if mask & (1 << i) != 0 {
                    sum += v
                    cnt++
                }
            }
            if mp[cnt] == nil {
                mp[cnt] = make(map[int]bool)
            }
            mp[cnt][sum] = true
        }
        return mp
    }
    
    mpA := generate(transformed[:mid])
    mpB := generate(transformed[mid:])
    
    for cnt, set := range mpA {
        if set[0] && cnt != 0 {
            return true
        }
    }
    for cnt, set := range mpB {
        if set[0] && cnt != 0 {
            return true
        }
    }
    
    for cntA, setA := range mpA {
        for cntB, setB := range mpB {
            totalCnt := cntA + cntB
            if totalCnt == 0 || totalCnt == n {
                continue
            }
            for v := range setA {
                if setB[-v] {
                    return true
                }
            }
        }
    }
    return false
}
