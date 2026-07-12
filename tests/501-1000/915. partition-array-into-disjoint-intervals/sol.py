class Solution:
    def partitionDisjoint(self, nums: List[int]) -> int:
        n = len(nums)

        prefix_max = [0] * n
        prefix_max[0] = nums[0]

        for i in range(1, n):
            prefix_max[i] = max(prefix_max[i - 1], nums[i])

        suffix_min = [0] * n
        suffix_min[-1] = nums[-1]

        for i in range(n - 2, -1, -1):
            suffix_min[i] = min(suffix_min[i + 1], nums[i])

        for i in range(n - 1):
            if prefix_max[i] <= suffix_min[i + 1]:
                return i + 1
