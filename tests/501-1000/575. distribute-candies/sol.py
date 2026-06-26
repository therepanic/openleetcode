class Solution(object):
    def distributeCandies(self, candyType):
        n = len(candyType)
        k = n / 2
        return min(k, len(set(candyType)))
