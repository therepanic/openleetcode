class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var ans = [Int]()
        if s.isEmpty || words.isEmpty { return ans }

        let chars = Array(s)
        let wordLen = words[0].count
        let wordCount = words.count
        var target = [String: Int]()
        for word in words {
            target[word, default: 0] += 1
        }

        for offset in 0..<wordLen {
            var left = offset
            var right = offset
            var used = 0
            var window = [String: Int]()

            while right + wordLen <= chars.count {
                let word = String(chars[right..<right + wordLen])
                right += wordLen

                if target[word] != nil {
                    window[word, default: 0] += 1
                    used += 1
                    while window[word] ?? 0 > target[word] ?? 0 {
                        let leftWord = String(chars[left..<left + wordLen])
                        window[leftWord, default: 0] -= 1
                        left += wordLen
                        used -= 1
                    }
                    if used == wordCount {
                        ans.append(left)
                        let leftWord = String(chars[left..<left + wordLen])
                        window[leftWord, default: 0] -= 1
                        left += wordLen
                        used -= 1
                    }
                } else {
                    window.removeAll()
                    used = 0
                    left = right
                }
            }
        }

        return ans
    }
}
