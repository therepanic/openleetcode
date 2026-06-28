from typing import List


class Solution:
    def isBipartite(self, graph: List[List[int]]) -> bool:
        N: int = len(graph)
        colors: list[int] = [-1] * N
        curr_color: int = 0

        for u in range(0, N):
            if colors[u] == -1:
                is_bipartite: bool = self.check_bipartite(u, curr_color, colors, graph)
                if is_bipartite is False:
                    return False

        return True

    def check_bipartite(
        self, u: int, curr_color: int, colors: list[int], graph: list[int]
    ) -> bool:
        colors[u] = curr_color

        childrens: list[int] = graph[u]

        for v in childrens:
            if colors[v] == -1:
                is_bipartite: bool = self.check_bipartite(
                    v, 1 - curr_color, colors, graph
                )
                if is_bipartite is False:
                    return False
            else:
                if colors[v] == curr_color:
                    return False

        return True
