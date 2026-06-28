import numpy as np


class Solution:
    def knightProbability(self, n: int, k: int, row: int, column: int) -> float:
        if k == 0:
            return 1.0

        num_states = n * n

        # 1. Generate grid coordinates for all flattened indices
        indices = np.arange(num_states)
        rows = indices // n
        cols = indices % n

        # 2. Compute pairwise absolute differences between all squares
        # Shape of delta_r and delta_c: (num_states, num_states)
        delta_r = np.abs(rows[:, None] - rows[None, :])
        delta_c = np.abs(cols[:, None] - cols[None, :])

        # 3. Apply the knight movement logic via boolean broadcasting
        is_knight_move = ((delta_r == 1) & (delta_c == 2)) | (
            (delta_r == 2) & (delta_c == 1)
        )

        # 4. Construct the Transition Matrix P
        P = np.zeros((num_states, num_states), dtype=np.float64)
        P[is_knight_move] = 1.0 / 8.0

        # 5. Initialize the state vector p_0
        p_0 = np.zeros(num_states, dtype=np.float64)
        p_0[row * n + column] = 1.0

        # 6. Exponentiate the system using optimized BLAS/LAPACK matrix power
        P_k = np.linalg.matrix_power(P, k)

        # 7. Evolve and aggregate the surviving probability mass
        p_k = p_0 @ P_k
        return float(np.sum(p_k))
