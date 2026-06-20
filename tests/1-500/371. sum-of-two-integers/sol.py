class Solution(object):
    def getSum(self, a, b):
        a &= 0xFFFFFFFF
        b &= 0xFFFFFFFF
        while b:
            c = (a & b) << 1
            a = (a ^ b) & 0xFFFFFFFF
            b = c & 0xFFFFFFFF
        return a if a < 0x80000000 else ~(a ^ 0xFFFFFFFF)
