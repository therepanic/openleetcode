class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        var total = 0
        for num in nums {
            total |= num
        }
        return total * (1 << (nums.count - 1))
    }
}
