class UnionFind:
    def __init__(self, n: int):
        self.parent = list(range(n))
        self.rank = [0] * n

    def find(self, u: int) -> int:
        if self.parent[u] != u:
            self.parent[u] = self.find(self.parent[u])
        return self.parent[u]

    def union(self, u: int, v: int) -> bool:
        pu, pv = self.find(u), self.find(v)
        if pu == pv:
            return False
        if self.rank[pu] < self.rank[pv]:
            self.parent[pu] = pv
        elif self.rank[pv] < self.rank[pu]:
            self.parent[pv] = pu
        else:
            self.parent[pu] = pv
            self.rank[pv] += 1
        return True


class Solution:
    def findRedundantDirectedConnection(self, edges: List[List[int]]) -> List[int]:
        uf = UnionFind(len(edges) + 1)
        parent = [0] * (len(edges) + 1)
        candidate1 = candidate2 = None

        for u, v in edges:
            if parent[v]:
                candidate1 = [parent[v], v]
                candidate2 = [u, v]
                break
            parent[v] = u

        for u, v in edges:
            if [u, v] == candidate2:
                continue
            if not uf.union(u, v):
                return candidate1 if candidate1 else [u, v]

        return candidate2
