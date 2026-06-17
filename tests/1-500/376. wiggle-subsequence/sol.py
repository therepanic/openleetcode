class Solution(object):
    def wiggleMaxLength(self, nums):
        if len(nums) < 2:
            return len(nums)

        up = down = 1

        for i in range(1, len(nums)):
            if nums[i] > nums[i - 1]:
                up, down = down + 1, down
            elif nums[i] < nums[i - 1]:
                up, down = up, up + 1
            else:
                up, down = up, down

        return max(up, down)