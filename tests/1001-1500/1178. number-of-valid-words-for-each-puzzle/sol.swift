class Solution {
    func findNumOfValidWords(_ words: [String], _ puzzles: [String]) -> [Int] {
        func getMask(_ s: String) -> Int {
            var mask = 0
            for ch in s {
                mask |= 1 << (Int(ch.asciiValue!) - 97)
            }
            return mask
        }
        
        var wordCount = [Int: Int]()
        for w in words {
            let mask = getMask(w)
            wordCount[mask, default: 0] += 1
        }
        
        var result = [Int]()
        for p in puzzles {
            let firstMask = 1 << (Int(p.first!.asciiValue!) - 97)
            let puzzleMask = getMask(p)
            var sub = puzzleMask
            var count = 0
            while true {
                if (sub & firstMask) != 0 {
                    count += wordCount[sub, default: 0]
                }
                if sub == 0 { break }
                sub = (sub - 1) & puzzleMask
            }
            result.append(count)
        }
        return result
    }
}
