class Solution:
    def minimumPerimeter(self, neededApples: int) -> int:
        lo, hi = 0, 100000
        while lo < hi:
            mid = (lo + hi) // 2
            apples = 2 * mid * (mid + 1) * (2 * mid + 1)
            if apples >= neededApples:
                hi = mid
            else:
                lo = mid + 1
        return lo * 8
