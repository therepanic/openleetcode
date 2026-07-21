func minDays(bloomDay []int, m int, k int) int {
    if m*k > len(bloomDay) {
        return -1
    }
    
    f := func(timeLimit int) bool {
        cntr := 0
        bouquetCntr := 0
        for _, day := range bloomDay {
            if day <= timeLimit {
                cntr++
                if cntr == k {
                    bouquetCntr++
                    cntr = 0
                }
            } else {
                cntr = 0
            }
        }
        return bouquetCntr >= m
    }
    
    s := bloomDay[0]
    e := bloomDay[0]
    for _, day := range bloomDay {
        if day < s {
            s = day
        }
        if day > e {
            e = day
        }
    }
    
    ans := -1
    for s <= e {
        mid := s + (e-s)/2
        if f(mid) {
            ans = mid
            e = mid - 1
        } else {
            s = mid + 1
        }
    }
    
    return ans
}
