class Solution:
    def countSubstrings(self, s: str) -> int:
        count = 0

        def expand(left, right):
            res = 0
            while left >= 0 and right < len(s) and s[left] == s[right]:
                res += 1
                left -= 1
                right += 1
            return res

        for i in range(len(s)):
            count += expand(i, i)  # Odd
            count += expand(i, i + 1)  # Even

        return count
