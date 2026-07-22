class Solution:
    def rangeSum(self, nums, n, left, right):
        sums = []
        for i in range(n):
            total = 0
            for value in nums[i:n]:
                total += value
                sums.append(total)
        sums.sort()
        return sum(sums[left - 1 : right]) % 1000000007
