class Solution(object):
    def kClosest(self, points, k):
        return sorted(points, key=lambda p: p[0] * p[0] + p[1] * p[1])[:k]
