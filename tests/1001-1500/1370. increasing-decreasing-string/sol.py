from collections import Counter


class Solution:
    def sortString(self, s: str) -> str:
        if not s:
            return ""
        counts = Counter(s)
        keys = list(counts.keys())
        keys.sort(key=lambda x: ord(x))
        ans = ""
        while max(counts.values()) > 0:
            for key in keys:
                if counts[key] > 0:
                    ans += key
                    counts[key] -= 1
            for key in reversed(keys):
                if counts[key] > 0:
                    ans += key
                    counts[key] -= 1
        return ans
