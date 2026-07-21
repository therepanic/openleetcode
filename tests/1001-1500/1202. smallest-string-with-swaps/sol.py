from collections import defaultdict


class UnionFind:
    def __init__(self, n):
        self.parents = list(range(n))

    def find(self, x):
        if x != self.parents[x]:
            self.parents[x] = self.find(self.parents[x])
        return self.parents[x]

    def union(self, x, y):
        x, y = self.find(x), self.find(y)
        if x != y:
            self.parents[x] = y
            return True
        return False


class Solution:
    def smallestStringWithSwaps(self, s: str, pairs: list[list[int]]) -> str:
        n = len(s)
        uf = UnionFind(n)
        groups = defaultdict(list)

        for i, j in pairs:
            uf.union(i, j)

        res = [""] * n
        for i in range(n):
            groups[uf.find(i)].append(i)

        for indices in groups.values():
            chars = [s[i] for i in indices]
            indices.sort()
            chars.sort()
            for k, ch in zip(indices, chars):
                res[k] = ch

        return "".join(res)
