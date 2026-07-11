class Solution(object):
    def numSubarraysWithSum(self, nums, goal):
        pos_of_1s = [-1]
        count = 0
        total = 0
        n = len(nums)

        # Branch 1: If goal is 0, count contiguous blocks of zeros
        if goal == 0:
            for num in nums:
                if num == 0:
                    count += 1
                    total += count
                else:
                    count = 0
            return total

        # Branch 2: Collect real positions of all 1s
        for i, num in enumerate(nums):
            if num == 1:
                pos_of_1s.append(i)
        pos_of_1s.append(n)  # Append virtual right boundary

        # Slide a window of size 'goal' across our 1s tracking array
        for i in range(1, len(pos_of_1s) - goal):
            # Distance to the previous 1 tells us how many left configurations exist
            left_choices = pos_of_1s[i] - pos_of_1s[i - 1]

            # Distance to the next 1 tells us how many right configurations exist
            right_choices = pos_of_1s[i + goal] - pos_of_1s[i + goal - 1]

            # Combinations = left extensions * right extensions
            total += left_choices * right_choices

        return total
