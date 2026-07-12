class Solution:
    def xorGame(self, nums: List[int]) -> bool:
        totalXor = 0
        for value in nums:
            totalXor ^= value

        isXorZero = totalXor == 0
        hasEvenLength = len(nums) % 2 == 0

        return isXorZero or hasEvenLength
