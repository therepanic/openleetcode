class Solution:
    def solve(self, n, nums):
        win, count = 0, 0
        for num in nums:
            if num == n:
                win += 1
        for i in range(win):
            if nums[i] == n:
                count += 1
        res = win - count
        for i in range(win,len(nums)):
            if nums[i] == n:
                count += 1
            if nums[i-win] == n:
                count -= 1
            res = min(res, win - count)
        return res
    def minSwaps(self, nums: List[int]) -> int:
        res1 = self.solve(1,nums)
        res2 = self.solve(0,nums)
        return min(res1,res2)