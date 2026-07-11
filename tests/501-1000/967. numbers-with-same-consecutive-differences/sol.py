from typing import List


class Solution:
    def numsSameConsecDiff(self, n: int, k: int) -> List[int]:
        res = set(x for x in range(1, 10))
        n -= 1

        while n:
            for val in list(res):
                res.remove(val)
                last = val % 10
                if last + k < 10:
                    res.add(val * 10 + last + k)
                if last - k >= 0:
                    res.add(val * 10 + last - k)
            n -= 1

        return list(res)
