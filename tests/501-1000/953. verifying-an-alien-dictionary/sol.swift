class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var orderMap: [Character: Int] = [:]
        for (i, char) in order.enumerated() {
            orderMap[char] = i
        }

        for i in 0..<words.count - 1 {
            let w1 = Array(words[i])
            let w2 = Array(words[i + 1])

            let minLen = min(w1.count, w2.count)
            var j = 0
            while j < minLen {
                if w1[j] != w2[j] {
                    if orderMap[w1[j]]! > orderMap[w2[j]]! {
                        return false
                    }
                    break
                }
                j += 1
            }
            if j == minLen && w1.count > w2.count {
                return false
            }
        }

        return true
    }
}
