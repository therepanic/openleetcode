class Solution {
    func findPeakGrid(_ mat: [[Int]]) -> [Int] {
        let n = mat.count
        let m = mat[0].count

        var low = 0
        var high = m - 1

        while low <= high {
            let mid = low + (high - low) / 2

            var maxRow = 0
            for i in 1..<n {
                if mat[i][mid] > mat[maxRow][mid] {
                    maxRow = i
                }
            }

            let left = mid > 0 ? mat[maxRow][mid - 1] : -1
            let right = mid < m - 1 ? mat[maxRow][mid + 1] : -1

            if mat[maxRow][mid] > left && mat[maxRow][mid] > right {
                return [maxRow, mid]
            }

            if mat[maxRow][mid] < left {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return [-1, -1]
    }
}
