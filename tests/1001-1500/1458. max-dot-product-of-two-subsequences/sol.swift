class Solution {
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var memo = Array(repeating: Array(repeating: Int.min, count: nums2.count), count: nums1.count)
        
        func dp(_ i: Int, _ j: Int) -> Int {
            if i == nums1.count || j == nums2.count {
                return Int.min
            }
            if memo[i][j] != Int.min {
                return memo[i][j]
            }
            
            let take = nums1[i] * nums2[j]
            var res = take
            let takeAndContinue = dp(i+1, j+1)
            if takeAndContinue != Int.min {
                res = max(res, take + takeAndContinue)
            }
            res = max(res, dp(i+1, j))
            res = max(res, dp(i, j+1))
            
            memo[i][j] = res
            return res
        }
        
        return dp(0, 0)
    }
}
