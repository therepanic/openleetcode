# My code With GPT Explaination
class Solution:
    def shiftGrid(self, grid: List[List[int]], k: int) -> List[List[int]]:
        m, n = len(grid) - 1, len(grid[0]) - 1

        # Reduce unnecessary full rotations
        k %= (m + 1) * (n + 1)

        if k == 0:
            return grid

        last_k_elements = []

        # i, x -> pointer for reading elements from end
        # j, y -> pointer for writing shifted elements
        # count -> number of elements collected
        i = j = m
        x = y = n
        count = 0

        # Step 1: Collect the last k elements (reverse traversal)
        while count != k:
            last_k_elements.append(grid[i][x])

            if x >= 1:
                x -= 1
            else:
                i -= 1
                x = n

            count += 1

        # Step 2: Shift remaining elements to the right by k positions
        while i != 0 or x != -1:
            if x == -1:
                i -= 1
                x = n

            if y == -1:
                j -= 1
                y = n

            grid[j][y] = grid[i][x]

            x -= 1
            y -= 1

        # Step 3: Place stored k elements at the beginning
        idx = 0
        while k:
            if y == -1:
                j -= 1
                y = n

            grid[j][y] = last_k_elements[idx]

            y -= 1
            k -= 1
            idx += 1

        return grid
