class Solution:
    def findDifferentBinaryString(self, nums: List[str]) -> str:
        return "".join(chr(ord(x[i]) ^ 1) for i, x in enumerate(nums))
