from typing import List


class Solution:
    def addToArrayForm(self, num: List[int], k: int) -> List[int]:
        out = []
        i = len(num) - 1
        carry = k
        while i >= 0 or carry > 0:
            if i >= 0:
                carry += num[i]
                i -= 1
            out.append(carry % 10)
            carry //= 10
        if not out:
            return [0]
        return out[::-1]
