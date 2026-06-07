class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        let cols = matrix[0].count
        var left = 0
        var right = rows * cols - 1

        while left <= right {
            let mid = left + (right - left) / 2
            let value = matrix[mid / cols][mid % cols]
            if value == target {
                return true
            }
            if value < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }
}
