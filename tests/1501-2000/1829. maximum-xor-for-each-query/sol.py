class Solution(object):
    def getMaximumXor(self, nums, maximumBit):
        ans = []
        s = []
        a = nums[0]
        s.append(a)
        mask = 2**maximumBit - 1
        for i in range(1, len(nums)):
            a ^= nums[i]
            s.append(a)
        for i in range(len(nums)):
            m = s[len(nums) - i - 1]
            ans.append(mask ^ m)
        return ans
