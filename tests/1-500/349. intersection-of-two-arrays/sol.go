func intersection(nums1 []int, nums2 []int) []int {
    set1 := make(map[int]bool)
    set2 := make(map[int]bool)
    for _, v := range nums1 {
        set1[v] = true
    }
    for _, v := range nums2 {
        set2[v] = true
    }
    result := []int{}
    for k := range set1 {
        if set2[k] {
            result = append(result, k)
        }
    }
    return result
}
