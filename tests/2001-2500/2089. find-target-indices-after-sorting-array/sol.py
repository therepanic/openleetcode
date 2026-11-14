class Solution:
    def targetIndices(self, nums, target):
        r = []
        less = 0
        more = 0
        for c in nums:
            if c < target:
                less += 1
            if c > target:
                more += 1
        # Resulting length needs to be n - less - more
        # Starting index is less, ending is n - more
        for i in range(less, len(nums) - more):
            r.append(i)
        return r