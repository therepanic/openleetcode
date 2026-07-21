from collections import deque


class Solution:
    def minPushBox(self, grid):
        for i, row in enumerate(grid):
            for j, cell in enumerate(row):
                if cell == "S":
                    player = (i, j)
                elif cell == "B":
                    box = (i, j)
                elif cell == "T":
                    target = (i, j)

        q = deque([(box, player, 0)])
        seen = {(box, player)}
        directions = ((1, 0), (-1, 0), (0, 1), (0, -1))
        rows, cols = len(grid), len(grid[0])

        while q:
            box, player, pushes = q.popleft()
            if box == target:
                return pushes

            reachable = {player}
            walk = deque([player])
            while walk:
                x, y = walk.popleft()
                for dx, dy in directions:
                    nx, ny = x + dx, y + dy
                    if (
                        0 <= nx < rows
                        and 0 <= ny < cols
                        and (nx, ny) != box
                        and grid[nx][ny] != "#"
                        and (nx, ny) not in reachable
                    ):
                        reachable.add((nx, ny))
                        walk.append((nx, ny))

            for dx, dy in directions:
                next_box = (box[0] + dx, box[1] + dy)
                behind = (box[0] - dx, box[1] - dy)
                if (
                    0 <= next_box[0] < rows
                    and 0 <= next_box[1] < cols
                    and grid[next_box[0]][next_box[1]] != "#"
                    and behind in reachable
                    and (next_box, box) not in seen
                ):
                    seen.add((next_box, box))
                    q.append((next_box, box, pushes + 1))
        return -1
