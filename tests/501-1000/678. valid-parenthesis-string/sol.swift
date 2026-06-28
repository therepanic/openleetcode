class Solution {
    func checkValidString(_ s: String) -> Bool {
        var low = 0
        var high = 0
        for char in s {
            if char == "(" {
                low += 1
                high += 1
            } else if char == ")" {
                low = max(low - 1, 0)
                high -= 1
            } else {
                low = max(low - 1, 0)
                high += 1
            }
            if high < 0 {
                return false
            }
        }
        return low == 0
    }
}
