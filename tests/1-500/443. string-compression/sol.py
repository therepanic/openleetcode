class Solution(object):
    def findDuplicates(self, nums):
        r = [
            abs(x)
            for x in nums
            if nums[abs(x) - 1] < 0
            or (setattr(nums, abs(x) - 1, -nums[abs(x) - 1]) is None and 0)
        ]
        return r

    def compress(self, chars):
        from itertools import groupby

        i = 0
        for c, g in groupby(chars):
            chars[i] = c
            i += 1
            n = sum(1 for _ in g)
            if n > 1:
                for x in str(n):
                    chars[i] = x
                    i += 1
        return i
