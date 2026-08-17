class Solution:
    def subsetXORSum(self, nums):
        total = 0
        for num in nums:
            total |= num  # Step 1: Compute bitwise OR of all numbers
        return total * (1 << (len(nums) - 1))  # Step 2: Multiply by 2^(n-1)
