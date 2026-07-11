class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let bannedSet = Set(banned)
        var counts = [String: Int]()
        let words = paragraph.lowercased().split { !$0.isLetter }.map(String.init)
        for w in words {
            if !bannedSet.contains(w) {
                counts[w, default: 0] += 1
            }
        }
        return counts.max { $0.value < $1.value }!.key
    }
}
