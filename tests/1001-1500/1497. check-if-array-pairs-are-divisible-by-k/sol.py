from typing import List


class Solution:
    def canArrange(self, a: List[int], k: int) -> bool:
        return (
            (j := (a := sorted(v % k for v in a)).count(0)) % 2
            == 0
            == sum((p + q) % k for p, q in zip(a[j:], a[::-1]))
        )
