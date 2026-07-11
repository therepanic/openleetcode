class Solution:
    def allPathsSourceTarget(self, graph: List[List[int]]) -> List[List[int]]:
        # Queue stores (current_node, path_so_far)
        queue = [(0, [0])]
        target = len(graph) - 1
        result = []

        while queue:
            node, path = queue.pop(0)

            # If target is reached, save the path
            if node == target:
                result.append(path)
                continue

            # Explore neighbors
            for neighbor in graph[node]:
                queue.append((neighbor, path + [neighbor]))

        return result
