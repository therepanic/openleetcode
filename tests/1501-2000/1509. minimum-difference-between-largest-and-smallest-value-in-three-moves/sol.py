"""
Complexity Analysis:
    - Greedy:
        1) Time Complexity: O(nlogn)
        2) Space Complexity: O(1)
    - DFS:
        1) Time Complexity: O(nlogn)
        2) Space Complexity: O(1)
"""


class Greedy:
    def find_min_difference(self, nums):
        if len(nums) <= 3:
            return 0
        nums.sort()
        n = len(nums)
        return min(
            nums[n - 4] - nums[0],
            nums[n - 3] - nums[1],
            nums[n - 2] - nums[2],
            nums[n - 1] - nums[3],
        )


class DFS:
    def get_min_difference(self, start, end, steps, nums):
        if steps == 0:
            return nums[end] - nums[start]
        return min(
            self.get_min_difference(start + 1, end, steps - 1, nums),
            self.get_min_difference(start, end - 1, steps - 1, nums),
        )

    def find_min_difference(self, nums):
        if len(nums) <= 3:
            return 0
        nums.sort()
        return self.get_min_difference(0, len(nums) - 1, 3, nums)


class Solution:
    def minDifference(self, nums: List[int]) -> int:
        # return Greedy().find_min_difference(nums)
        return DFS().find_min_difference(nums)
