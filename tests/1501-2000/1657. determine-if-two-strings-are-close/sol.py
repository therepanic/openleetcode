class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        if len(word1) != len(word2):
            return False
        set1, set2 = set(word1), set(word2)
        if set1 != set2:
            return False
        dct = {}
        for x in set1:
            n1, n2 = word1.count(x), word2.count(x)
            dct[n1] = dct.get(n1, 0) + 1
            dct[n2] = dct.get(n2, 0) - 1
        for x in dct.values():
            if x != 0:
                return False
        return True
