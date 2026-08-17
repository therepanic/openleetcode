from math import ceil
import heapq
from typing import List


class Solution:
    def minStoneSum(self, piles: List[int], k: int) -> int:

        piles = [-p for p in piles]
        heapq.heapify(piles)

        for _ in range(k):
            x = -heapq.heappop(piles)
            reduced = ceil(x / 2)
            heapq.heappush(piles, -reduced)

        return -sum(piles)
