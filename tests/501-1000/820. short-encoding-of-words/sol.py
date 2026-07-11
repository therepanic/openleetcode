from collections import defaultdict
from functools import reduce
from typing import List


class Solution:
    def minimumLengthEncoding(self, words: List[str]) -> int:
        words = list(set(words))
        trie = (d := lambda: defaultdict(d))()
        nodes = [reduce(dict.__getitem__, word[::-1], trie) for word in words]
        return sum(
            (len(word) + 1) for word, node in zip(words, nodes) if len(node) == 0
        )
