from typing import List


class Solution:
    def minFallingPathSum(self, grid: List[List[int]]) -> int:
        dp = grid[0][:]
        for row in grid[1:]:
            smallest = second_smallest = float("inf")
            smallest_col = -1
            for col, value in enumerate(dp):
                if value < smallest:
                    second_smallest = smallest
                    smallest = value
                    smallest_col = col
                elif value < second_smallest:
                    second_smallest = value
            dp = [
                value + (second_smallest if col == smallest_col else smallest)
                for col, value in enumerate(row)
            ]
        return min(dp)
