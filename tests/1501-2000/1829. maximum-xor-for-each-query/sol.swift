class Solution {
    func getMaximumXor(_ nums: [Int], _ maximumBit: Int) -> [Int] {
        let n = nums.count
        var ans = [Int](repeating: 0, count: n)
        let mask = (1 << maximumBit) - 1
        var curr = 0
        for i in 0..<n {
            curr ^= nums[i]
            ans[n - 1 - i] = mask ^ curr
        }
        return ans
    }
}
