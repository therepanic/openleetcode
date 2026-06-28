class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        var left = [Int: Int]()
        var right = [Int: Int]()
        var count = [Int: Int]()
        
        for (i, x) in nums.enumerated() {
            if left[x] == nil {
                left[x] = i
            }
            right[x] = i
            count[x, default: 0] += 1
        }
        
        var ans = nums.count
        let degree = count.values.max() ?? 0
        
        for (x, c) in count {
            if c == degree {
                ans = min(ans, right[x]! - left[x]! + 1)
            }
        }
        
        return ans
    }
}
