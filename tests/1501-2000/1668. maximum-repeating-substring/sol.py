class Solution:
    def maxRepeating(self, sequence: str, word: str) -> int:
        temp, res = word, 0
        while temp in sequence:
            res += 1
            temp += word
        return res
