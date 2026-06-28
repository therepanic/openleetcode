class Solution:
    def isOneBitCharacter(self, bits: List[int]) -> bool:
        n, i = len(bits), 0
        while i < n - 1:
            i += 1 + (bits[i] == 1)
        return i == n - 1
