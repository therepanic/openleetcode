class Solution(object):
    def minElements(self, nums, limit, goal):
        """
        :type nums: List[int]
        :type limit: int
        :type goal: int
        :rtype: int
        """
        current_sum = sum(nums)
        diff = abs(goal - current_sum)
        return (diff + limit - 1) // limit
