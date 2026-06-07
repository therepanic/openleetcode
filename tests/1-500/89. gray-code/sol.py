class Solution(object):
    def grayCode(self, n):
        """
        :type n: int
        :rtype: List[int]
        """
        result = []
        total_numbers = 1 << n

        for i in range(total_numbers):
            result.append(i ^ (i >> 1))

        return result
