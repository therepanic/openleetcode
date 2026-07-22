class Solution:
    def balancedString(self, s: str) -> int:
        n = len(s)
        each = n // 4
        count = {}
        for i in s:
            count[i] = count.get(i, 0) + 1
        extra = {}
        for i in count:
            if count[i] > each:
                extra[i] = count[i] - each
        if not extra:
            return 0
        left = 0
        res = float("inf")
        curr = {}
        for right in range(n):
            if s[right] in extra:
                curr[s[right]] = curr.get(s[right], 0) + 1
            while all(curr.get(i, 0) >= extra[i] for i in extra) and left <= right:
                res = min(res, right - left + 1)
                if s[left] in curr:
                    curr[s[left]] -= 1
                    if curr[s[left]] == 0:
                        del curr[s[left]]
                left += 1
        return res
