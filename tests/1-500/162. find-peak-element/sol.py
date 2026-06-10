class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        n = len(nums)
        left = 0
        right = n - 1
        if len(nums) < 3:
            return nums.index(max(nums))

        while left < right:
            mid = left + (right - left) // 2

            if mid > 0 and mid < n - 1 and nums[mid - 1] < nums[mid] > nums[mid + 1]:
                return mid

            if nums[mid] < nums[mid + 1]:
                left = mid + 1

            else:
                right = mid

        return left
