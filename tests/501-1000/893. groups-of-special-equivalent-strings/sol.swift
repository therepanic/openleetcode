class Solution {
    func numSpecialEquivGroups(_ words: [String]) -> Int {
        var seen = Set<String>()
        for w in words {
            var even = [Character]()
            var odd = [Character]()
            for (i, c) in w.enumerated() {
                if i % 2 == 0 {
                    even.append(c)
                } else {
                    odd.append(c)
                }
            }
            even.sort()
            odd.sort()
            seen.insert(String(even) + "," + String(odd))
        }
        return seen.count
    }
}
