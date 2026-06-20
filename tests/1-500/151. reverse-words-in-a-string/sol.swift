class Solution {
    func reverseWords(_ s: String) -> String {
        return s.split(whereSeparator: { $0 == " " || $0 == "\n" || $0 == "\t" })
            .reversed()
            .map(String.init)
            .joined(separator: " ")
    }
}
