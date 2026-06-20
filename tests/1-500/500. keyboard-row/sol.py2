class Solution(object):
    def findWords(self, words):
        m = {}
        for c in "qwertyuiop":
            m[c] = 1
        for c in "asdfghjkl":
            m[c] = 2
        for c in "zxcvbnm":
            m[c] = 3
        ans = []
        for w in words:
            lw = w.lower()
            r = m[lw[0]]
            if all(m[ch] == r for ch in lw):
                ans.append(w)
        return ans
