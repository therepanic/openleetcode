func fourSumCount(nums1 []int, nums2 []int, nums3 []int, nums4 []int) int {
    m := make(map[int]int)
    for _, a := range nums1 {
        for _, b := range nums2 {
            m[a+b]++
        }
    }
    count := 0
    for _, c := range nums3 {
        for _, d := range nums4 {
            count += m[-(c + d)]
        }
    }
    return count
}
