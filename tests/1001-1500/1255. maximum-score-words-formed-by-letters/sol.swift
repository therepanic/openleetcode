class Solution {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        var freq = Array(repeating: 0, count: 26)
        for c in letters {
            freq[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        var ans = 0
        
        func comb(_ i: Int, _ freq: [Int], _ total: Int) {
            if i == words.count {
                ans = max(ans, total)
                return
            }
            
            let same = freq
            let rem = total
            var tempFreq = freq
            var newTotal = total
            var full = true
            
            for ch in words[i] {
                let idx = Int(ch.asciiValue! - Character("a").asciiValue!)
                if tempFreq[idx] == 0 {
                    full = false
                    break
                }
                tempFreq[idx] -= 1
                newTotal += score[idx]
            }
            
            if full {
                comb(i + 1, tempFreq, newTotal)
                comb(i + 1, same, rem)
            } else {
                comb(i + 1, same, rem)
            }
        }
        
        comb(0, freq, 0)
        return ans
    }
}
