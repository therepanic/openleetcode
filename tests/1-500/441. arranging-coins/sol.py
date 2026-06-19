import math


class Solution(object):
    def arrangeCoins(self, n):
        return int((math.sqrt(8 * n + 1) - 1) // 2)
