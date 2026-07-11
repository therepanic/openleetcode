class Solution:
    def sortArrayByParity(self, nums: List[int]) -> List[int]:
        left = 0

        for i in range(len(nums)):
            if nums[i] % 2 == 0:
                nums[left], nums[i] = nums[i], nums[left]
                left += 1

        return nums
