from typing import List
from collections import defaultdict


class Solution:
    def criticalConnections(
        self, n: int, connections: List[List[int]]
    ) -> List[List[int]]:
        """
        Tarjan's algorithm interpreted via Sparse Linear Algebra:

        - disc[v] = Column pivot order in symbolic forward elimination.
        - low[v]  = A scalar Schur complement proxy tracking fill reach
                    into ancestor pivots.
        - Bridge  = An interface with rank-1 coupling and zero off-diagonal
                    Schur block fill from back-edges.
        """
        # --- Construct structural topology (Adjacency Matrix Pattern) ---
        graph = defaultdict(list)
        for u, v in connections:
            graph[u].append(v)
            graph[v].append(u)

        disc = [-1] * n  # Pivot order (Gaussian elimination column index)
        low = [0] * n  # Scalar Schur complement proxy reach
        timer = [0]
        bridges = []

        for start in range(n):
            if disc[start] != -1:
                continue

            # --- Iterative DFS = Symbolic Forward Elimination Analysis ---
            stack = [(start, -1, iter(graph[start]))]
            disc[start] = low[start] = timer[0]
            timer[0] += 1

            while stack:
                node, parent, nbrs = stack[-1]
                try:
                    nb = next(nbrs)
                    if nb == parent:
                        # Skip: would re-introduce eliminated pivot
                        continue

                    if disc[nb] == -1:
                        # Tree edge: extend elimination front
                        disc[nb] = low[nb] = timer[0]
                        timer[0] += 1
                        stack.append((nb, node, iter(graph[nb])))
                    else:
                        # Back edge: off-diagonal loop entry captured
                        # by Stefan Vandewalle's interface operator framing.
                        # Update scalar Schur reach mapping.
                        low[node] = min(low[node], disc[nb])

                except StopIteration:
                    stack.pop()
                    if stack:
                        par = stack[-1][0]

                        # --- Subdomain Schur Condensation ---
                        # Condense variables of subdomain(node) onto interface par.
                        # Propagate the monotonic low-link reach upward.
                        low[par] = min(low[par], low[node])

                        if low[node] > disc[par]:
                            # The condensed operator has zero off-diagonal
                            # coupling block above par's pivot.
                            bridges.append([par, node])

        return bridges
