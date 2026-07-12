from typing import List


class Solution:
    def minKBitFlips(self, nums, k):
        n = len(nums)
        ans = 0
        flips = 0
        flipped = [0] * (n + 1)

        for i in range(n - k + 1):
            flips += flipped[i]
            if (nums[i] == 0 and flips % 2 == 0) or (nums[i] == 1 and flips % 2 != 0):
                flips += 1
                ans += 1
                flipped[i + k] -= 1

        for i in range(n - k + 1, n):
            flips += flipped[i]
            if (nums[i] == 0 and flips % 2 == 0) or (nums[i] == 1 and flips % 2 != 0):
                return -1

        return ans
