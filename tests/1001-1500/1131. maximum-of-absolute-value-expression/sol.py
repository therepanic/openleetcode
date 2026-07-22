class Solution(object):
    def maxAbsValExpr(self, arr1, arr2):
        """
        :type arr1: List[int]
        :type arr2: List[int]
        :rtype: int
        """
        res = 0
        n = len(arr1)

        for p, q in [(1, 1), (1, -1), (-1, 1), (-1, -1)]:
            max_val = float("-inf")
            min_val = float("inf")
            for i in range(n):
                value = p * arr1[i] + q * arr2[i] + i
                max_val = max(max_val, value)
                min_val = min(min_val, value)
            res = max(res, max_val - min_val)

        return res
