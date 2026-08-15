class Solution:
    def longestBeautifulSubstring(self, word: str) -> int:
        n = len(word)
        i = 0
        length = 0

        while i < n:
            if word[i] != "a":
                i += 1
                continue

            j = i
            unique = 1
            while j + 1 < n and word[j + 1] >= word[j]:
                if word[j + 1] != word[j]:
                    unique += 1
                j += 1

            if unique == 5:
                length = max(length, j - i + 1)

            i = j + 1

        return length
