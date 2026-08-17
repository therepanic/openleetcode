class Solution:
    def isSumEqual(self, firstWord: str, secondWord: str, targetWord: str) -> bool:

        def convert(word):
            return int("".join(str(ord(ch) - ord("a")) for ch in word))

        return convert(firstWord) + convert(secondWord) == convert(targetWord)
