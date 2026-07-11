class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        let n = nums.count
        var right_max = [Int](repeating: 0, count: n)
        right_max[n - 1] = nums[n - 1]
        
        for i in stride(from: n - 2, through: 0, by: -1) {
            right_max[i] = max(nums[i], right_max[i + 1])
        }
        
        var i = 0, j = 0, result = 0
        while j < n {
            if nums[i] <= right_max[j] {
                result = max(result, j - i)
                j += 1
            } else {
                i += 1
            }
        }
        
        return result
    }
}
