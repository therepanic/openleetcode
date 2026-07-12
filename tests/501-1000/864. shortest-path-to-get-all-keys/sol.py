class Solution:
    def shortestPathAllKeys(self, grid: List[str]) -> int:
        m, n = len(grid), len(grid[0])
        start_i, start_j = 0, 0
        total_keys = 0

        for i in range(m):
            for j in range(n):
                if grid[i][j] == "@":
                    start_i = i
                    start_j = j
                if "a" <= grid[i][j] <= "f":
                    total_keys += 1

        target_mask = (1 << total_keys) - 1
        queue = deque([(start_i, start_j, 0)])  # (i, j, mask)
        seen = set((start_i, start_j, 0))
        moves = 0
        dir = [(0, 1), (0, -1), (1, 0), (-1, 0)]

        while queue:
            for _ in range(len(queue)):
                r, c, mask = queue.popleft()

                if mask == target_mask:
                    return moves
                for dx, dy in dir:
                    nr, nc = r + dx, c + dy
                    if not ((0 <= nr < m) and (0 <= nc < n)):
                        continue
                    next_val = grid[nr][nc]
                    next_mask = mask

                    if "a" <= next_val <= "f":
                        key_bit = ord(next_val) - ord("a")
                        next_mask |= 1 << key_bit

                    if "A" <= next_val <= "F":
                        lock_bit = ord(next_val.lower()) - ord("a")
                        if not (next_mask & (1 << lock_bit)):
                            continue
                    if (nr, nc, next_mask) not in seen and next_val != "#":
                        queue.append((nr, nc, next_mask))
                        seen.add((nr, nc, next_mask))

            moves += 1
        return -1
