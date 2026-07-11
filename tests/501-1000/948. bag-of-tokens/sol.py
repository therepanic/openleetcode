from typing import List


class Solution:
    def bagOfTokensScore(self, tokens: List[int], power: int) -> int:
        tokens.sort()

        n = len(tokens)
        l = 0
        curr = 0

        while l < n and tokens[l] <= power:
            power -= tokens[l]
            l += 1
            curr += 1

        r = n - 1
        res = curr

        while l < r and curr:
            power += tokens[r]
            curr -= 1
            r -= 1

            while l <= r and tokens[l] <= power:
                power -= tokens[l]
                l += 1
                curr += 1
            res = max(res, curr)

        return res
