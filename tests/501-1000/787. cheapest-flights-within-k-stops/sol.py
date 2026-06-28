from collections import deque
from typing import List


class Solution:
    def findCheapestPrice(
        self, n: int, flights: List[List[int]], src: int, dst: int, k: int
    ) -> int:
        matrix = {i: [] for i in range(n)}
        for u, v, w in flights:
            matrix[u].append((v, w))

        distance = [float("inf")] * n
        distance[src] = 0

        queue = deque([(src, 0)])
        steps = 0
        while queue:
            level = len(queue)
            if steps == (k + 1):
                break
            steps += 1

            for _ in range(level):
                node, dist = queue.popleft()

                for v, w in matrix.get(node, []):
                    if (w + dist) < distance[v]:
                        distance[v] = w + dist
                        queue.append((v, dist + w))

        return distance[dst] if distance[dst] != float("inf") else -1
