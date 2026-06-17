class Solution(object):
    def hIndex(self, citations):
        """
        :type citations: List[int]
        :rtype: int
        """
        n = len(citations)
        l = 0
        r = n
        while l < r:
            m = (l + r + 1) // 2
            [l, r] = [m, r] if citations[n - m] >= m else [l, m - 1]
        return l
