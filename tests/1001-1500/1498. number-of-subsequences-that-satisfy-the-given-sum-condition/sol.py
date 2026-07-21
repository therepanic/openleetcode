class Solution:
    def numSubseq(self, nums, target):
        mod = 10**9 + 7
        values = sorted(nums)
        n = len(values)

        power = [1] * n
        for i in range(1, n):
            power[i] = (power[i - 1] * 2) % mod

        left, right = 0, n - 1
        result = 0

        while left <= right:
            if values[left] + values[right] <= target:
                result = (result + power[right - left]) % mod
                left += 1
            else:
                right -= 1

        return result
