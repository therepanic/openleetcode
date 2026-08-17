class Solution {
    func longestPalindrome(_ word1: String, _ word2: String) -> Int {
        let chars = Array(word1 + word2)
        let leftChars = Array(word1)
        let rightChars = Array(word2)
        let n = chars.count
        var memo = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
        
        func fn(_ lo: Int, _ hi: Int) -> Int {
            if lo >= hi { return lo == hi ? 1 : 0 }
            if memo[lo][hi] != -1 { return memo[lo][hi] }
            if chars[lo] == chars[hi] {
                memo[lo][hi] = 2 + fn(lo+1, hi-1)
            } else {
                memo[lo][hi] = max(fn(lo+1, hi), fn(lo, hi-1))
            }
            return memo[lo][hi]
        }
        
        var ans = 0
        var seen = Set<Character>()
        for i in 0..<leftChars.count {
            let c = leftChars[i]
            if seen.contains(c) { continue }
            seen.insert(c)
            let idx1 = leftChars.firstIndex(of: c)!
            guard let idx2 = rightChars.lastIndex(of: c) else { continue }
            ans = max(ans, fn(idx1, idx2 + leftChars.count))
        }
        return ans
    }
}
