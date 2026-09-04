class Solution:
    def waysToPartition(self, nums, k):
        n = len(nums)

        total = sum(nums)

        ans, running_sum = 0, 0

        R, L = defaultdict(int), defaultdict(int)

        for i in range(n-1):
            running_sum += nums[i]
            R[running_sum-(total-running_sum)] += 1


        ans = R[0]

        running_sum = 0

        for i in range(n):
            running_sum += nums[i]
            d = k-nums[i]
            ans = max(ans,L[d]+R[-d])
            L[running_sum-(total-running_sum)] += 1
            R[running_sum-(total-running_sum)] -= 1 

        return ans