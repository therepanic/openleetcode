class Solution:
    def longestPalindrome(self, s: str) -> int:
        count = {}

        for c in s:
            count[c] = count.get(c, 0) + 1

        max_len = 0
        odd = False

        for freq in count.values():
            if freq % 2 == 0:
                max_len += freq
            else:
                max_len += freq - 1
                odd = True

        return max_len + (1 if odd else 0)
