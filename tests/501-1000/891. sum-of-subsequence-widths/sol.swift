class Solution {
    func sumSubseqWidths(_ nums: [Int]) -> Int {
        let mod = 1000000007
        let sorted = nums.sorted()
        let n = sorted.count
        var ans = 0
        var factor = 1
        for i in 0..<n {
            ans = (ans + (sorted[i] - sorted[n - 1 - i]) * factor) % mod
            factor = (factor * 2) % mod
        }
        return ans
    }
}
