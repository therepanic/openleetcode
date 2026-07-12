from collections import defaultdict
from typing import List


class Solution(object):
    def gridIllumination(self, n, lamps, queries):
        # Hash maps to track the number of active lamps illuminating each line
        row_count = defaultdict(int)
        col_count = defaultdict(int)
        diagonal1 = defaultdict(int)  # Major diagonals (row - col)
        diagonal2 = defaultdict(int)  # Minor diagonals (row + col)

        # Hash set to quickly verify the exact coordinate presence of an active lamp
        lamp_set = set()
        ans = []

        # Relative coordinates defining a 3x3 window centered around a query cell
        directions = {
            (-1, -1),
            (-1, 0),
            (-1, 1),
            (0, -1),
            (0, 0),
            (0, 1),
            (1, -1),
            (1, 0),
            (1, 1),
        }

        # Phase 1: Record all lamp placements and light up corresponding paths
        for row, col in lamps:
            if (row, col) not in lamp_set:
                lamp_set.add((row, col))
                row_count[row] += 1
                col_count[col] += 1
                diagonal1[row - col] += 1
                diagonal2[row + col] += 1

        # Phase 2: Process illumination queries sequentially
        for row, col in queries:
            # Check if any active line counter covers this position
            if (
                row_count[row]
                or col_count[col]
                or diagonal1[row - col]
                or diagonal2[row + col]
            ):
                ans.append(1)

                # Turn off lamps located in the surrounding 3x3 area
                for c_row, c_col in directions:
                    n_row, n_col = row + c_row, col + c_col
                    if (n_row, n_col) in lamp_set:
                        lamp_set.remove((n_row, n_col))
                        row_count[n_row] -= 1
                        col_count[n_col] -= 1
                        diagonal1[n_row - n_col] -= 1
                        diagonal2[n_row + n_col] -= 1
            else:
                ans.append(0)

        return ans
