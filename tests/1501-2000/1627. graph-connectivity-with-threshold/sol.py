class Solution:
    def areConnected(
        self, n: int, threshold: int, queries: List[List[int]]
    ) -> List[bool]:
        limit = max([n] + [v for pair in queries for v in pair])
        parent = [i for i in range(limit + 1)]
        rank = [1] * (limit + 1)

        def find(n):
            res = n
            while res != parent[res]:
                parent[res] = parent[parent[res]]
                res = parent[res]
            return res

        def union(z, m):
            p1, p2 = find(z), find(m)

            if p1 == p2:
                return False

            if rank[p1] > rank[p2]:
                parent[p2] = p1
                rank[p1] += rank[p2]
            else:
                parent[p1] = p2
                rank[p2] += rank[p1]

            return True

        for z in range(threshold + 1, limit + 1):
            for m in range(2 * z, limit + 1, z):
                union(z, m)

        ans = []
        for x, y in queries:
            ans.append(find(x) == find(y))
        return ans
