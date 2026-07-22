from typing import List


class Solution:
    def findTheCity(
        self, n: int, edges: List[List[int]], distanceThreshold: int
    ) -> int:
        INF = float("inf")
        matrix = [[INF] * n for _ in range(n)]

        for i in range(n):
            matrix[i][i] = 0

        for u, v, w in edges:
            matrix[u][v] = matrix[v][u] = w

        # Floyd-Warshall
        for via in range(n):
            for i in range(n):
                for j in range(n):
                    matrix[i][j] = min(matrix[i][j], matrix[i][via] + matrix[via][j])

        min_reachable = n
        ans = -1

        for i in range(n):
            count = sum(1 for j in range(n) if matrix[i][j] <= distanceThreshold)
            if count <= min_reachable:
                min_reachable = count
                ans = i

        return ans
