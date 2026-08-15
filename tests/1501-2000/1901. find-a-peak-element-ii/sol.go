func findPeakGrid(mat [][]int) []int {
    n := len(mat)
    m := len(mat[0])

    low, high := 0, m-1

    for low <= high {
        mid := low + (high-low)/2

        maxRow := 0
        for i := 1; i < n; i++ {
            if mat[i][mid] > mat[maxRow][mid] {
                maxRow = i
            }
        }

        left := -1
        if mid > 0 {
            left = mat[maxRow][mid-1]
        }
        right := -1
        if mid < m-1 {
            right = mat[maxRow][mid+1]
        }

        if mat[maxRow][mid] > left && mat[maxRow][mid] > right {
            return []int{maxRow, mid}
        }

        if mat[maxRow][mid] < left {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return []int{-1, -1}
}
