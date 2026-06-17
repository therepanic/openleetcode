class Solution:
    def minPatches(self, nums: List[int], n: int) -> int:
        currentSum = 1  # Tracks the smallest number that cannot be formed
        patches = 0     # Number of patches added
        index = 0       # Index to iterate through the nums array

        # Continue until we can form numbers up to n
        while currentSum <= n:
            if index < len(nums) and nums[index] <= currentSum:
                # If the current number in nums can be added to currentSum
                currentSum += nums[index]  # Include nums[index] in the range
                index += 1
            else:
                # Add a patch (currentSum itself) to cover the range up to currentSum * 2 - 1
                currentSum += currentSum
                patches += 1

        return patches