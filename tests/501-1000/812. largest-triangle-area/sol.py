from typing import List


class Solution:
    def largestTriangleArea(self, points: List[List[int]]) -> float:
        return max(
            abs(0.5 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)))
            for i, (x1, y1) in enumerate(points)
            for j, (x2, y2) in enumerate(points[i:], i)
            for k, (x3, y3) in enumerate(points[j:], j)
        )
