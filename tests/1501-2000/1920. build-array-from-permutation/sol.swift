class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in 0..<nums.count {
            nums[i] += (1024 * (nums[nums[i]] % 1024))
        }
        
        for i in 0..<nums.count {
            nums[i] /= 1024
        }
        
        return nums
    }
}
