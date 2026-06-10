from typing import List

from collections import deque


class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        word_set = set(wordList)
        if endWord not in word_set:
            return 0

        queue = deque([(beginWord, 1)])
        while queue:
            word, steps = queue.popleft()
            if word == endWord:
                return steps

            for i in range(len(word)):
                prefix = word[:i]
                suffix = word[i + 1 :]
                for code in range(ord("a"), ord("z") + 1):
                    candidate = prefix + chr(code) + suffix
                    if candidate in word_set:
                        word_set.remove(candidate)
                        queue.append((candidate, steps + 1))

        return 0
