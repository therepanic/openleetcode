class Solution {
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        let exact = Set(wordlist)
        var caseMap = [String: String]()
        var vowelMap = [String: String]()
        
        for w in wordlist {
            let lower = w.lowercased()
            let devowel = deVowel(lower)
            if caseMap[lower] == nil {
                caseMap[lower] = w
            }
            if vowelMap[devowel] == nil {
                vowelMap[devowel] = w
            }
        }
        
        return queries.map { q in
            if exact.contains(q) {
                return q
            } else {
                let lower = q.lowercased()
                let devowel = deVowel(lower)
                if let match = caseMap[lower] {
                    return match
                } else if let match = vowelMap[devowel] {
                    return match
                } else {
                    return ""
                }
            }
        }
    }
    
    private func deVowel(_ s: String) -> String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        return String(s.map { vowels.contains($0) ? "*" : $0 })
    }
}
