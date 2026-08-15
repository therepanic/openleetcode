class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var res = Array(repeating: Character(" "), count: indices.count)
        let chars = Array(s)
        for i in 0..<indices.count {
            res[indices[i]] = chars[i]
        }
        return String(res)
    }
}
