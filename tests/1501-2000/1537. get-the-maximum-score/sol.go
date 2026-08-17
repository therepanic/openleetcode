func maxSum(nums1 []int, nums2 []int) int {
    p1, p2 := 0, 0
    sum1, sum2, result := int64(0), int64(0), int64(0)
    for p1 < len(nums1) && p2 < len(nums2) {
        if nums1[p1] == nums2[p2] {
            if sum1 > sum2 {
                result += sum1
            } else {
                result += sum2
            }
            result += int64(nums1[p1])
            sum1, sum2 = 0, 0
            p1++
            p2++
        } else if nums1[p1] < nums2[p2] {
            sum1 += int64(nums1[p1])
            p1++
        } else {
            sum2 += int64(nums2[p2])
            p2++
        }
    }
    for p1 < len(nums1) {
        sum1 += int64(nums1[p1])
        p1++
    }
    for p2 < len(nums2) {
        sum2 += int64(nums2[p2])
        p2++
    }
    if sum1 > sum2 {
        result += sum1
    } else {
        result += sum2
    }
    return int(result % 1000000007)
}
