class Solution:
    def findSmallestSetOfVertices(self, n, edges):
        has_incoming = [False] * n
        for _, destination in edges:
            has_incoming[destination] = True
        return [i for i in range(n) if not has_incoming[i]]
