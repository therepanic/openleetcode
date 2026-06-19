class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return 0
        }
        var c = 0
        var t = 2
        for i in 1..<(nums.count - 1) {
            if nums[i-1] - nums[i] == nums[i] - nums[i+1] {
                t += 1
            } else {
                t = 2
            }
            c += t - 2
        }
        return c
    }
}
