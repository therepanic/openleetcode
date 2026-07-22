import math


class Solution:
    def angleClock(self, h: int, m: int) -> float:
        return math.acos(math.cos((330 * h + 5.5 * m) * 0.0174532925)) * 57.2957795
