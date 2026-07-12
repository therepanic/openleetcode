class Solution {
    func strWithout3a3b(_ a: Int, _ b: Int) -> String {
        var res = ""
        var aCount = a
        var bCount = b
        var prevA = 0
        var prevB = 0
        
        while aCount > 0 || bCount > 0 {
            if prevA == 2 && bCount > 0 {
                res += "b"
                bCount -= 1
                prevB += 1
                prevA = 0
            } else if prevB == 2 && aCount > 0 {
                res += "a"
                aCount -= 1
                prevA += 1
                prevB = 0
            } else if aCount > bCount && aCount > 0 {
                res += "a"
                aCount -= 1
                prevA += 1
            } else if bCount > 0 {
                res += "b"
                bCount -= 1
                prevB += 1
            }
        }
        return res
    }
}
