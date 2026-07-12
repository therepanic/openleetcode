class Solution {
    func diStringMatch(_ s: String) -> [Int] {
        var low = 0, high = s.count
        var result = [Int](repeating: 0, count: s.count + 1)
        let chars = Array(s)
        for i in 0..<chars.count {
            if chars[i] == "I" {
                result[i] = low
                low += 1
            } else {
                result[i] = high
                high -= 1
            }
        }
        result[s.count] = low
        return result
    }
}
