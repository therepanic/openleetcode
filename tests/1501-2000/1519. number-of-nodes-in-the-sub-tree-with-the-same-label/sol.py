from typing import List


class Solution:
    def countSubTrees(self, n: int, edges: List[List[int]], labels: str) -> List[int]:
        matrix = [[] for _ in range(n)]

        for u, v in edges:
            matrix[u].append(v)
            matrix[v].append(u)

        parent = [-1] * n
        order = [0]
        for node in order:
            for child in matrix[node]:
                if child != parent[node]:
                    parent[child] = node
                    order.append(child)

        counts = [[0] * 26 for _ in range(n)]
        ans = [0] * n
        for node in reversed(order):
            label = ord(labels[node]) - 97
            counts[node][label] += 1
            ans[node] = counts[node][label]
            if parent[node] != -1:
                for i in range(26):
                    counts[parent[node]][i] += counts[node][i]
        return ans
