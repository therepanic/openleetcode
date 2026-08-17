from functools import cache
from string import ascii_lowercase


class Solution:
    def longestPalindrome(self, word1: str, word2: str) -> int:

        @cache
        def fn(lo, hi):
            """Return length of longest palindromic subsequence."""
            if lo >= hi:
                return int(lo == hi)
            if word[lo] == word[hi]:
                return 2 + fn(lo + 1, hi - 1)
            return max(fn(lo + 1, hi), fn(lo, hi - 1))

        ans = 0
        word = word1 + word2
        for x in ascii_lowercase:
            i = word1.find(x)
            j = word2.rfind(x)
            if i != -1 and j != -1:
                ans = max(ans, fn(i, j + len(word1)))
        return ans
