class Solution(object):
    def numberOfWeeks(self, milestones):
        """
        :type milestones: List[int]
        :rtype: int
        """
        total = sum(milestones)
        max_val = max(milestones)
        if max_val <= total - max_val:
            return total
        else:
            return 2 * (total - max_val) + 1
