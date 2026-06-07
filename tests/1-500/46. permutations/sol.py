class Solution:
    def permute(self, nums):
        res = []
        
        def perms(i):
            if i == len(nums):
                res.append(nums[:])
                return
            for j in range(i, len(nums)):
                nums[i], nums[j] = nums[j], nums[i]
                perms(i + 1)
                nums[i], nums[j] = nums[j], nums[i]
        
        perms(0)
        return res