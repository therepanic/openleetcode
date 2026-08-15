from bisect import bisect_right


class Solution(object):
    def maxTaxiEarnings(self, n, rides):
        """
        :type n: int
        :type rides: List[List[int]]
        :rtype: int
        """
        rides.sort(key=lambda x: x[1])
        dp = [(0, 0)]

        for start, end, tip in rides:
            i = bisect_right(dp, (start, float("inf"))) - 1
            profit = dp[i][1] + end - start + tip

            if profit > dp[-1][1]:
                dp.append((end, profit))

        return dp[-1][1]
