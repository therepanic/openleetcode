from itertools import accumulate
from bisect import bisect_left
from functools import cache


class Solution:
    def stoneGameV(self, stoneValue: List[int]) -> int:

        sv = [0, *accumulate(stoneValue)]

        @cache
        def helper(fro, to):
            if to - fro == 1:
                return 0

            mid = bisect_left(sv, (sv[to] + sv[fro]) // 2)

            dist = res = 0
            explore_more = True
            while explore_more:
                explore_more = False
                for i in [mid - dist, mid + dist]:
                    if fro < i <= to:
                        left, right = sv[i] - sv[fro], sv[to] - sv[i]
                        if res // 2 <= left <= right:
                            res = max(res, left + helper(fro, i))
                            explore_more = True
                        if left >= right >= res // 2:
                            res = max(res, right + helper(i, to))
                            explore_more = True
                dist += 1
            return res

        return helper(0, len(stoneValue))
