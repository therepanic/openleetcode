class Solution {
    func reorganizeString(_ s: String) -> String {
        var charFreq: [Character: Int] = [:]
        for c in s {
            charFreq[c, default: 0] += 1
        }
        
        var maxHeap = charFreq.map { (-$0.value, $0.key) }
        maxHeap.sort { $0.0 < $1.0 }
        
        var res = ""
        var prevFreq = 0
        var prevChar: Character = " "
        
        while !maxHeap.isEmpty {
            let (freq, char) = maxHeap.removeFirst()
            res.append(char)
            
            if prevFreq < 0 {
                maxHeap.append((prevFreq, prevChar))
                maxHeap.sort { $0.0 < $1.0 }
            }
            
            prevFreq = freq + 1
            prevChar = char
        }
        
        if res.count != s.count {
            return ""
        }
        
        return res
    }
}
