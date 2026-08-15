class Solution {
    func areOccurrencesEqual(_ s: String) -> Bool {
        var dict = [Character: Int]()
        for c in s {
            dict[c, default: 0] += 1
        }
        return Set(dict.values).count == 1
    }
}
