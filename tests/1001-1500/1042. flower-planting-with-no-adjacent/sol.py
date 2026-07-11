class Solution:
    def gardenNoAdj(self, n: int, paths: List[List[int]]) -> List[int]:
        graph = {}

        for u, v in paths:
            if u not in graph:
                graph[u] = []
            if v not in graph:
                graph[v] = []

            graph[u].append(v)
            graph[v].append(u)

        for node in range(1, n + 1):
            if node not in graph:
                graph[node] = []

        answer = [0] * (n + 1)

        for i in range(1, n + 1):
            used = set(answer[nei] for nei in graph[i])

            for flower in range(1, 5):
                if flower not in used:
                    answer[i] = flower
                    break

        return answer[1:]
