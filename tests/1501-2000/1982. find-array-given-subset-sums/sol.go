func recoverArray(n int, sums []int) []int {
    sort.Ints(sums)
    res := make([]int, n)
    
    for i := 0; i < n; i++ {
        d := sums[1] - sums[0]
        
        left := []int{}
        right := []int{}
        count := make(map[int]int)
        for _, s := range sums {
            count[s]++
        }
        
        for _, s := range sums {
            if count[s] > 0 {
                left = append(left, s)
                right = append(right, s+d)
                count[s]--
                count[s+d]--
            }
        }
        
        hasZero := false
        for _, s := range left {
            if s == 0 {
                hasZero = true
                break
            }
        }
        
        if hasZero {
            res[i] = d
            sums = left
        } else {
            res[i] = -d
            sums = right
        }
    }
    return res
}
