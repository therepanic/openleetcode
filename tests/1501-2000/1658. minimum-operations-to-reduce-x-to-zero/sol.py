class Solution:
    def minOperations(self, nums: List[int], x: int) -> int:
        sub_sum = sum(nums) - x
        n = len(nums)
        opes = n
        if sub_sum == 0:
            return n
        l, r, sld_sum = 0, 0, 0

        while r < n:
            if sld_sum == sub_sum:
                opes = min(opes, n - (r - l))
            sld_sum += nums[r]
            while l < r and sld_sum > sub_sum:
                sld_sum -= nums[l]
                l += 1
            r += 1

        if sld_sum == sub_sum:
            opes = min(opes, n - (r - l))

        return -1 if opes == n else opes
