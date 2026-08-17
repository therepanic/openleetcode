from collections import defaultdict


class Solution:
    def tupleSameProduct(self, nums):
        product_count = defaultdict(int)
        ans = 0

        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                product = nums[i] * nums[j]
                ans += 8 * product_count[product]
                product_count[product] += 1

        return ans
