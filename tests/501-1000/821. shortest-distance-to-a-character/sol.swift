class Solution {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let n = s.count
        var ans = Array(repeating: n, count: n)
        var prev = -n
        let chars = Array(s)
        for i in 0..<n {
            if chars[i] == c {
                prev = i
            }
            ans[i] = i - prev
        }
        prev = 2 * n
        for i in stride(from: n - 1, through: 0, by: -1) {
            if chars[i] == c {
                prev = i
            }
            ans[i] = min(ans[i], prev - i)
        }
        return ans
    }
}
