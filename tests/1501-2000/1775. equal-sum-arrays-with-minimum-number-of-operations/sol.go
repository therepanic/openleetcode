func minOperations(nums1 []int, nums2 []int) int {
    x, y := 0, 0
    for _, v := range nums1 { x += v }
    for _, v := range nums2 { y += v }
    if x == y { return 0 }
    if x < y {
        if 6*len(nums1) < len(nums2) { return -1 }
        gains := make([]int, 0, len(nums1)+len(nums2))
        for _, v := range nums1 { gains = append(gains, 6-v) }
        for _, v := range nums2 { gains = append(gains, v-1) }
        sort.Sort(sort.Reverse(sort.IntSlice(gains)))
        diff := y - x
        ops := 0
        for _, g := range gains {
            if diff <= 0 { break }
            diff -= g
            ops++
        }
        if diff <= 0 { return ops }
        return -1
    } else {
        if 6*len(nums2) < len(nums1) { return -1 }
        gains := make([]int, 0, len(nums1)+len(nums2))
        for _, v := range nums1 { gains = append(gains, v-1) }
        for _, v := range nums2 { gains = append(gains, 6-v) }
        sort.Sort(sort.Reverse(sort.IntSlice(gains)))
        diff := x - y
        ops := 0
        for _, g := range gains {
            if diff <= 0 { break }
            diff -= g
            ops++
        }
        if diff <= 0 { return ops }
        return -1
    }
}
