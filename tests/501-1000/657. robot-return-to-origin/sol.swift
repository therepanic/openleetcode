class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var countL = 0, countR = 0, countU = 0, countD = 0
        for c in moves {
            switch c {
            case "L": countL += 1
            case "R": countR += 1
            case "U": countU += 1
            case "D": countD += 1
            default: break
            }
        }
        return countL == countR && countU == countD
    }
}
