class DSU:
    def __init__(self, n):
        self.parent = list(range(n))
        self.size = [1] * n

    def find(self, node):
        if self.parent[node] != node:
            self.parent[node] = self.find(self.parent[node])
        return self.parent[node]

    def union(self, u, v):
        pu = self.find(u)
        pv = self.find(v)

        if pu == pv:
            return

        if self.size[pu] < self.size[pv]:
            self.parent[pu] = pv
            self.size[pv] += self.size[pu]
        else:
            self.parent[pv] = pu
            self.size[pu] += self.size[pv]


class Solution:
    def makeConnected(self, n: int, connections: List[List[int]]) -> int:

        if len(connections) < n - 1:
            return -1

        ds = DSU(n)
        extra = 0

        for u, v in connections:
            if ds.find(u) == ds.find(v):
                extra += 1
            else:
                ds.union(u, v)

        components = sum(1 for i in range(n) if ds.find(i) == i)

        return components - 1 if extra >= components - 1 else -1
