class Solution {
    func countSubstrings(_ s: String, _ t: String) -> Int {
        let sChars = Array(s)
        let tChars = Array(t)
        let m = sChars.count, n = tChars.count
        var result = 0

        for i in 0..<m {
            for j in 0..<n {
                var diff = 0
                var k = 0
                while i + k < m && j + k < n {
                    if sChars[i + k] != tChars[j + k] {
                        diff += 1
                    }
                    if diff > 1 {
                        break
                    }
                    if diff == 1 {
                        result += 1
                    }
                    k += 1
                }
            }
        }

        return result
    }
}
