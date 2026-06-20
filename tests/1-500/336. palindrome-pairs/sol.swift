class Solution {
    private func isPalindrome(_ s: String) -> Bool {
        return s == String(s.reversed())
    }

    func palindromePairs(_ words: [String]) -> [[Int]] {
        var ans = [[Int]]()
        var wordMap = [String: Int]()
        for (i, word) in words.enumerated() {
            wordMap[String(word.reversed())] = i
        }

        if let emptyIdx = wordMap[""] {
            for (i, word) in words.enumerated() {
                if !word.isEmpty && isPalindrome(word) {
                    ans.append([i, emptyIdx])
                }
            }
        }

        for (i, word) in words.enumerated() {
            for j in 0..<word.count {
                let leftIndex = word.index(word.startIndex, offsetBy: j)
                let left = String(word[...leftIndex])
                let right = String(word[word.index(after: leftIndex)...])
                if let idx = wordMap[left], isPalindrome(right), idx != i {
                    ans.append([i, idx])
                }
                if let idx = wordMap[right], isPalindrome(left), idx != i {
                    ans.append([idx, i])
                }
            }
        }
        return ans
    }
}
