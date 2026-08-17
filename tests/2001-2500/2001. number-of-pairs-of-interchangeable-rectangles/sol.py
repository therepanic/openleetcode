from collections import defaultdict


def gcd(a, b):
    while b:
        a, b = b, a % b
    return a


class Solution(object):
    def interchangeableRectangles(self, rectangles):
        """
        :type rectangles: List[List[int]]
        :rtype: int
        """
        ratio_count = defaultdict(int)
        result = 0

        for width, height in rectangles:
            g = gcd(width, height)
            reduced = (width // g, height // g)
            result += ratio_count[reduced]
            ratio_count[reduced] += 1

        return result
