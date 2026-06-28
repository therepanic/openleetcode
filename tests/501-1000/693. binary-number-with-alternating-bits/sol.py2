class Solution(object):
    def hasAlternatingBits(self, n):
        """
        :type n: int
        :rtype: bool
        """
        x = n ^ (n >> 1)
        return (x & (x + 1)) == 0
