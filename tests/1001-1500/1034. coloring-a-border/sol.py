from collections import deque


class Solution(object):
    def colorBorder(self, grid, row, col, color):
        rows, cols = len(grid), len(grid[0])
        start_color = grid[row][col]

        # If the target color is the same as the start, no work needed
        if start_color == color:
            return grid

        queue = deque([(row, col)])
        visited = {(row, col)}
        borders = []

        while queue:
            r, c = queue.popleft()
            is_border = False

            # Check the 4-direction neighbors: Up, Down, Left, Right
            for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                nr, nc = r + dr, c + dc

                # Condition 1: If it hits the edge of the grid, it's a border cell
                if not (0 <= nr < rows and 0 <= nc < cols):
                    is_border = True
                # Condition 2: If the neighbor has a different color, it's a border cell
                elif grid[nr][nc] != start_color:
                    is_border = True
                # Otherwise, it's the same color; if not visited, keep exploring
                elif (nr, nc) not in visited:
                    visited.add((nr, nc))
                    queue.append((nr, nc))

            # If any neighbor triggered a border condition, save this cell
            if is_border:
                borders.append((r, c))

        # Final Step: Flip the colors for the identified border cells
        for r, c in borders:
            grid[r][c] = color

        return grid
