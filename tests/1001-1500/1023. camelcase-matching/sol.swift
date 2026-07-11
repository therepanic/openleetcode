class Solution {
    func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
        var ans: [Bool] = []
        for query in queries {
            var j = 0
            var i = 0
            while i < query.count {
                let idx = query.index(query.startIndex, offsetBy: i)
                if query[idx].isUppercase && ((j < pattern.count && query[idx] != pattern[pattern.index(pattern.startIndex, offsetBy: j)]) || j > pattern.count - 1) {
                    break
                }
                if j < pattern.count && query[idx] == pattern[pattern.index(pattern.startIndex, offsetBy: j)] {
                    j += 1
                }
                i += 1
            }
            if i == query.count && j == pattern.count {
                ans.append(true)
            } else {
                ans.append(false)
            }
        }
        return ans
    }
}
