class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        let n = words.count
        var ans = [String]()
        for i in 0..<n {
            for j in 0..<n {
                if i != j && words[j].contains(words[i]) {
                    ans.append(words[i])
                    break
                }
            }
        }
        return ans
    }
}
