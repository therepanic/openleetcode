class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let words = Set(wordDict)
        var memo = [String: [String]]()
        func solve(_ text: String) -> [String] {
            if let found = memo[text] { return found }
            var result = [String]()
            if words.contains(text) { result.append(text) }
            if text.count >= 2 {
                for i in 1..<text.count {
                    let prefix = String(text.prefix(i))
                    if !words.contains(prefix) { continue }
                    let suffix = String(text.dropFirst(i))
                    for tail in solve(suffix) { result.append(prefix + " " + tail) }
                }
            }
            memo[text] = result
            return result
        }
        return solve(s)
    }
}
