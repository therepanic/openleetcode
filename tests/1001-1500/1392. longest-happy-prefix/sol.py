class Solution:
    def longestPrefix(self, s: str) -> str:
        prefix = [0] * len(s)
        matched = 0
        for i in range(1, len(s)):
            while matched and s[i] != s[matched]:
                matched = prefix[matched - 1]
            if s[i] == s[matched]:
                matched += 1
            prefix[i] = matched
        return s[: prefix[-1]]
