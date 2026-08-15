from collections import defaultdict


class Solution(object):
    def wonderfulSubstrings(self, word):
        """
        :type word: str
        :rtype: int
        """
        count = defaultdict(int)
        count[0] = 1
        mask = 0
        res = 0

        for ch in word:
            bit = ord(ch) - ord("a")
            mask ^= 1 << bit
            res += count[mask]

            for i in range(10):
                res += count[mask ^ (1 << i)]

            count[mask] += 1

        return res
