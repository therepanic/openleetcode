class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var r = [Int]()
        for x in nums {
            let idx = abs(x) - 1
            if nums[idx] < 0 {
                r.append(abs(x))
            } else {
                nums[idx] = -nums[idx]
            }
        }
        return r
    }
}
