class Solution(object):
    def optimalDivision(self, nums):
        # Base Case 1: Only one number, no division possible
        result = str(nums[0])
        if len(nums) == 1:
            return result

        # Base Case 2: Two numbers, only one way to divide them
        if len(nums) == 2:
            return result + "/" + str(nums[1])

        # For 3 or more elements, group everything after the first element
        # This transforms: a / b / c / d -> a / (b / c / d)
        result += "/(" + str(nums[1])
        for num in nums[2:]:
            result += "/" + str(num)

        return result + ")"
