from functools import lru_cache


class Solution:
    def countPalindromicSubsequences(self, s: str) -> int:

        @lru_cache(None)
        def dp(left: int, rght: int, res=0):

            for ch in "abcd":
                l, r = s.find(ch, left, rght), s.rfind(ch, left, rght)

                res += 0 if l == -1 else 1 if l == r else dp(l + 1, r) + 2

            return res % 1_000_000_007

        return dp(0, len(s))
