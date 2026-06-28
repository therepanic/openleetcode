from collections import deque
from typing import List


class Solution:
    def slidingPuzzle(self, board: List[List[int]]) -> int:
        # Target state and initial state
        target = "123450"
        start = "".join(str(num) for row in board for num in row)

        # Neighbors map for each index in the 1D representation of the board
        neighbors = {
            0: [1, 3],
            1: [0, 2, 4],
            2: [1, 5],
            3: [0, 4],
            4: [1, 3, 5],
            5: [2, 4],
        }

        # BFS setup
        queue = deque([(start, 0)])  # (state, moves)
        visited = set()
        visited.add(start)

        while queue:
            state, moves = queue.popleft()

            # Check if we've reached the target
            if state == target:
                return moves

            # Find the index of zero
            zero_index = state.index("0")

            # Generate new states by swapping '0' with its neighbors
            for neighbor in neighbors[zero_index]:
                # Convert state to a list for mutation
                new_state = list(state)
                # Swap '0' with the neighbor
                new_state[zero_index], new_state[neighbor] = (
                    new_state[neighbor],
                    new_state[zero_index],
                )
                # Convert back to string
                new_state_str = "".join(new_state)

                # If this new state hasn't been visited, add it to the queue
                if new_state_str not in visited:
                    visited.add(new_state_str)
                    queue.append((new_state_str, moves + 1))

        # If we exhaust the queue without finding the target
        return -1
