class Solution:
    def minOperations(self, nums: List[int]) -> int:
        length = len(nums)
        min_operations = length
        unique_nums = sorted(set(nums))
        right = 0

        for left in range(len(unique_nums)):
            while (
                right < len(unique_nums)
                and unique_nums[right] < unique_nums[left] + length
            ):
                right += 1

            min_operations = min(min_operations, length - (right - left))

        return min_operations
