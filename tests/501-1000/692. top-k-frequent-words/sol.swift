class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var counter = [String: Int]()
        for w in words {
            counter[w, default: 0] += 1
        }
        var heap = counter.map { (-$0.value, $0.key) }
        heap.sort { a, b in
            if a.0 != b.0 { return a.0 < b.0 }
            return a.1 < b.1
        }
        return Array(heap.prefix(k).map { $0.1 })
    }
}
