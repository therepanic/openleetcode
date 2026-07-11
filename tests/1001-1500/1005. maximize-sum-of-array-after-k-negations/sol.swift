class Solution {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var remainingK = k
        for i in 0..<nums.count {
            if nums[i] < 0 && remainingK > 0 {
                nums[i] = -nums[i]
                remainingK -= 1
            }
        }
        nums = nums.sorted()
        if remainingK > 0 && remainingK % 2 != 0 {
            nums[0] = -nums[0]
        }
        return nums.reduce(0, +)
    }
}
