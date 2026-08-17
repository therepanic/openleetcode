class Solution:
    def arraySign(self, nums: List[int]) -> int:
        if 0 in nums:
            return 0
        return 1 if sum(i < 0 for i in nums) % 2 == 0 else -1
