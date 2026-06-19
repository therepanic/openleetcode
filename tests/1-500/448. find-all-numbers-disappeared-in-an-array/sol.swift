class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in 0..<nums.count {
            let idx = abs(nums[i]) - 1
            if nums[idx] > 0 {
                nums[idx] *= -1
            }
        }
        var res = [Int]()
        for i in 0..<nums.count {
            if nums[i] > 0 {
                res.append(i + 1)
            }
        }
        return res
    }
}
