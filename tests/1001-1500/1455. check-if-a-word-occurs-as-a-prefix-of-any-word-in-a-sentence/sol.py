class Solution:
    def isPrefixOfWord(self, sentence: str, searchWord: str) -> int:
        words = sentence.split(" ")
        for i in words:
            if searchWord == i[: len(searchWord)]:
                return words.index(i) + 1
        return -1
