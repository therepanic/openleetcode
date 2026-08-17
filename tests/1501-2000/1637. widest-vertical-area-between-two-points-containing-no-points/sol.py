class Solution:
    def maxWidthOfVerticalArea(self, points: List[List[int]]) -> int:
        max_width = 0

        # Sort points based on x-coordinate
        l = sorted(points, key=lambda x: x[0])

        # Compare adjacent x-coordinates to find the maximum gap
        for i in range(len(l) - 1):
            width = l[i + 1][0] - l[i][0]
            max_width = max(max_width, width)

        return max_width
