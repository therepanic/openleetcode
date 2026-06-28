class Solution:
    def swimInWater(self, grid: List[List[int]]) -> int:
        n = len(grid)
        dirs = [(0, -1), (0, 1), (-1, 0), (1, 0)]

        def dfs(x, y, t, vis):
            if x == n - 1 and y == n - 1:
                return True
            vis[x][y] = True
            for dx, dy in dirs:
                nx, ny = x + dx, y + dy
                if (
                    0 <= nx < n
                    and 0 <= ny < n
                    and not vis[nx][ny]
                    and grid[nx][ny] <= t
                ):
                    if dfs(nx, ny, t, vis):
                        return True
            return False

        low, high, ans = 0, n * n - 1, float("inf")
        while low <= high:
            mid = (low + high) // 2
            vis = [[False] * n for _ in range(n)]
            if grid[0][0] <= mid and dfs(0, 0, mid, vis):
                ans = mid
                high = mid - 1
            else:
                low = mid + 1
        return ans
