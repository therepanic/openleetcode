class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        l = len(nums)
        total = l
        summ = 0

        for i in range(l):
            total += i
            summ += nums[i]

        return total - summ
