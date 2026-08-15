class BitTrieNode:
    def __init__(self):
        self.count = 0
        self.child = {}


class BitTrie:
    def __init__(self):
        self.root = BitTrieNode()

    def increase(self, number, d):
        cur = self.root
        for i in range(17, -1, -1):
            bit = (number >> i) & 1

            if bit not in cur.child:
                cur.child[bit] = BitTrieNode()

            cur = cur.child[bit]
            cur.count += d

    def findMax(self, number):

        cur, ans = self.root, 0
        for i in range(17, -1, -1):
            bit = (number >> i) & 1

            if (1 - bit) in cur.child and cur.child[1 - bit].count > 0:
                cur = cur.child[1 - bit]
                ans |= 1 << i

            # elif bit in cur.child and cur.child[bit].count > 0:
            #     cur = cur.child[bit]
            else:
                cur = cur.child[bit]

            # else:
            #     return ans

        return ans


class Solution:
    def maxGeneticDifference(
        self, parents: List[int], queries: List[List[int]]
    ) -> List[int]:
        qs = queries

        lookup = defaultdict(list)

        T = BitTrie()

        start = 0

        queries = defaultdict(list)

        for u, v in enumerate(parents):
            lookup[v].append(u)
            if v == -1:
                start = u

        for index, (node, val) in enumerate(qs):
            queries[node].append((index, val))

        ans = [None] * len(qs)

        def dfs(u):
            T.increase(u, 1)

            for index, val in queries[u]:
                ans[index] = T.findMax(val)

            for v in lookup[u]:
                dfs(v)

            T.increase(u, -1)

        dfs(start)

        return ans
