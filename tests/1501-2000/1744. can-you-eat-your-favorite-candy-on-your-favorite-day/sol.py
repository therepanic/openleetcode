class Solution(object):
    def canEat(self, candiesCount, queries):
        """
        :type candiesCount: List[int]
        :type queries: List[List[int]]
        :rtype: List[bool]
        """
        n = len(candiesCount)
        m = len(queries)
        ans = [False] * m
        psum = [0] * (n + 1)
        for i in range(1, n + 1):
            psum[i] = psum[i - 1] + candiesCount[i - 1]
        for i in range(m):
            t, day, cap = queries[i]
            day += 1
            minDays = (psum[t] + cap) // cap
            maxDays = psum[t + 1]
            ans[i] = minDays <= day and day <= maxDays

        return ans
