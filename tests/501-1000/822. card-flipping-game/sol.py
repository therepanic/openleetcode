class Solution(object):
    def flipgame(self, fronts, backs):
        bad = {a for a, b in zip(fronts, backs) if a == b}
        best = 2001
        for a, b in zip(fronts, backs):
            if a not in bad and a < best:
                best = a
            if b not in bad and b < best:
                best = b
        return best if best <= 2000 else 0
