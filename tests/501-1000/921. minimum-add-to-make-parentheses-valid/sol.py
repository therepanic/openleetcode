class Solution(object):
    def minAddToMakeValid(self, s: str) -> int:
        l = [0]
        for i in s:
            if l[-1] == "(" and i == ")":
                l.pop()
            else:
                l.append(i)
        return len(l) - 1
