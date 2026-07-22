class Solution {
    func numSteps(_ s: String) -> Int {
        var steps = 0
        var carry = 0
        let chars = Array(s)
        
        for i in stride(from: chars.count - 1, to: 0, by: -1) {
            let bit = (Int(String(chars[i])) ?? 0) + carry
            
            if bit == 1 {
                steps += 2
                carry = 1
            } else {
                steps += 1
            }
        }
        
        return steps + carry
    }
}
