class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var left = 0
        var right = 0
        var res = 0
        var total = 0

        while right < nums.count {
            total += nums[right]

            while nums[right] * (right - left + 1) > total + k {
                total -= nums[left]
                left += 1
            }
            
            res = max(res, right - left + 1)
            right += 1
        }
        
        return res
    }
}
