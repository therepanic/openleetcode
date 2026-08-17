class Solution:
    def sumOfBeauties(self, nums: List[int]) -> int:
        n = len(nums)

        prefix = [0] * n
        suffix = [0] * n

        prefix[0] = nums[0]
        suffix[n - 1] = nums[n - 1]

        for i in range(1, n):
            prefix[i] = max(nums[i - 1], prefix[i - 1])

        for i in range(n - 2, -1, -1):
            suffix[i] = min(nums[i + 1], suffix[i + 1])

        ans = 0
        for i in range(1, n - 1):
            if prefix[i] < nums[i] < suffix[i]:
                ans += 2
            elif nums[i - 1] < nums[i] < nums[i + 1]:
                ans += 1
        return ans
