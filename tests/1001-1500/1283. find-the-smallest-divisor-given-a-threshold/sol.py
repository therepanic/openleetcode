class Solution:
    def smallestDivisor(self, nums, threshold):
        low = 1
        high = max(nums)
        ans = high

        while low <= high:
            mid = low + (high - low) // 2

            total = 0
            for num in nums:
                total += (num + mid - 1) // mid

            if total <= threshold:
                ans = mid
                high = mid - 1
            else:
                low = mid + 1

        return ans
