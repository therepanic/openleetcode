func avoidFlood(rains []int) []int {
    n := len(rains)
    res := make([]int, n)
    for i := range res {
        res[i] = -1
    }
    full := make(map[int]int)
    dry := []int{}
    for i, lake := range rains {
        if lake == 0 {
            dry = append(dry, i)
            res[i] = 1
        } else if prev, ok := full[lake]; ok {
            // binary search for first index > prev
            left, right := 0, len(dry)
            for left < right {
                mid := left + (right-left)/2
                if dry[mid] <= prev {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            if left == len(dry) {
                return []int{}
            }
            j := dry[left]
            res[j] = lake
            dry = append(dry[:left], dry[left+1:]...)
            full[lake] = i
        } else {
            full[lake] = i
        }
    }
    return res
}
