class Solution:
    def trap(self, height):

        start = 0
        end = len(height) - 1

        leftMax = 0
        rightMax = 0
        totalWater = 0

        while start < end:

            leftMax = max(leftMax, height[start])
            rightMax = max(rightMax, height[end])

            if leftMax < rightMax:
                totalWater += leftMax - height[start]
                start += 1
            else:
                totalWater += rightMax - height[end]
                end -= 1

        return totalWater