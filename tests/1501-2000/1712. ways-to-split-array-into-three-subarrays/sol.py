import bisect


class Solution(object):
    def waysToSplit(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        MOD = 10**9 + 7
        n = len(nums)
        prefix = [0] * n
        prefix[0] = nums[0]

        for i in range(1, n):
            prefix[i] = prefix[i - 1] + nums[i]

        res = 0
        for i in range(n - 2):
            left = prefix[i]
            j = bisect.bisect_left(prefix, 2 * left, i + 1, n - 1)
            k = bisect.bisect_right(prefix, (prefix[-1] + left) // 2, j, n - 1)

            if j < k:
                res = (res + k - j) % MOD

        return res
