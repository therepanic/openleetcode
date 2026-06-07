class Solution:
    def canJump(self, nums):
        goal = 0

        for i, n in enumerate(nums):
            if goal < i:
                return False
            
            goal = max(goal, n+i)

            if goal >= len(nums) - 1:
                return True

        return False
