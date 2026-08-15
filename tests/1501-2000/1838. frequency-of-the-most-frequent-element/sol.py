class Solution:
    def maxFrequency(self, nums: List[int], k: int) -> int:

        nums.sort()
        left = right = res = total = 0

        while right < len(nums):
            total += nums[right]

            while nums[right] * (right - left + 1) > total + k:
                total -= nums[left]
                left += 1

            res = max(res, right - left + 1)
            right += 1

        return res
