from functools import lru_cache
from itertools import chain
from math import comb


class Solution:
    def getProbability(self, balls: List[int]) -> float:

        nxt = lambda x, y: x | 1 << balls[y]  # function to update masks

        @lru_cache(None)
        def dp(i, cnt0, box0, box1):  #      i: current ball
            #   cnt0: count of balls in first box
            #   box0: mask of colors in first box
            #   box1: mask of colors in second box
            cnt1 = i - cnt0
            if cnt0 > sm // 2 or cnt1 > sm // 2:
                return 0  # a box has too many balls

            if i == len(balls):
                return box0.bit_count() == box1.bit_count()  # each bit is a color

            return (
                dp(i + 1, cnt0 + 1, nxt(box0, i), box1)  # ball added to first box
                + dp(i + 1, cnt0, box0, nxt(box1, i))
            )  # ball added to second box

        sm = sum(balls)
        balls = list(chain(*([i] * ball for i, ball in enumerate(balls))))

        return dp(0, 0, 0, 0) / comb(sm, sm // 2)
