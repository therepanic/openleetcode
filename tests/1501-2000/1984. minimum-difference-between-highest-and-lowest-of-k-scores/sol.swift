class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        let sorted = nums.sorted()
        let n = sorted.count
        var ans = sorted[k - 1] - sorted[0]
        for i in 0...(n - k) {
            ans = min(ans, sorted[i + k - 1] - sorted[i])
        }
        return ans
    }
}
