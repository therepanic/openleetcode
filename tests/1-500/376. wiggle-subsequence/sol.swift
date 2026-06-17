class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }

        var up = 1
        var down = 1

        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                up = down + 1
            } else if nums[i] < nums[i - 1] {
                down = up + 1
            }
        }

        return max(up, down)
    }
}
