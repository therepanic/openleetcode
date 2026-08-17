from itertools import accumulate, pairwise, starmap
from operator import sub
from typing import List


class Solution:
    def minDifference(self, nums: List[int], queries: List[List[int]]) -> List[int]:
        a = nums
        q = queries
        p = [
            *accumulate(
                a,
                lambda p, v: [z + (v == i) for i, z in enumerate(p)],
                initial=[0] * (max(a) + 1),
            )
        ]

        return [
            -max(
                starmap(
                    sub,
                    pairwise(i for i, z in enumerate(map(sub, p[r + 1], p[l])) if z),
                ),
                default=1,
            )
            for l, r in q
        ]
