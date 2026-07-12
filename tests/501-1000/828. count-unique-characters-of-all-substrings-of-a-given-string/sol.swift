class Solution {
    func uniqueLetterString(_ s: String) -> Int {
        let n = s.count
        let chars = Array(s)
        var left = [Int](repeating: 0, count: n)
        var right = [Int](repeating: 0, count: n)
        var prev = [Int](repeating: -1, count: 26)

        for i in 0..<n {
            let idx = Int(chars[i].asciiValue! - Character("A").asciiValue!)
            left[i] = prev[idx]
            prev[idx] = i
        }

        prev = [Int](repeating: n, count: 26)

        for i in stride(from: n - 1, through: 0, by: -1) {
            let idx = Int(chars[i].asciiValue! - Character("A").asciiValue!)
            right[i] = prev[idx]
            prev[idx] = i
        }

        var ans = 0
        for i in 0..<n {
            ans += (i - left[i]) * (right[i] - i)
        }
        return ans
    }
}
