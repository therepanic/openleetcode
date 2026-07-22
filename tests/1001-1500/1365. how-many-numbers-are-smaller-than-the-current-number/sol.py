class Solution(object):
    def smallerNumbersThanCurrent(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        # Frequency array for values in range [0, 100].
        # allNums[v] will first store how many times value v appears in nums.
        allNums = [0] * 101

        # Result array. res[i] = count of numbers strictly smaller than nums[i].
        res = [0] * len(nums)

        # 1) Count frequency of each number in nums.
        for v in nums:
            allNums[v] += 1

        # 2) Convert frequency array into a prefix sum array.
        # After this loop: allNums[v] = number of elements <= v.
        for v in range(1, 101):
            allNums[v] += allNums[v - 1]

        # 3) Build the result using if-else (no ternary).
        for i in range(len(nums)):
            v = nums[i]
            if v == 0:
                # If value is 0, no smaller numbers exist.
                res[i] = 0
            else:
                # Otherwise, count of numbers strictly less than v.
                res[i] = allNums[v - 1]
        return res
