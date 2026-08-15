class Solution:
    def makeEqual(self, words):
        freq = [0] * 26
        n = len(words)
        for word in words:
            for ch in word:
                freq[ord(ch) - ord("a")] += 1
        for count in freq:
            if count % n != 0:
                return False
        return True
