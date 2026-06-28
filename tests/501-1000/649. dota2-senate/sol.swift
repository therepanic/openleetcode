class Solution {
    func predictPartyVictory(_ senate: String) -> String {
        var r = [Int]()
        var d = [Int]()
        let n = senate.count
        
        for (i, c) in senate.enumerated() {
            if c == "R" {
                r.append(i)
            } else {
                d.append(i)
            }
        }
        
        while !r.isEmpty && !d.isEmpty {
            let rIdx = r.removeFirst()
            let dIdx = d.removeFirst()
            
            if rIdx < dIdx {
                r.append(rIdx + n)
            } else {
                d.append(dIdx + n)
            }
        }
        
        return r.isEmpty ? "Dire" : "Radiant"
    }
}
