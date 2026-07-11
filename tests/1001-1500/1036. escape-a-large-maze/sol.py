from collections import deque


class Solution:
    def isEscapePossible(self, blocked, source, target):
        BLOCKED = set(map(tuple, blocked))
        MAX = len(blocked) * len(blocked)

        def bfs(start, end):
            visited = set()
            queue = deque([tuple(start)])
            visited.add(tuple(start))
            count = 0

            while queue:
                x, y = queue.popleft()
                if [x, y] == end:
                    return True
                if count > MAX:
                    return True

                for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                    nx, ny = x + dx, y + dy
                    if (
                        0 <= nx < 10**6
                        and 0 <= ny < 10**6
                        and (nx, ny) not in visited
                        and (nx, ny) not in BLOCKED
                    ):
                        visited.add((nx, ny))
                        queue.append((nx, ny))
                count += 1

            return False

        return bfs(source, target) and bfs(target, source)
