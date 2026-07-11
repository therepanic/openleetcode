import bisect
from typing import List


# https://leetcode.com/problems/tallest-billboard/
class Solution:
    def tallestBillboard(self, rods: List[int]) -> int:
        """
        Split rods into two halves

        For each half generate all possible states

        Each rod has three choices

        put into first support
        put into second support
        ignore the rod

        Let

        a = height of first support
        b = height of second support

        Store

        difference = a - b
        smaller_height = b

        Why store b

        Suppose difference is fixed

        a = b + difference

        So once difference is known maximizing b automatically maximizes a as well

        Therefore for every difference we only care about the state having the largest smaller support

        Left half gives

        difference_left
        smaller_height_left

        Right half gives

        difference_right
        smaller_height_right

        When combining the two halves we want final supports to have equal height

        Final difference

        difference_left + difference_right = 0

        Therefore

        difference_right = -difference_left

        If this condition holds then the imbalance created in the left half is exactly cancelled by the imbalance created in the right half

        The total common height becomes

        smaller_height_left + smaller_height_right

        Since both lists are sorted by difference

        Binary search finds states in the right half having opposite difference

        Among those states choosing the largest stored smaller height gives the best answer

        Meet in the middle reduces complexity from

        3^n

        to roughly

        3^(n/2) + 3^(n/2)

        which is feasible for the constraints
        """
        n = len(rods)

        def gen(idx, end, a, b, vals):
            # skip
            if idx == end + 1:
                vals.append((a - b, b))
                return
            gen(idx + 1, end, a, b, vals)
            gen(idx + 1, end, a + rods[idx], b, vals)
            gen(idx + 1, end, a, b + rods[idx], vals)

        left = []
        right = []
        mid = (n - 1) >> 1
        gen(0, mid, 0, 0, left)
        gen(mid + 1, n - 1, 0, 0, right)
        left.sort(key=lambda x: (x[0], -x[1]))
        right.sort(key=lambda x: (x[0], -x[1]))
        # print(left)
        # print(right)
        ans = 0
        for i in range(len(left)):
            d = left[i][0]
            b = left[i][1]
            idx = bisect.bisect_left(right, (-d, -1))
            if idx < len(right) and right[idx][0] == -d:
                ans = max(ans, b + right[idx][1])
        return ans
