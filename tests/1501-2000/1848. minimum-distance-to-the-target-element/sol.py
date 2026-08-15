class Solution:
    def getMinDistance(self, nums: list[int], target: int, start: int) -> int:

        if nums[start] == target:
            return 0

        n = len(nums)
        d = 1

        while True:
            if start - d >= 0 and nums[start - d] == target:
                return d

            if start + d < n and nums[start + d] == target:
                return d

            d += 1
