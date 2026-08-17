class Solution:
    def canBeIncreasing(self, nums):
        n = len(nums)
        idx = -1

        # Find first distortion
        for i in range(n - 1):
            if nums[i] >= nums[i + 1]:
                idx = i
                break

        flag = True
        for i in range(idx + 1, n - 1):
            if nums[i] >= nums[i + 1]:
                flag = False
                break

        if (idx == 0 or idx == n - 1) and flag:
            return True
        if idx - 1 >= 0 and idx + 1 < n and nums[idx - 1] < nums[idx + 1] and flag:
            return True

        # Check from the end
        for i in range(n - 1, 0, -1):
            if nums[i] <= nums[i - 1]:
                idx = i
                break

        flag = True
        for i in range(idx - 1, 0, -1):
            if nums[i] <= nums[i - 1]:
                flag = False
                break

        if (idx == 0 or idx == n - 1) and flag:
            return True
        if idx - 1 >= 0 and idx + 1 < n and nums[idx - 1] >= nums[idx + 1]:
            return False
        return flag
