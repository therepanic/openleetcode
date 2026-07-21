class Solution:
    def numRollsToTarget(self, n: int, k: int, target: int) -> int:
        MOD = 10**9 + 7

        # dp[s] = number of ways to get sum 's'
        dp = [0] * (target + 1)
        dp[0] = 1  # One way to get sum 0 with 0 dice

        # We 'construct' the solution dimension by dimension (CBC style)
        for _ in range(n):
            new_dp = [0] * (target + 1)
            window_sum = 0

            # This is the 'Fast' part: instead of a k-loop, we use
            # the property of the lattice's periodicity (the die faces)
            for s in range(1, target + 1):
                # Add the 'newest' possible face value contribution
                window_sum = (window_sum + dp[s - 1]) % MOD

                # Subtract the contribution that is now 'out of range' (> k faces)
                if s > k:
                    window_sum = (window_sum - dp[s - k - 1] + MOD) % MOD

                new_dp[s] = window_sum

            dp = new_dp

        return dp[target]
