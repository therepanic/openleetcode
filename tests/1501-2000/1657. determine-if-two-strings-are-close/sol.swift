class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        if word1.count != word2.count { return false }
        let set1 = Set(word1)
        let set2 = Set(word2)
        if set1 != set2 { return false }
        var dct: [Int: Int] = [:]
        for x in set1 {
            let n1 = word1.filter { $0 == x }.count
            let n2 = word2.filter { $0 == x }.count
            dct[n1, default: 0] += 1
            dct[n2, default: 0] -= 1
        }
        return dct.values.allSatisfy { $0 == 0 }
    }
}
