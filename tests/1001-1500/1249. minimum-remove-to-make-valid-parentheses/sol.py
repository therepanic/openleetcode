from collections import deque


class Solution:
    def minRemoveToMakeValid(self, s: str) -> str:
        t = []
        p = 0
        for c in s:
            p += (c == "(") - (c == ")")
            if p >= 0:
                t.append(c)
            else:
                p = 0
        p = 0
        q = deque()
        for c in t[::-1]:
            p += (c == "(") - (c == ")")
            if p <= 0:
                q.appendleft(c)
            else:
                p = 0
        return "".join(q)
