class Solution:
    def numOfStrings(self, patterns: list[str], word: str) -> int:
        count = 0
        for s in patterns:
            if s in word:
                count += 1
        return count
