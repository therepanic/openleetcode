from bisect import bisect_right


class Solution:
    def maxValue(self, events, k):
        # Step 1: Sort events by end time
        events.sort(key=lambda x: x[1])
        n = len(events)

        # Step 2: Extract start times separately for binary search
        start_times = [e[0] for e in events]

        # Step 3: Initialize DP table
        dp = [[0] * (k + 1) for _ in range(n + 1)]

        # Step 4: Loop through each event
        for i in range(1, n + 1):
            start, end, value = events[i - 1]

            # Step 5: Binary search for last non-overlapping event
            prev = self.findLastNonOverlapping(events, i - 1, start)

            for j in range(1, k + 1):
                # Option 1: skip current event
                # Option 2: take current event and add to prev best
                dp[i][j] = max(dp[i - 1][j], dp[prev + 1][j - 1] + value)

        # Step 6: Return final answer
        return dp[n][k]

    def findLastNonOverlapping(self, events, right, targetStart):
        left = 0
        res = -1
        while left <= right:
            mid = (left + right) // 2
            if events[mid][1] < targetStart:
                res = mid
                left = mid + 1
            else:
                right = mid - 1
        return res
