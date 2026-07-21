from typing import List
from heapq import heappop, heappush


class Solution:
    def maxPerformance(
        self, n: int, speed: List[int], efficiency: List[int], k: int
    ) -> int:

        cur_sum, h = 0, []
        ans = -float("inf")

        for i, j in sorted(zip(efficiency, speed), reverse=True):
            while len(h) > k - 1:
                cur_sum -= heappop(h)
            heappush(h, j)
            cur_sum += j
            ans = max(ans, cur_sum * i)

        return ans % (10**9 + 7)
