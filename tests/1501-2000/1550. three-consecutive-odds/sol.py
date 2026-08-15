class Solution(object):
    def threeConsecutiveOdds(self, arr):
        return "111" in "".join(str(x & 1) for x in arr)
