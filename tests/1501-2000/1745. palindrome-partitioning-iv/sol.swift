class Solution {
    func checkPartitioning(_ s: String) -> Bool {
        let n = s.count
        var pal = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        let chars = Array(s)
        for i in 0..<n {
            pal[i][i] = true
        }
        for length in 2...n {
            for i in 0...(n-length) {
                let j = i+length-1
                if chars[i] == chars[j] && (length == 2 || pal[i+1][j-1]) {
                    pal[i][j] = true
                }
            }
        }
        for i in 0..<(n-2) {
            if pal[0][i] {
                for j in (i+1)..<(n-1) {
                    if pal[i+1][j] && pal[j+1][n-1] {
                        return true
                    }
                }
            }
        }
        return false
    }
}
