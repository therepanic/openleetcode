class Solution {
    func maxScore(_ s: String) -> Int {
        let totalOnes = s.filter { $0 == "1" }.count
        var zerosCount = 0
        var onesCount = 0
        var bestScore = Int.min
        let chars = Array(s)
        
        for i in 0..<(chars.count - 1) {
            if chars[i] == "0" {
                zerosCount += 1
            } else {
                onesCount += 1
            }
            
            let currentScore = zerosCount + (totalOnes - onesCount)
            bestScore = max(bestScore, currentScore)
        }
        
        return bestScore
    }
}
