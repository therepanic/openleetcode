class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let l = nums.count
        var total = l
        var summ = 0
        for i in 0..<l {
            total += i
            summ += nums[i]
        }
        return total - summ
    }
}
