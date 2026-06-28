class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var left = 0
        var right = Int(Double(c).squareRoot())
        while left <= right {
            let currentSum = left * left + right * right
            if currentSum == c {
                return true
            } else if currentSum < c {
                left += 1
            } else {
                right -= 1
            }
        }
        return false
    }
}
