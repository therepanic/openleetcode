class Solution {
    func repeatedNTimes(_ nums: [Int]) -> Int {
        let n = nums.count - 2
        for i in 0..<n {
            if nums[i] == nums[i + 1] || nums[i] == nums[i + 2] {
                return nums[i]
            }
        }
        return nums[n + 1]
    }
}
