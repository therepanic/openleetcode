class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        var chains = [String: Int]()
        let sortedWords = words.sorted { $0.count < $1.count }
        
        for word in sortedWords {
            chains[word] = 1
            for i in word.indices {
                var pred = word
                pred.remove(at: i)
                if let prevChain = chains[pred] {
                    chains[word] = max(chains[word]!, prevChain + 1)
                }
            }
        }
        
        return chains.values.max() ?? 0
    }
}
