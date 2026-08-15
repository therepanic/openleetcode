class Solution:
    def numOfWays(self, nums: List[int]) -> int:
        MOD = 1000000007
        n = len(nums)

        # Precompute Pascal's triangle
        nCr = [[0] * (n + 1) for _ in range(n + 1)]
        for i in range(n + 1):
            nCr[i][0] = nCr[i][i] = 1
            for j in range(1, i):
                nCr[i][j] = (nCr[i - 1][j - 1] + nCr[i - 1][j]) % MOD

        def dfs(nums):
            if len(nums) <= 2:
                return 1

            root = nums[0]
            left = [x for x in nums[1:] if x < root]
            right = [x for x in nums[1:] if x > root]

            left_ways = dfs(left)
            right_ways = dfs(right)
            L, R = len(left), len(right)

            return (nCr[L + R][L] * left_ways % MOD * right_ways) % MOD

        return (dfs(nums) - 1) % MOD
