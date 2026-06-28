class Solution {
    func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
        var ans = ""
        let sChars = Array(s)
        for word in dictionary {
            let wChars = Array(word)
            var i = 0, j = 0
            while i < wChars.count && j < sChars.count {
                if wChars[i] == sChars[j] {
                    i += 1
                }
                j += 1
            }
            if i == wChars.count {
                if wChars.count > ans.count {
                    ans = word
                } else if wChars.count == ans.count && word < ans {
                    ans = word
                }
            }
        }
        return ans
    }
}
