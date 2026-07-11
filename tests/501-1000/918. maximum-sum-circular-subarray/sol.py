class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        maxSum = nums[0]
        minSum = nums[0]
        currMaxSum = nums[0]
        currMinSum = nums[0]
        totalSum = nums[0]

        for i in range(1, len(nums)):
            # Kadane's algorithm for maximum sum
            # Either extend previous subarray or start a new one
            currMaxSum = max(currMaxSum + nums[i], nums[i])
            maxSum = max(maxSum, currMaxSum)

            # Kadane's algorithm for minimum sum
            # Either extend previous subarray or start a new one
            currMinSum = min(currMinSum + nums[i], nums[i])
            minSum = min(minSum, currMinSum)

            # Calculate the total sum of all elements
            totalSum += nums[i]

        # The circular sum is the total sum minus the minimum subarray sum
        circularSum = totalSum - minSum

        # Edge case: if all numbers are negative, then maxSum will be negative
        # and circularSum will be 0 (empty subarray), but we need to return the max negative value
        if circularSum == 0:
            return maxSum

        # Return the maximum of the regular subarray sum and the circular subarray sum
        return max(maxSum, circularSum)
