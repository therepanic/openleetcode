from collections import Counter
from typing import List


class Solution:
    def uncommonFromSentences(self, s1: str, s2: str) -> List[str]:
        return [
            word
            for word, count in Counter(s1.split() + s2.split()).items()
            if count == 1
        ]
