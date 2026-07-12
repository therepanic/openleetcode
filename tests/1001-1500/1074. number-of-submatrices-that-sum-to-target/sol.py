class Solution:
    def numSubmatrixSumTarget(self, matrix: List[List[int]], target: int) -> int:
        m, n = len(matrix), len(matrix[0])

        # Step 1: Preprocess the matrix to calculate cumulative sum for each row
        for row in range(m):
            for col in range(1, n):
                matrix[row][col] += matrix[row][col - 1]

        count = 0

        # Step 2: Iterate over all pairs of column indices c1 and c2
        for c1 in range(n):
            for c2 in range(c1, n):
                # Step 3: Iterate over all pairs of row indices row1 and row2
                prefix_sum_map = {0: 1}
                sum_val = 0

                # Step 4: Calculate the sum of submatrix using cumulative sum
                for row in range(m):
                    sum_val += matrix[row][c2] - (matrix[row][c1 - 1] if c1 > 0 else 0)

                    # Step 5 and 6: Update count and prefix_sum_map
                    count += prefix_sum_map.get(sum_val - target, 0)
                    prefix_sum_map[sum_val] = prefix_sum_map.get(sum_val, 0) + 1

        # Step 8: Return the final count
        return count
