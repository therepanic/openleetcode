from typing import List


class Solution:
    def maxStudents(self, seats: List[List[str]]) -> int:
        m, n = len(seats), len(seats[0])
        available = []
        for row in seats:
            mask = 0
            for col, seat in enumerate(row):
                if seat == ".":
                    mask |= 1 << col
            available.append(mask)

        valid_masks = [mask for mask in range(1 << n) if not (mask & (mask << 1))]
        dp = {0: 0}
        for row in range(m):
            next_dp = {}
            for current in valid_masks:
                if current & ~available[row]:
                    continue
                count = current.bit_count()
                for previous, total in dp.items():
                    if current & ((previous << 1) | (previous >> 1)):
                        continue
                    next_dp[current] = max(next_dp.get(current, 0), total + count)
            dp = next_dp

        return max(dp.values(), default=0)
