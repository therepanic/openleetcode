from typing import List


class Solution:
    def shortestToChar(self, s, c):
        n = len(s)
        ans = [n] * n
        prev = -n
        for i, ch in enumerate(s):
            if ch == c:
                prev = i
            ans[i] = i - prev
        prev = 2 * n
        for i in range(n - 1, -1, -1):
            if s[i] == c:
                prev = i
            ans[i] = min(ans[i], prev - i)
        return ans
