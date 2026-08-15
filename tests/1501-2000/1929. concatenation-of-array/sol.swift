class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = [Int](repeating: 0, count: 2 * n)
        for i in 0..<(2 * n) {
            ans[i] = nums[i % n]
        }
        return ans
    }
}
