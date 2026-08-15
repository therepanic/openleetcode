class Solution:
    def reorderSpaces(self, text: str) -> str:
        t = text.split()
        _ = text.count(" ")
        z = len(t) - 1
        n = 1
        if z > 0:
            n = _ // z
        s = ""
        for i in t:
            s += i + " " * n
        if z == 0:
            return s[:-n] + " " * _
        return s[:-n] + (" " * (_ % z))
