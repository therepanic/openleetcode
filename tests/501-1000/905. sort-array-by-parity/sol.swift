class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums
        var left = 0
        for i in 0..<nums.count {
            if nums[i] % 2 == 0 {
                nums.swapAt(left, i)
                left += 1
            }
        }
        return nums
    }
}
