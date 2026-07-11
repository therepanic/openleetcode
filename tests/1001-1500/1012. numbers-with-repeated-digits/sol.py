from math import perm


class Solution:
    def numDupDigitsAtMostN(self, n: int) -> int:
        digits = list(map(int, str(n + 1)))
        nl = len(digits)
        res = sum(9 * perm(9, i) for i in range(nl - 1))
        s = set()
        for i, x in enumerate(digits):
            for y in range(i == 0, x):
                if y not in s:
                    res += perm(9 - i, nl - i - 1)
            if x in s:
                break
            s.add(x)
        return n - res
