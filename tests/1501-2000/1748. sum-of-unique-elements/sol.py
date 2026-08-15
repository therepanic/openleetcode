class Solution(object):
    def sumOfUnique(self, nums):
        s = 0
        for i in nums:
            if nums.count(i) == 1:
                s = s + i
        return s
