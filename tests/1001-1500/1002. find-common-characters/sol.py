from collections import Counter
from typing import List


class Solution:
    def commonChars(self, words: List[str]) -> List[str]:
        chars = list(words[0])
        freq = Counter(chars)
        for word in words:
            f = Counter(word)
            for c in freq:
                if c in f:
                    freq[c] = min(f[c], freq[c])
                else:
                    freq[c] = 0
        res = ""
        for x in freq:
            if freq[x] != 0:
                res = res + x * freq[x]
        return list(res)
