class Solution(object):
    def shortestCompletingWord(self, licensePlate, words):
        import collections
        lp = collections.Counter(c for c in licensePlate.lower() if c.isalpha())
        ans = None
        for w in words:
            cw = collections.Counter(w)
            if all(cw.get(c, 0) >= lp[c] for c in lp):
                if ans is None or len(w) < len(ans):
                    ans = w
        return ans
