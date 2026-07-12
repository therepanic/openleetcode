class Solution:
    def sumSubseqWidths(self, nums: List[int]) -> int:
        mod = 1_000_000_007

        nums.sort()
        n, ans, factor = len(nums), 0, 1

        for i in range(n):
            ans += (nums[i] - nums[~i]) * factor
            factor *= 2
            factor %= mod

        return ans % mod
