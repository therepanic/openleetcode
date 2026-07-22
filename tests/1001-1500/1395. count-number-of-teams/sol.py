from bisect import bisect_left, bisect_right
import math
from typing import List


class MultiGridCounter:
    def __init__(self, data: list[int]):
        self.data = data
        self.n = len(data)

        # 1. Establish Optimal Grid Geometry
        self.block_size = int(math.isqrt(self.n)) + 1
        self.num_blocks = (self.n + self.block_size - 1) // self.block_size

        # 2. Build the Coarse Grid Layer (Maintain each block in sorted order)
        self.sorted_blocks = []
        for b in range(self.num_blocks):
            start = b * self.block_size
            end = min(start + self.block_size, self.n)
            # Store a sorted copy of the slice for fast localized querying
            self.sorted_blocks.append(sorted(self.data[start:end]))

    def count_less_than_in_range(
        self, query_start: int, query_end: int, val: int
    ) -> int:
        """Counts how many elements in data[query_start:query_end] are strictly less than val."""
        if query_start >= query_end:
            return 0

        count = 0

        # Determine which blocks contain the start and end boundaries
        start_block = query_start // self.block_size
        end_block = (query_end - 1) // self.block_size

        # Case A: The query range is contained entirely within a single block
        if start_block == end_block:
            for idx in range(query_start, query_end):
                if self.data[idx] < val:
                    count += 1
            return count

        # Case B: Multi-block crossing.
        # 1. Process the partial left fractional block
        left_block_end = (start_block + 1) * self.block_size
        for idx in range(query_start, left_block_end):
            if self.data[idx] < val:
                count += 1

        # 2. Process all fully covered middle blocks using the Coarse Grid
        for b in range(start_block + 1, end_block):
            # O(log √N) fast binary lookahead step
            count += bisect_left(self.sorted_blocks[b], val)

        # 3. Process the partial right fractional block
        right_block_start = end_block * self.block_size
        for idx in range(right_block_start, query_end):
            if self.data[idx] < val:
                count += 1

        return count


class Solution:
    def numTeams(self, rating: List[int]) -> int:
        total = 0
        for j in range(1, len(rating) - 1):
            left_less = sum(rating[i] < rating[j] for i in range(j))
            left_greater = sum(rating[i] > rating[j] for i in range(j))
            right_less = sum(rating[k] < rating[j] for k in range(j + 1, len(rating)))
            right_greater = sum(
                rating[k] > rating[j] for k in range(j + 1, len(rating))
            )
            total += left_less * right_greater + left_greater * right_less
        return total

        # The original block index implementation is retained below for reference.
        n = len(rating)
        if n < 3:
            return 0

        # Initialize our structural multi-grid spatial index
        grid = MultiGridCounter(rating)
        total_teams = 0

        # Treat every soldier j as the middle structural axis of the team
        for j in range(1, n - 1):
            mid_val = rating[j]

            # --- 1. Calculations to the Left of index j [0 : j] ---
            # Total elements to the left is exactly j
            left_smaller = grid.count_less_than_in_range(0, j, mid_val)
            left_greater = j - left_smaller

            # --- 2. Calculations to the Right of index j [j+1 : n] ---
            # Total elements to the right is exactly (n - 1 - j)
            right_elements = n - 1 - j
            right_smaller = grid.count_less_than_in_range(j + 1, n, mid_val)
            right_greater = right_elements - right_smaller

            # --- 3. Combinatorial Energy Update ---
            # Monotonically Increasing: rating[i] < rating[j] < rating[k]
            # Monotonically Decreasing: rating[i] > rating[j] > rating[k]
            total_teams += (left_smaller * right_greater) + (
                left_greater * right_smaller
            )

        return total_teams
