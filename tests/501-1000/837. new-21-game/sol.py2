class Solution(object):
    def new21Game(self, n, k, maxPts):
        """
        :type n: int
        :type k: int
        :type maxPts: int
        :rtype: float
        """
        if k == 0 or n >= k - 1 + maxPts:
            return 1.0

        dp = [0.0] * maxPts
        dp[0] = 1.0

        window_sum = 1.0
        result = 0.0

        for i in range(1, n + 1):
            prob = window_sum / maxPts

            if i < k:
                window_sum += prob
            else:
                result += prob

            if i >= maxPts:
                window_sum -= dp[i % maxPts]

            dp[i % maxPts] = prob

        return result
