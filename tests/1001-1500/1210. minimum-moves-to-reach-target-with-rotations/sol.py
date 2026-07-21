from collections import deque
from typing import List


class Solution:
    def minimumMoves(self, grid: List[List[int]]) -> int:
        n = len(grid)
        # State: (r, c, orientation) where 0 is horizontal, 1 is vertical
        # Start: (0, 0, 0) -> Target: (n-1, n-2, 0)
        start = (0, 0, 0)
        target = (n - 1, n - 2, 0)

        queue = deque([(start, 0)])
        # Use a 3D Tensor/Matrix for the Visited Field (The 'Redacted' Space)
        visited = {start}

        while queue:
            (r, c, o), dist = queue.popleft()

            if (r, c, o) == target:
                return dist

            # 1. Translation: Move Right/Down
            if o == 0:  # Horizontal
                # Move Right
                if c + 2 < n and grid[r][c + 2] == 0:
                    if (r, c + 1, 0) not in visited:
                        visited.add((r, c + 1, 0))
                        queue.append(((r, c + 1, 0), dist + 1))
                # Move Down
                if r + 1 < n and grid[r + 1][c] == 0 and grid[r + 1][c + 1] == 0:
                    if (r + 1, c, 0) not in visited:
                        visited.add((r + 1, c, 0))
                        queue.append(((r + 1, c, 0), dist + 1))
            else:  # Vertical
                # Move Right
                if c + 1 < n and grid[r][c + 1] == 0 and grid[r + 1][c + 1] == 0:
                    if (r, c + 1, 1) not in visited:
                        visited.add((r, c + 1, 1))
                        queue.append(((r, c + 1, 1), dist + 1))
                # Move Down
                if r + 2 < n and grid[r + 2][c] == 0:
                    if (r + 1, c, 1) not in visited:
                        visited.add((r + 1, c, 1))
                        queue.append(((r + 1, c, 1), dist + 1))

            # 2. Rotation: Rigid Body Transformation
            # Only possible if the 2x2 'Local Neighborhood' is clear
            if (
                r + 1 < n
                and c + 1 < n
                and grid[r + 1][c] == 0
                and grid[r][c + 1] == 0
                and grid[r + 1][c + 1] == 0
            ):
                new_o = 1 - o
                if (r, c, new_o) not in visited:
                    visited.add((r, c, new_o))
                    queue.append(((r, c, new_o), dist + 1))

        return -1  # Boundary reached with no valid path
