class Solution(object):
    def findNumbers(self, nums):
        count = 0
        for i in nums:
            msb = i.bit_length() - 1
            digits = int(msb * 0.30103) + 1
            if i >= 10**digits:
                digits += 1
            if digits % 2 == 0:
                count += 1
        return count
