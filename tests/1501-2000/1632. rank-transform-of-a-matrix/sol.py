from typing import List


class Solution:
    def matrixRankTransform(self, matrix: List[List[int]]) -> List[List[int]]:
        m, n = len(matrix), len(matrix[0])  # dimension
        # mapping from value to index
        mp = {}
        for i in range(m):
            for j in range(n):
                mp.setdefault(matrix[i][j], []).append((i, j))

        def find(p):
            """Find root of p."""
            if p != parent[p]:
                parent[p] = find(parent[p])
            return parent[p]

        rank = [0] * (m + n)
        ans = [[0] * n for _ in range(m)]

        for k in sorted(mp):  # from minimum to maximum
            parent = list(range(m + n))
            for i, j in mp[k]:
                ii, jj = find(i), find(m + j)  # find
                parent[ii] = jj  # union
                rank[jj] = max(rank[ii], rank[jj])  # max rank

            seen = set()
            for i, j in mp[k]:
                ii = find(i)
                if ii not in seen:
                    rank[ii] += 1
                seen.add(ii)
                rank[i] = rank[m + j] = ans[i][j] = rank[ii]
        return ans
