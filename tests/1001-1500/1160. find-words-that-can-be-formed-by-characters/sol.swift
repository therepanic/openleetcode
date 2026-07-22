class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var ch = [Character: Int]()
        for c in chars {
            ch[c, default: 0] += 1
        }
        
        var res = 0
        for word in words {
            var copy = ch
            var good = true
            for c in word {
                if let count = copy[c], count > 0 {
                    copy[c] = count - 1
                } else {
                    res -= word.count
                    good = false
                    break
                }
            }
            res += word.count
        }
        return res
    }
}
