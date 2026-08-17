class Solution:
    def maximumScore(self, nums, k):
        n = len(nums)
        i = j = k
        cur_min = nums[k]
        res = cur_min

        while i > 0 or j < n - 1:
            if i == 0:
                j += 1
            elif j == n - 1:
                i -= 1
            elif nums[i - 1] >= nums[j + 1]:
                i -= 1
            else:
                j += 1
            cur_min = min(cur_min, nums[i], nums[j])
            res = max(res, cur_min * (j - i + 1))

        return res
