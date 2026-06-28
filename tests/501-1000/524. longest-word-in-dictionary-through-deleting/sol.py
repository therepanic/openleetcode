class Solution:
    def findLongestWord(self, s: str, dictionary: List[str]) -> str:

        ans = ""

        for word in dictionary:
            i = 0
            j = 0

            while i < len(word) and j < len(s):
                if word[i] == s[j]:
                    i += 1
                j += 1

            if i == len(word):
                if len(word) > len(ans):
                    ans = word

                elif len(word) == len(ans) and word < ans:
                    ans = word

        return ans
