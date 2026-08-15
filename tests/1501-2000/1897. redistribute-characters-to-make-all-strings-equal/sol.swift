class Solution {
    func makeEqual(_ words: [String]) -> Bool {
        var freq = [Int](repeating: 0, count: 26)
        let n = words.count
        for word in words {
            for ch in word.unicodeScalars {
                freq[Int(ch.value - 97)] += 1
            }
        }
        for count in freq {
            if count % n != 0 {
                return false
            }
        }
        return true
    }
}
