class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        if num < 2 {
            return true
        }

        var left = 2
        var right = num / 2
        while left <= right {
            let mid = left + (right - left) / 2
            let squared = mid * mid
            if squared == num {
                return true
            } else if squared < num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }
}
