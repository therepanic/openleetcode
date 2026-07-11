class Solution:
    def matrixScore(self, grid: List[List[int]]) -> int:
        ans = 0
        rows, cols = len(grid), len(grid[0])

        # Ensure every row starts with a 1, since the leading bit carries the most weight
        for row in grid:
            if row[0] == 0:
                for i in range(cols):
                    row[i] = row[i] ^ 1  # XOR with 1 flips the bit (0->1, 1->0)

        # For every remaining column, flip it if doing so increases the count of 1s
        for j in range(1, cols):
            temp = 0
            for i in range(rows):
                temp += grid[i][j]
            if (
                2 * temp < rows
            ):  # equivalent to temp < (rows - temp), i.e. 0s outnumber 1s
                for i in range(rows):
                    grid[i][j] = grid[i][j] ^ 1

        # Convert each row to its decimal value and accumulate the total
        for row in grid:
            val = "".join(map(str, row))
            ans += int(val, 2)
        return ans
