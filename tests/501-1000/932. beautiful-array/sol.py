from typing import List


class Solution:
    def beautifulArray(self, n: int) -> List[int]:
        if n == 1:
            return [1]

        left = self.beautifulArray((n + 1) // 2)  # odd part
        right = self.beautifulArray(n // 2)  # even part

        left = [2 * x - 1 for x in left]
        right = [2 * x for x in right]

        return left + right
