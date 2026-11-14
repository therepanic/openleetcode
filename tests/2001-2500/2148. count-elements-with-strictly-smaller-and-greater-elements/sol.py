class Solution:
    def countElements(self, nums):
        maxEle = max(nums)
        minEle = min(nums)
        count = 0
        for num in nums:
            if num != minEle and num != maxEle:
                count += 1
        return count