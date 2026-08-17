class Solution:
    def canMouseWin(self, grid: List[str], catJump: int, mouseJump: int) -> bool:
        m, n = len(grid), len(grid[0])  # dimensions
        walls = set()
        for i in range(m):
            for j in range(n):
                if grid[i][j] == "F":
                    food = (i, j)
                elif grid[i][j] == "C":
                    cat = (i, j)
                elif grid[i][j] == "M":
                    mouse = (i, j)
                elif grid[i][j] == "#":
                    walls.add((i, j))

        @lru_cache(None)
        def fn(cat, mouse, turn):
            """Return True if mouse wins."""
            if cat == food or cat == mouse or turn >= m * n * 2:
                return False
            if mouse == food:
                return True  # mouse reaching food

            if not turn & 1:  # mouse moving
                x, y = mouse
                for dx, dy in (-1, 0), (0, 1), (1, 0), (0, -1):
                    for jump in range(0, mouseJump + 1):
                        xx, yy = x + jump * dx, y + jump * dy
                        if not (0 <= xx < m and 0 <= yy < n) or (xx, yy) in walls:
                            break
                        if fn(cat, (xx, yy), turn + 1):
                            return True
                return False
            else:  # cat moving
                x, y = cat
                for dx, dy in (-1, 0), (0, 1), (1, 0), (0, -1):
                    for jump in range(0, catJump + 1):
                        xx, yy = x + jump * dx, y + jump * dy
                        if not (0 <= xx < m and 0 <= yy < n) or (xx, yy) in walls:
                            break
                        if not fn((xx, yy), mouse, turn + 1):
                            return False
                return True

        return fn(cat, mouse, 0)
