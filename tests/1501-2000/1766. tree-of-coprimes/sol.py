class Solution:
    def getCoprimes(self, nums: List[int], edges: List[List[int]]) -> List[int]:
        n = len(nums)

        adj = [[] for i in range(n)]
        for u, v in edges:
            adj[u].append(v)
            adj[v].append(u)

        ans = [-1 for i in range(n)]
        depth = [0 for i in range(n)]
        ancestorByValue = [-1 for _ in range(51)]

        def dfs(node, prev, dep):
            depth[node] = dep

            t = float("inf")
            for i in range(1, 51):
                if math.gcd(i, nums[node]) == 1:
                    if ancestorByValue[i] != -1:
                        diff = depth[node] - depth[ancestorByValue[i]]
                        if diff < t:
                            ans[node] = ancestorByValue[i]
                            t = diff

            prev_state = ancestorByValue[nums[node]]
            ancestorByValue[nums[node]] = node

            for v in adj[node]:
                if v != prev:
                    dfs(v, node, dep + 1)

            ancestorByValue[nums[node]] = prev_state

        dfs(0, 0, 0)
        return ans
