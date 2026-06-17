class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        func isValid(_ str: String) -> Bool {
            var ctr = 0
            for ch in str {
                if ch == "(" {
                    ctr += 1
                } else if ch == ")" {
                    if ctr == 0 { return false }
                    ctr -= 1
                }
            }
            return ctr == 0
        }
        
        var level = Set([s])
        while true {
            let valid = level.filter { isValid($0) }
            if !valid.isEmpty {
                return Array(valid)
            }
            var nextLevel = Set<String>()
            for str in level {
                for i in str.indices {
                    var s = str
                    s.remove(at: i)
                    nextLevel.insert(s)
                }
            }
            level = nextLevel
        }
    }
}
