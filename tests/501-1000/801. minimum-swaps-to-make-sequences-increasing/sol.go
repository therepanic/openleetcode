func minSwap(nums1 []int, nums2 []int) int {
    n := len(nums1)
    keep := 0
    swap := 1
    
    for i := 1; i < n; i++ {
        inc := nums1[i] > nums1[i-1] && nums2[i] > nums2[i-1]
        cross := nums1[i] > nums2[i-1] && nums2[i] > nums1[i-1]
        
        if inc && cross {
            m := keep
            if swap < keep {
                m = swap
            }
            keep = m
            swap = m + 1
        } else if inc {
            swap += 1
        } else {
            keep, swap = swap, keep + 1
        }
    }
    
    if keep < swap {
        return keep
    }
    return swap
}
