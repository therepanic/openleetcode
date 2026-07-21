class Solution {
    func numSmallerByFrequency(_ queries: [String], _ words: [String]) -> [Int] {
        func f(_ s: String) -> Int {
            var minChar: Character = "z"
            var count = 0
            for char in s {
                if char < minChar {
                    minChar = char
                    count = 1
                } else if char == minChar {
                    count += 1
                }
            }
            return count
        }
        
        var buckets = [Int](repeating: 0, count: 12)
        for w in words {
            buckets[f(w)] += 1
        }
        for i in stride(from: 9, through: 0, by: -1) {
            buckets[i] += buckets[i + 1]
        }
        
        return queries.map { buckets[f($0) + 1] }
    }
}
