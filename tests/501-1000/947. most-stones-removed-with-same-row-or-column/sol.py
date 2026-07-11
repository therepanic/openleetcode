from typing import List


class Solution:
    def removeStones(self, stones: List[List[int]]) -> int:
        def dfs(idx):
            visited.add(idx)
            for nei in matrix.get(idx, []):
                if nei not in visited:
                    dfs(nei)

        n = len(stones)
        matrix = {i: [] for i in range(n)}

        for i in range(n):
            for j in range(i + 1, n):
                if stones[i][0] == stones[j][0] or stones[i][1] == stones[j][1]:
                    matrix[i].append(j)
                    matrix[j].append(i)

        visited = set()
        components = 0
        for i, stone in enumerate(stones):
            if i not in visited:
                components += 1
                dfs(i)

        return n - components
