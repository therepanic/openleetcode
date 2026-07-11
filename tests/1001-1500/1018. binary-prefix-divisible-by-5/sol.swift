class Solution {
    func prefixesDivBy5(_ nums: [Int]) -> [Bool] {
        var ans = [Bool]()
        var val = 0
        for bit in nums {
            val = (val * 2 + bit) % 5
            ans.append(val == 0)
        }
        return ans
    }
}
