class Solution:
    def minimumSize(self, nums, maxOperations):
        lo, hi = 1, max(nums)
        while lo < hi:
            mid = (lo + hi) // 2
            needed = sum((x - 1) // mid for x in nums)
            if needed <= maxOperations:
                hi = mid
            else:
                lo = mid + 1
        return lo

    def test():
        sol = Solution()

        # Basic case
        assert sol.minimumSize([9], 2) == 3

        # Multiple bags
        assert sol.minimumSize([2, 4, 8, 2], 4) == 2

        # No operations allowed
        assert sol.minimumSize([7, 17], 0) == 17

        # Large values
        assert sol.minimumSize([1000000000], 1) == 500000000
