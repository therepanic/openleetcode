class Solution:
    def getAverages(nums: list[int], k: int) -> list[int]:
        n = len(nums)
        avgs = [-1] * n
        window_size = 2 * k + 1

        # If window size exceeds array length, no average can be computed
        if window_size > n:
            return avgs

        # Calculate initial window sum for the first center index (which is at k)
        window_sum = sum(nums[:window_size])
        avgs[k] = window_sum // window_size

        # Slide the window across the remaining valid center indices
        for i in range(k + 1, n - k):
            window_sum += nums[i + k] - nums[i - k - 1]
            avgs[i] = window_sum // window_size

        return avgs
