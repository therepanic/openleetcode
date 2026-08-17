class Solution:
    def minSpaceWastedKResizing(self, nums: List[int], k: int) -> int:
        n = len(nums)
        # 1. Prefix Sums for O(1) Integral calculation
        P = [0] * (n + 1)
        for i in range(n):
            P[i + 1] = P[i] + nums[i]

        # 2. Memory-Efficient DP: Only store the previous k-state
        # Base Case: k=0 (No resizes, one constant size for the whole array)
        dp = [float("inf")] * (n + 1)
        max_v = 0
        for i in range(1, n + 1):
            max_v = max(max_v, nums[i - 1])
            dp[i] = max_v * i - P[i]

        # 3. Successive Approximation for k = 1 to k
        for _ in range(k):
            new_dp = [float("inf")] * (n + 1)
            new_dp[0] = 0
            for i in range(1, n + 1):
                cur_max = 0
                # Searching for the optimal 'Heaviside Jump' point
                for j in range(i - 1, -1, -1):
                    cur_max = max(cur_max, nums[j])
                    waste = cur_max * (i - j) - (P[i] - P[j])
                    new_dp[i] = min(new_dp[i], dp[j] + waste)
            dp = new_dp

        return dp[n]
