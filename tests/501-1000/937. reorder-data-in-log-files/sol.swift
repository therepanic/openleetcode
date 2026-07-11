class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        return logs.sorted { log1, log2 in
            let split1 = log1.split(separator: " ", maxSplits: 1)
            let split2 = log2.split(separator: " ", maxSplits: 1)
            let ident1 = String(split1[0])
            let ident2 = String(split2[0])
            let rest1 = String(split1[1])
            let rest2 = String(split2[1])
            let isDigit1 = rest1.first!.isNumber
            let isDigit2 = rest2.first!.isNumber
            if !isDigit1 && !isDigit2 {
                if rest1 != rest2 {
                    return rest1 < rest2
                }
                return ident1 < ident2
            }
            if isDigit1 && isDigit2 {
                return false
            }
            return !isDigit1
        }
    }
}
