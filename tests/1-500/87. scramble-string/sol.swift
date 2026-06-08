class Solution {
    private var memo: [String: Bool] = [:]
    private var a: [Character] = []
    private var b: [Character] = []

    func isScramble(_ s1: String, _ s2: String) -> Bool {
        if s1.count != s2.count { return false }
        memo.removeAll()
        a = Array(s1)
        b = Array(s2)
        return dfs(0, 0, a.count)
    }

    private func dfs(_ i: Int, _ j: Int, _ len: Int) -> Bool {
        let key = "\(i),\(j),\(len)"
        if let cached = memo[key] { return cached }
        var same = true
        for k in 0..<len {
            if a[i + k] != b[j + k] {
                same = false
                break
            }
        }
        if same {
            memo[key] = true
            return true
        }
        var counts = Array(repeating: 0, count: 26)
        let base = Character("a").asciiValue!
        for k in 0..<len {
            counts[Int(a[i + k].asciiValue! - base)] += 1
            counts[Int(b[j + k].asciiValue! - base)] -= 1
        }
        if counts.contains(where: { $0 != 0 }) {
            memo[key] = false
            return false
        }
        for split in 1..<len {
            if dfs(i, j, split) && dfs(i + split, j + split, len - split) {
                memo[key] = true
                return true
            }
            if dfs(i, j + len - split, split) && dfs(i + split, j, len - split) {
                memo[key] = true
                return true
            }
        }
        memo[key] = false
        return false
    }
}
