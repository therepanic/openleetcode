class Solution:
    def maxDistance(self, grid: List[List[int]]) -> int:
        if not grid or not grid[0]:
            return -1

        n = len(grid)
        frontier = []

        # 1. Initial State Formulation (Identify the source components)
        for r in range(n):
            for c in range(n):
                if grid[r][c] == 1:
                    frontier.append((r, c))

        # Edge Cases: If the grid is completely land or completely water, dilation cannot occur
        if len(frontier) == 0 or len(frontier) == n * n:
            return -1

        # 2. Successive Dilation Phase (Fixed-Point Propagation)
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        distance = -1

        while frontier:
            next_frontier = []
            # Increment distance with each progressive expansion wave
            distance += 1

            for r, c in frontier:
                for dr, dc in directions:
                    nr, nc = r + dr, c + dc

                    # If the structuring element hits water, the land component expands
                    if 0 <= nr < n and 0 <= nc < n and grid[nr][nc] == 0:
                        grid[nr][nc] = 1  # Water cell transitions to land
                        next_frontier.append((nr, nc))

            frontier = next_frontier

        return distance
