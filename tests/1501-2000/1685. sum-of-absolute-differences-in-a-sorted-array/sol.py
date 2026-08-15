class Solution:
    def getSumAbsoluteDifferences(self, nums: List[int]) -> List[int]:
        n = len(nums)
        pref = [0] * n
        pref[0] = nums[0]

        for i in range(1, n):
            pref[i] = pref[i - 1] + nums[i]

        ans = []
        for i in range(n):
            left = 0
            if i > 0:
                left = pref[i - 1]
            right = pref[n - 1] - pref[i]
            ans.append(right - left + (2 * i - n + 1) * nums[i])

        return ans
