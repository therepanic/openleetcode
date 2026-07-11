class Solution:
    def possibleBipartition(self, n: int, dislikes: List[List[int]]) -> bool:
        # Step 1: Build the graph
        graph = {}
        for u, v in dislikes:
            if u not in graph:
                graph[u] = []
            if v not in graph:
                graph[v] = []
            graph[u].append(v)
            graph[v].append(u)

        # color[i] = 0 (unvisited), 1 (Group A), -1 (Group B)
        color = [0] * (n + 1)

        # Step 2: Iterate through all nodes (to handle disconnected components)
        for node in range(1, n + 1):
            if color[node] != 0 or node not in graph:
                continue

            # Start BFS
            queue = [node]
            color[node] = 1  # Start coloring with 1

            while queue:
                curr = queue.pop(0)

                for neighbor in graph[curr]:
                    # If neighbor has the same color, bipartition is impossible
                    if color[neighbor] == color[curr]:
                        return False

                    # If neighbor is not colored, give it the opposite color
                    if color[neighbor] == 0:
                        color[neighbor] = -color[curr]
                        queue.append(neighbor)

        return True
