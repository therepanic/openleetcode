class Solution {
    func largestMerge(_ word1: String, _ word2: String) -> String {
        var res = ""
        var i = word1.startIndex
        var j = word2.startIndex
        while i < word1.endIndex && j < word2.endIndex {
            if word1[i] > word2[j] {
                res.append(word1[i])
                i = word1.index(after: i)
            } else if word1[i] < word2[j] {
                res.append(word2[j])
                j = word2.index(after: j)
            } else {
                var p = i
                var q = j
                while p < word1.endIndex && q < word2.endIndex && word1[p] == word2[q] {
                    p = word1.index(after: p)
                    q = word2.index(after: q)
                }
                if q == word2.endIndex || (p < word1.endIndex && word1[p] > word2[q]) {
                    res.append(word1[i])
                    i = word1.index(after: i)
                } else {
                    res.append(word2[j])
                    j = word2.index(after: j)
                }
            }
        }
        while i < word1.endIndex {
            res.append(word1[i])
            i = word1.index(after: i)
        }
        while j < word2.endIndex {
            res.append(word2[j])
            j = word2.index(after: j)
        }
        return res
    }
}
