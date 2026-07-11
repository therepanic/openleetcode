func advantageCount(nums1 []int, nums2 []int) []int {
    n := len(nums1)
    sort.Ints(nums1)
    
    nums2Sorted := make([][2]int, n)
    for i := 0; i < n; i++ {
        nums2Sorted[i] = [2]int{nums2[i], i}
    }
    sort.Slice(nums2Sorted, func(i, j int) bool {
        return nums2Sorted[i][0] < nums2Sorted[j][0]
    })
    
    res := make([]int, n)
    left, right := 0, n-1
    for i := n - 1; i >= 0; i-- {
        if nums1[right] > nums2Sorted[i][0] {
            res[nums2Sorted[i][1]] = nums1[right]
            right--
        } else {
            res[nums2Sorted[i][1]] = nums1[left]
            left++
        }
    }
    
    return res
}
