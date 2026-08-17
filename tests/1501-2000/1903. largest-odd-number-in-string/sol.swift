class Solution {
    func largestOddNumber(_ num: String) -> String {
        let chars = Array(num)
        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            if Int(String(chars[i]))! % 2 == 1 {
                return String(chars[0...i])
            }
        }
        return ""
    }
}
