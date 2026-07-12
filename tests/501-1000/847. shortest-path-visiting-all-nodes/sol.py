from collections import deque


class Solution:
    def shortestPathLength(self, graph: List[List[int]]) -> int:
        """
        Shortest path visiting all nodes in a connected undirected graph.

        Approach:
        • BFS over states (node, visited_mask).
        • visited_mask is a bitmask of visited vertices.
        • Multi-source BFS allows starting from any node.
        """

        n = len(graph)
        if n == 1:
            return 0

        FULL = (1 << n) - 1  # mask with all nodes visited
        visited = [[False] * (1 << n) for _ in range(n)]
        q = deque()

        # Initialize BFS from every node
        for i in range(n):
            mask = 1 << i
            q.append((i, mask, 0))
            visited[i][mask] = True

        while q:
            node, mask, dist = q.popleft()

            # All nodes visited → shortest distance found
            if mask == FULL:
                return dist

            for nei in graph[node]:
                new_mask = mask | (1 << nei)

                # Avoid revisiting identical states
                if not visited[nei][new_mask]:
                    visited[nei][new_mask] = True
                    q.append((nei, new_mask, dist + 1))

        return -1  # unreachable for connected graph
