class Solution:
    def sortSentence(self, s: str) -> str:

        words = {}
        for word in s.split():
            words[int(word[-1])] = word[:-1]
        return " ".join(words[i] for i in sorted(words))
