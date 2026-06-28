class Solution:
    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:
        rows, cols = len(mat), len(mat[0])
        directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        queue = deque()

        for i in range(rows):
            for j in range(cols):
                if mat[i][j] == 0:
                    queue.append((i, j))
                else:
                    mat[i][j] = float("inf")

        while queue:
            row, col = queue.popleft()

            for dr, dc in directions:
                new_row, new_col = row + dr, col + dc

                if (
                    0 <= new_row < rows
                    and 0 <= new_col < cols
                    and mat[new_row][new_col] > mat[row][col] + 1
                ):
                    mat[new_row][new_col] = mat[row][col] + 1
                    queue.append((new_row, new_col))

        return mat
