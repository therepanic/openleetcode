class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }

        let m = nums1.count
        let n = nums2.count
        let totalLeft = (m + n + 1) / 2
        var left = 0
        var right = m

        while left <= right {
            let i = (left + right) / 2
            let j = totalLeft - i

            let maxLeft1 = i == 0 ? Int.min : nums1[i - 1]
            let minRight1 = i == m ? Int.max : nums1[i]
            let maxLeft2 = j == 0 ? Int.min : nums2[j - 1]
            let minRight2 = j == n ? Int.max : nums2[j]

            if maxLeft1 <= minRight2 && maxLeft2 <= minRight1 {
                let leftMax = max(maxLeft1, maxLeft2)
                if ((m + n) & 1) == 1 {
                    return Double(leftMax)
                }
                let rightMin = min(minRight1, minRight2)
                return Double(leftMax + rightMin) / 2.0
            }

            if maxLeft1 > minRight2 {
                right = i - 1
            } else {
                left = i + 1
            }
        }

        return 0.0
    }
}
