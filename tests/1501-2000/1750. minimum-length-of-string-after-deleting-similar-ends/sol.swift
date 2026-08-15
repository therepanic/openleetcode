class Solution {
    func minimumLength(_ s: String) -> Int {
        var left = 0
        var right = s.count - 1
        let chars = Array(s)
        while left < right && chars[left] == chars[right] {
            let ch = chars[left]
            while left <= right && chars[left] == ch {
                left += 1
            }
            while left <= right && chars[right] == ch {
                right -= 1
            }
        }
        return max(0, right - left + 1)
    }
}
