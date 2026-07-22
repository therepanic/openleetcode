class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        pairs = {}
        count = 0

        for i in range(len(nums)):
            if nums[i] in pairs:
                count += pairs[nums[i]]

            pairs[nums[i]] = pairs.get(nums[i], 0) + 1

        return count
