class Solution:
    def findAndReplacePattern(self, words: List[str], pattern: str) -> List[str]:

        counts = [pattern.index(i) for i in pattern]
        res = []
        for i in words:
            count = []
            for j in i:
                count.append(i.index(j))
            if count == counts:
                res.append(i)
        return res
