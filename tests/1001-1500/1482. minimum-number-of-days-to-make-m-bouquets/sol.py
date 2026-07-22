class Solution:
    def f(self, bloomDay, m, k, timeLimit):
        cntr = 0
        bouquetCntr = 0

        for day in bloomDay:
            if day <= timeLimit:
                cntr += 1
                if cntr == k:
                    bouquetCntr += 1
                    cntr = 0
            else:
                cntr = 0

        return bouquetCntr >= m

    def minDays(self, bloomDay, m, k):
        if m * k > len(bloomDay):
            return -1

        s = min(bloomDay)
        e = max(bloomDay)
        ans = -1

        while s <= e:
            mid = s + (e - s) // 2

            if self.f(bloomDay, m, k, mid):
                ans = mid
                e = mid - 1
            else:
                s = mid + 1

        return ans
