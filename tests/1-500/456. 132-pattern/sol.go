func find132pattern(nums []int) bool {
    type pair [2]int
    st := []pair{}
    cur_min := nums[0]

    for _, n := range nums[1:] {
        for len(st) > 0 && n >= st[len(st)-1][0] {
            st = st[:len(st)-1]
        }
        
        if len(st) > 0 && n > st[len(st)-1][1] {
            return true
        }
        
        st = append(st, pair{n, cur_min})
        if n < cur_min {
            cur_min = n
        }
    }
    
    return false
}
