class Solution:
    def subsets(self, nums):
        res = [[]]
        for x in nums:
            res += [cur + [x] for cur in res]
        return res
