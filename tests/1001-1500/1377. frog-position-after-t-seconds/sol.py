import collections
from typing import List


class Solution:
    def frogPosition(
        self, n: int, edges: List[List[int]], t: int, target: int
    ) -> float:
        neighbors = collections.defaultdict(set)
        for a, b in edges:
            neighbors[a].add(b)
            neighbors[b].add(a)

        visited = set()
        probability = 0.0

        def dfs(vertex: int, chance: float, elapsed: int) -> None:
            nonlocal probability
            if elapsed == t:
                if vertex == target:
                    probability = chance
                return
            visited.add(vertex)
            choices = neighbors[vertex] - visited
            for child in choices or [vertex]:
                dfs(child, chance / (len(choices) or 1), elapsed + 1)

        dfs(1, 1.0, 0)
        return probability
