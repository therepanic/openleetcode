class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        if nums.count < 3 { return 0 }
        var best = nums[0] + nums[1] + nums[2]
        for i in 0..<(nums.count - 2) {
            var l = i + 1
            var r = nums.count - 1
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                if abs(target - sum) < abs(target - best) { best = sum }
                if sum == target { return target }
                if sum < target {
                    l += 1
                } else {
                    r -= 1
                }
            }
        }
        return best
    }
}
