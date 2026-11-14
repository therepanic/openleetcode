class Solution:
    def minimumMoves(self, s: str) -> int:
        count = i = 0
        while i < len(s):
            if s[i] == 'X':
                count += 1
                i += 3
            else:
                i += 1
        return count