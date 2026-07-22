class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: 2 * n)
        for i in 0..<(2 * n) {
            if i % 2 == 0 {
                ans[i] = nums[i / 2]
            } else {
                ans[i] = nums[n + i / 2]
            }
        }
        return ans
    }
}
