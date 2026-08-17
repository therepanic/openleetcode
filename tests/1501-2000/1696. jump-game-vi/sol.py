from collections import deque


class Solution:
    def maxResult(self, nums: List[int], k: int) -> int:
        n = len(nums)
        # dp[i] will store the maximum score to reach index i
        dp = [0] * n
        dp[0] = nums[0]

        # Deque will store indices, maintaining a strictly decreasing order of dp values
        dq = deque([0])

        for i in range(1, n):
            # 1. Evict indices that are out of the max jump range 'k' from the front
            if dq and dq[0] < i - k:
                dq.popleft()

            # 2. The front of the deque holds the index of the absolute max DP value in range
            dp[i] = nums[i] + dp[dq[0]]

            # 3. Maintain the monotonic decreasing invariant at the back
            # Erase any past choices that have a worse or equal DP score than our new dp[i]
            while dq and dp[dq[-1]] <= dp[i]:
                dq.pop()

            # 4. Push the current index as a valid launchpad for future jumps
            dq.append(i)

        return dp[-1]
