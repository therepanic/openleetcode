import collections


class Solution:
    def crackSafe(self, n: int, k: int) -> str:
        if n == 1:
            return "".join(map(str, range(k)))

        # 1. Coordinate Mapping
        # Total nodes (prefixes) = k^(n-1)
        # Total edges (passwords) = k^n

        # We use a simulated sparse matrix (adjacency list)
        # To ensure lexical order, we sort digits 0 to k-1
        adj = collections.defaultdict(lambda: list(range(k)))

        # 2. Starting Point (Prefix of all zeros)
        start_node = "0" * (n - 1)
        res = []

        # 3. The "Draining" Walk (Hierholzer's)
        def visit(node):
            while adj[node]:
                # Pop the next available 'edge' (digit)
                digit = adj[node].pop()
                next_node = (node + str(digit))[1:]
                visit(next_node)
                # After exploring the edge, add the digit to the result
                res.append(str(digit))

        visit(start_node)

        # The result is the start prefix + the drained edges
        return "".join(res) + start_node
