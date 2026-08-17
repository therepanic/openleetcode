class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var nums = nums.sorted()
        var res = Array(repeating: 0, count: nums.count)
        let mid = (nums.count + 1) / 2
        var j = 0
        var i = 0
        while i < nums.count {
            res[i] = nums[j]
            j += 1
            i += 2
        }
        j = mid
        i = 1
        while i < nums.count {
            res[i] = nums[j]
            j += 1
            i += 2
        }
        return res
    }
}
