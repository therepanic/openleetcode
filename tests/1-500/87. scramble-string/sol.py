class Solution:
    def __init__(self):
        self.memo = {}

    def isScramble(self, s1, s2):
        if len(s1) != len(s2):
            return False
        if s1 == s2:
            return True
        key = s1 + "#" + s2
        if key in self.memo:
            return self.memo[key]

        if sorted(s1) != sorted(s2):
            self.memo[key] = False
            return False

        n = len(s1)
        for i in range(1, n):
            # No swap
            if self.isScramble(s1[:i], s2[:i]) and self.isScramble(s1[i:], s2[i:]):
                self.memo[key] = True
                return True
            # Swap
            if self.isScramble(s1[:i], s2[n - i :]) and self.isScramble(
                s1[i:], s2[: n - i]
            ):
                self.memo[key] = True
                return True

        self.memo[key] = False
        return False
