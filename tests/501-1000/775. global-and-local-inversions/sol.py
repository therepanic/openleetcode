class Solution(object):
    def isIdealPermutation(self, nums):
        for i, num in enumerate(nums):
            if abs(num - i) > 1:
                return False
        return True
