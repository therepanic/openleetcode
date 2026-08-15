class Solution {
    func minFlips(_ target: String) -> Int {
        var minCount = 0
        var flag = 0
        let n = target.count
        let chars = Array(target)
        
        for i in 0..<n {
            let expected = Character(String(UnicodeScalar(48 + flag % 2)!))
            if chars[i] != expected {
                minCount += 1
                flag += 1
            }
        }
        
        return minCount
    }
}
