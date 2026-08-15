class Solution(object):
    def largestMerge(self, word1, word2):
        res = []
        i, j = 0, 0
        while i < len(word1) and j < len(word2):
            if word1[i] > word2[j]:
                res.append(word1[i])
                i += 1
            elif word1[i] < word2[j]:
                res.append(word2[j])
                j += 1
            else:
                p, q = i, j
                while p < len(word1) and q < len(word2) and word1[p] == word2[q]:
                    p += 1
                    q += 1
                if q == len(word2) or (p < len(word1) and word1[p] > word2[q]):
                    res.append(word1[i])
                    i += 1
                else:
                    res.append(word2[j])
                    j += 1

        while i < len(word1):
            res += word1[i]
            i += 1
        while j < len(word2):
            res += word2[j]
            j += 1
        return "".join(res)
        """
        :type word1: str
        :type word2: str
        :rtype: str
        """
