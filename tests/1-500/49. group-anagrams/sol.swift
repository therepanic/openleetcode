class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [String: [String]] = [:]
        var keys = [String]()

        for word in strs {
            let key = String(word.sorted())
            if groups[key] == nil {
                groups[key] = []
                keys.append(key)
            }
            groups[key]!.append(word)
        }

        return keys.map { groups[$0]! }
    }
}
