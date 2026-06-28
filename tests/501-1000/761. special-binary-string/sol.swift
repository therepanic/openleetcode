class Solution {
    func makeLargestSpecial(_ s: String) -> String {
        var count = 0
        var i = 0
        var res = [String]()
        let chars = Array(s)
        
        for j in 0..<chars.count {
            count += (chars[j] == "1" ? 1 : -1)
            
            if count == 0 {
                let inner = String(chars[(i + 1)...j])
                res.append("1" + makeLargestSpecial(inner) + "0")
                i = j + 1
            }
        }
        
        res.sort(by: >)
        return res.joined()
    }
}
