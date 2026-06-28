class Solution(object):
    def findMaxLength(self, nums):
        count = 0
        max_length = 0
        count_map = {0: -1}

        for i in range(len(nums)):
            if nums[i] == 0:
                count -= 1
            else:
                count += 1

            if count in count_map:
                max_length = max(max_length, i - count_map[count])
            else:
                count_map[count] = i

        return max_length
