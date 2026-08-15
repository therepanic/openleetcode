class Solution:
    def validCell(self, r, c, n, m):
        if r < 0 or c < 0 or r >= n or c >= m:
            return False
        return True

    def validEdgeCell(self, r, c, n, m):
        if r == 0 or c == 0 or r == n - 1 or c == m - 1:
            return True
        return False

    def __init__(self):
        self.directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    def nearestExit(self, maze: List[List[str]], entrance: List[int]) -> int:
        n = len(maze)
        m = len(maze[0])

        visited = [[False for _ in range(m)] for _ in range(n)]

        que = deque()
        que.append((entrance[0], entrance[1], 0))

        visited[entrance[0]][entrance[1]] = True

        while que:
            r, c, dist = que.popleft()

            for row, col in self.directions:
                nRow = row + r
                nCol = col + c

                if (
                    self.validCell(nRow, nCol, n, m)
                    and not visited[nRow][nCol]
                    and maze[nRow][nCol] == "."
                ):
                    visited[nRow][nCol] = True

                    if self.validEdgeCell(nRow, nCol, n, m):
                        return dist + 1

                    que.append((nRow, nCol, dist + 1))

        return -1
