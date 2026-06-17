class Solution(object):
    def singleNumber(self, nums):
        x = 0
        for n in nums:
            x ^= n

        bit = x & -x
        a = 0
        b = 0
        for n in nums:
            if n & bit:
                a ^= n
            else:
                b ^= n

        return [a, b]
