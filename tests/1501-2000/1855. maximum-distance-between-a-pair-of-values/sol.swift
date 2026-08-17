class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var i = 0, j = 0
        var ans = 0
        while i < nums1.count && j < nums2.count {
            if nums1[i] <= nums2[j] {
                ans = max(ans, j - i)
                j += 1
            } else {
                i += 1
                if i > j { j = i }
            }
        }
        return ans
    }
}
