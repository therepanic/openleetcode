func minAbsoluteSumDiff(nums1 []int, nums2 []int) int {
    const MOD = 1000000007
    n := len(nums1)
    sortedNums1 := make([]int, n)
    copy(sortedNums1, nums1)
    sort.Ints(sortedNums1)
    
    total := int64(0)
    maxReduction := int64(0)
    
    for i := 0; i < n; i++ {
        a := nums1[i]
        b := nums2[i]
        currDiff := abs1818(a - b)
        total += int64(currDiff)
        
        idx := sort.SearchInts(sortedNums1, b)
        
        if idx < n {
            reduction := int64(currDiff - abs1818(sortedNums1[idx]-b))
            if reduction > maxReduction {
                maxReduction = reduction
            }
        }
        if idx > 0 {
            reduction := int64(currDiff - abs1818(sortedNums1[idx-1]-b))
            if reduction > maxReduction {
                maxReduction = reduction
            }
        }
    }
    
    return int((total - maxReduction) % int64(MOD))
}

func abs1818(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
