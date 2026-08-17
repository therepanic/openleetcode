class Solution {
    func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        var c: [Int: Int] = [:]
        for num in nums {
            c[num, default: 0] += 1
        }
        var ans = 0
        for (x, cnt) in c {
            ans += cnt * (c[x + k] ?? 0)
        }
        return ans
    }
}
