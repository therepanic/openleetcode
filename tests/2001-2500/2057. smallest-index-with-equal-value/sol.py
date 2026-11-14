class Solution(object):
    def smallestEqual(self, nums):
        r=-1
        for i in range(len(nums)):
            if i%10==nums[i] :
                r=i
                break
        return r