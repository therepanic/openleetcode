class Solution:
    def maxCoins(self, nums: List[int]) -> int:
        # 1. Pad with 1 at both ends
        balloons = [1] + nums + [1]
        n = len(balloons)
        
        # 2. dp[i][j] = max coins collectable by bursting all balloons
        #    strictly between i and j (i and j themselves remain unburst).
        dp = [[0] * n for _ in range(n)]
        
        # 3. Build up from shorter intervals to longer ones
        #    `length` is the distance between left and right pointers
        for length in range(2, n):              # minimum meaningful window is size 2
            for left in range(0, n - length):
                right = left + length
                # 4. Try bursting each possible k last in (left, right)
                best = 0
                for k in range(left + 1, right):
                    # coins from bursting k when neighbors are left and right
                    # The last three balloons standing will be left, k, and right
                    gain = balloons[left] * balloons[k] * balloons[right]
                    # plus coins from subproblems [left..k] and [k..right]
                    # dp[left][k] is the best we can do when left and k become last two balloons
                    # [B1, B2, B3, B4] , left = 0, right = 3, k= 1 or 2
                    # We are comparing popping B2 last resulting in [B1, B2, B4] or B3 last for [B1,B3,B4]
                    # We have previously calculated the best cases for [B2, B4] and [B1, B3]
                    total = gain + dp[left][k] + dp[k][right]
                    if total > best:
                        best = total
                dp[left][right] = best
        
        # 5. Our answer is bursting everything between the two virtual 1’s
        return dp[0][n-1]