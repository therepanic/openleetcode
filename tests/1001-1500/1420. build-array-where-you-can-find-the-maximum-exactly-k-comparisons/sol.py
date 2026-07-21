class Solution:
    def numOfArrays(self, n: int, m: int, k: int) -> int:
        MOD = 10**9 + 7
        # 3D DP table: dp[idx][search_cost][max_value]
        dp = [[[-1 for _ in range(m + 1)] for _ in range(k + 1)] for _ in range(n + 1)]

        def solve(idx, search_cost, max_value):
            # Base Case: Array is full
            if idx == n:
                return 1 if search_cost == k else 0

            # Optimization: If cost already exceeds k, stop
            if search_cost > k:
                return 0

            # Return cached result if available
            if dp[idx][search_cost][max_value] != -1:
                return dp[idx][search_cost][max_value]

            result = 0
            # Try every number from 1 to m for the current position
            for i in range(1, m + 1):
                if i > max_value:
                    # New maximum found: increment search_cost and update max_value
                    result = (result + solve(idx + 1, search_cost + 1, i)) % MOD
                else:
                    # Not a new maximum: search_cost and max_value stay the same
                    result = (result + solve(idx + 1, search_cost, max_value)) % MOD

            dp[idx][search_cost][max_value] = result
            return result

        return solve(0, 0, 0)
