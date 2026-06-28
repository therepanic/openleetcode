class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        var digits = Array(String(n))
        let length = digits.count
        var pivot = -1

        for i in stride(from: length - 2, through: 0, by: -1) {
            if digits[i] < digits[i + 1] {
                pivot = i
                break
            }
        }

        if pivot == -1 {
            return -1
        }

        for i in stride(from: length - 1, through: pivot + 1, by: -1) {
            if digits[i] > digits[pivot] {
                digits.swapAt(i, pivot)
                break
            }
        }

        var left = pivot + 1
        var right = length - 1
        while left < right {
            digits.swapAt(left, right)
            left += 1
            right -= 1
        }

        if let result = Int(String(digits)), result <= Int32.max {
            return result
        }
        return -1
    }
}
