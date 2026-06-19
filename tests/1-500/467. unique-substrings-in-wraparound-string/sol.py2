class Solution(object):
    def findSubstringInWraproundString(self, s):
        from collections import defaultdict

        counts = defaultdict(int)
        max_len = 0

        for i in range(len(s)):
            if i > 0 and (ord(s[i]) - ord(s[i - 1])) % 26 == 1:
                max_len += 1
            else:
                max_len = 1
            counts[s[i]] = max(counts[s[i]], max_len)

        return sum(counts.values())
