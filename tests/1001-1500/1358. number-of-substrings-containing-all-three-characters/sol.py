class Solution:
    def numberOfSubstrings(self, s: str) -> int:
        res, p = 0, [5e4, -1, -1, -1]

        for i, ch in enumerate(s):
            p[ord(ch) & 31] = i
            res += min(p) + 1

        return res
