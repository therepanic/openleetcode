class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let chars = Array(s)
        var seen: [String: Int] = [:]
        var ans: [String] = []
        if chars.count < 10 { return ans }
        for i in 0...(chars.count - 10) {
            let sub = String(chars[i..<(i + 10)])
            let count = seen[sub, default: 0]
            if count == 1 { ans.append(sub) }
            seen[sub] = count + 1
        }
        return ans
    }
}
