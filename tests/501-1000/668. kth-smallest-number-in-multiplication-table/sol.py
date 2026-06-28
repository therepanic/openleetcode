class Solution:
    def findKthNumber(self, m: int, n: int, k: int) -> int:
        lo, hi = 1, m * n
        while lo < hi:
            mid, count = (lo + hi) // 2, 0
            # check how many numbers are smaller than mid
            for i in range(1, m + 1):
                count += n if n < mid // i else mid // i
            if count >= k:  # target <= mid
                hi = mid
            else:  # target > mid
                lo = mid + 1
        return lo
