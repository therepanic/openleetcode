class Solution:
    def eventualSafeNodes(self, graph):
        n = len(graph)
        state = [0] * n  # 0: unvisited, 1: visiting, 2: safe
        safe = []

        def dfs(node):
            if state[node] > 0:
                return state[node] == 2  # Return true if already safe

            state[node] = 1  # Mark as visiting

            for neighbor in graph[node]:
                if state[neighbor] == 1 or not dfs(neighbor):
                    return False  # Cycle detected

            state[node] = 2  # Mark as safe
            return True

        for i in range(n):
            if dfs(i):
                safe.append(i)

        return safe
