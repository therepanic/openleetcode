class Solution:
    def unhappyFriends(
        self, n: int, preferences: List[List[int]], pairs: List[List[int]]
    ) -> int:
        # x: u, y
        # u: x, v

        # x is unhappy when x's upper candidates were paired somebody less preferable than him.
        # Check happiness one by one.

        graph = dict()
        for u, v in pairs:
            graph[u] = v
            graph[v] = u

        rank = [[0 for _ in range(n)] for _ in range(n)]
        for i in range(len(preferences)):
            for j, e in enumerate(preferences[i]):
                rank[i][e] = j

        def check(u):
            v = graph[u]

            lst = []
            for a in preferences[u]:
                if a == v:
                    break
                av = graph[a]
                if rank[a][u] < rank[a][av]:
                    return True

            return False

        ans = 0
        for i in range(n):
            if check(i):
                ans += 1

        return ans
