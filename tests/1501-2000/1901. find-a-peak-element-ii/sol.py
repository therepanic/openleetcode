class Solution:
    def findMaxIndex(self, mat, col):
        row = 0

        for i in range(1, len(mat)):
            if mat[i][col] > mat[row][col]:
                row = i

        return row

    def findPeakGrid(self, mat):
        n = len(mat)
        m = len(mat[0])

        low, high = 0, m - 1

        while low <= high:
            mid = low + (high - low) // 2

            max_row = self.findMaxIndex(mat, mid)

            left = mat[max_row][mid - 1] if mid > 0 else -1
            right = mat[max_row][mid + 1] if mid < m - 1 else -1

            if mat[max_row][mid] > left and mat[max_row][mid] > right:
                return [max_row, mid]

            if mat[max_row][mid] < left:
                high = mid - 1
            else:
                low = mid + 1

        return [-1, -1]
