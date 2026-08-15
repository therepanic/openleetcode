class Solution {
    func maxSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var p1 = 0, p2 = 0
        var sum1 = 0, sum2 = 0, result = 0
        while p1 < nums1.count && p2 < nums2.count {
            if nums1[p1] == nums2[p2] {
                result += max(sum1, sum2) + nums1[p1]
                sum1 = 0; sum2 = 0
                p1 += 1; p2 += 1
            } else if nums1[p1] < nums2[p2] {
                sum1 += nums1[p1]
                p1 += 1
            } else {
                sum2 += nums2[p2]
                p2 += 1
            }
        }
        while p1 < nums1.count {
            sum1 += nums1[p1]
            p1 += 1
        }
        while p2 < nums2.count {
            sum2 += nums2[p2]
            p2 += 1
        }
        return (result + max(sum1, sum2)) % 1000000007
    }
}
