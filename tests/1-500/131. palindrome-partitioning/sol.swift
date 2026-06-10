class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        var result = [[String]]()
        var path = [String]()
        func isPalindrome(_ leftStart: Int, _ rightStart: Int) -> Bool {
            var left = leftStart
            var right = rightStart
            while left < right { if chars[left] != chars[right] { return false }; left += 1; right -= 1 }
            return true
        }
        func backtrack(_ index: Int) {
            if index == chars.count { result.append(path); return }
            for end in index..<chars.count where isPalindrome(index, end) {
                path.append(String(chars[index...end]))
                backtrack(end + 1)
                path.removeLast()
            }
        }
        backtrack(0)
        return result
    }
}
