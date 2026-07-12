func numsSameConsecDiff(n int, k int) []int {
    res := make(map[int]bool)
    for x := 1; x <= 9; x++ {
        res[x] = true
    }
    n -= 1
    
    for n > 0 {
        next := make(map[int]bool)
        for val := range res {
            last := val % 10
            if last + k < 10 {
                next[val * 10 + last + k] = true
            }
            if last - k >= 0 {
                next[val * 10 + last - k] = true
            }
        }
        res = next
        n -= 1
    }
    
    result := make([]int, 0, len(res))
    for val := range res {
        result = append(result, val)
    }
    return result
}
