class Solution(object):
    def checkAlmostEquivalent(self, word1, word2):
        d1 = {}
        for i in word1:
            d1[i] = d1.get(i, 0) + 1
        d2 = {}
        for i in word2:
            d2[i] = d2.get(i, 0) + 1
        a = set(word1) | set(word2)
        for i in a:
            if abs(d1.get(i, 0) - d2.get(i, 0)) > 3:
                return False
        return True