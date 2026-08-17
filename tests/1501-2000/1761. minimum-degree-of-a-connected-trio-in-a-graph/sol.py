import numpy as np


class Solution:
    def minTrioDegree(self, n: int, edges: List[List[int]]) -> int:
        # 1. Memory-Efficient Adjacency Matrix
        # uint8 is used to keep the footprint small for the N x N matrix
        adj = np.zeros((n + 1, n + 1), dtype=np.uint8)
        degrees = np.zeros(n + 1, dtype=int)

        for u, v in edges:
            adj[u, v] = adj[v, u] = 1
            degrees[u] += 1
            degrees[v] += 1

        min_degree = float("inf")

        # 2. Vectorized Trio Search
        # We iterate over edges to ensure we only check nodes that are connected
        for u, v in edges:
            # Create a boolean mask of common neighbors 'w'
            # A common neighbor exists where both adj[u] and adj[v] have a 1
            common_mask = (adj[u] & adj[v]) == 1

            # If any common neighbors exist, calculate degrees in a vectorized batch
            if np.any(common_mask):
                # Pull all degrees of 'w' nodes without a Python loop
                w_degrees = degrees[common_mask]

                # Formula: (deg(u)-2) + (deg(v)-2) + (deg(w)-2)
                # Simplified: deg(u) + deg(v) + deg(w) - 6
                trio_degrees = (degrees[u] + degrees[v] + w_degrees) - 6

                # Update the global minimum using NumPy's optimized min()
                current_min = np.min(trio_degrees)
                if current_min < min_degree:
                    min_degree = current_min

        return int(min_degree) if min_degree != float("inf") else -1
