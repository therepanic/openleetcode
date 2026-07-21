from math import acos, atan2, sqrt
from typing import List


class Solution:
    def numPoints(self, points: List[List[int]], r: int) -> int:
        ans = 1
        radius = float(r)
        radius_sq = radius * radius
        for i, (x1, y1) in enumerate(points):
            for x2, y2 in points[i + 1 :]:
                dx = x2 - x1
                dy = y2 - y1
                distance_sq = dx * dx + dy * dy
                if distance_sq > 4 * radius_sq:
                    continue
                distance = sqrt(distance_sq)
                midpoint_x = (x1 + x2) / 2.0
                midpoint_y = (y1 + y2) / 2.0
                offset = sqrt(max(0.0, radius_sq - distance_sq / 4.0))
                normal_x = -dy / distance
                normal_y = dx / distance
                for sign in (-1.0, 1.0):
                    center_x = midpoint_x + sign * offset * normal_x
                    center_y = midpoint_y + sign * offset * normal_y
                    count = sum(
                        (x - center_x) ** 2 + (y - center_y) ** 2 <= radius_sq + 1e-9
                        for x, y in points
                    )
                    ans = max(ans, count)
        return ans
