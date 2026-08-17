func maxDistance(nums1 []int, nums2 []int) int {
    i, j := 0, 0
    ans := 0
    for i < len(nums1) && j < len(nums2) {
        if nums1[i] <= nums2[j] {
            if j-i > ans {
                ans = j - i
            }
            j++
        } else {
            i++
            if i > j {
                j = i
            }
        }
    }
    return ans
}
