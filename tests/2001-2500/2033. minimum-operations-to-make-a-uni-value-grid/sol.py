class Solution:
    def minOperations(self, grid: List[List[int]], x: int) -> int:
        arr = []

        # flatten grid
        for row in grid:
            for v in row:
                arr.append(v)

        # check divisibility
        base = arr[0]
        for v in arr:
            if abs(v - base) % x != 0:
                return -1

        # sort
        arr.sort()

        # median
        median = arr[len(arr)//2]

        # count operations
        ops = 0
        for v in arr:
            ops += abs(v - median) // x

        return ops