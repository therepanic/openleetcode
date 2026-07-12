import heapq


class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        for i in range(len(stones)):
            stones[i] *= -1

        heapq.heapify(stones)

        while len(stones) > 1:
            max_stone1, max_stone2 = heapq.heappop(stones), heapq.heappop(stones)

            if max_stone1 != max_stone2:
                heapq.heappush(stones, max_stone1 - max_stone2)

        return -heapq.heappop(stones) if stones else 0
