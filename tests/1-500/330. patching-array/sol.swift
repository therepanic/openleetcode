class Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var currentSum = 1
        var patches = 0
        var index = 0
        
        while currentSum <= n {
            if index < nums.count && nums[index] <= currentSum {
                currentSum += nums[index]
                index += 1
            } else {
                currentSum += currentSum
                patches += 1
            }
        }
        
        return patches
    }
}
