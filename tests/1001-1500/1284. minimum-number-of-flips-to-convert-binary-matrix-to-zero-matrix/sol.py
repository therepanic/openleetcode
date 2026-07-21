import numpy as np
from itertools import product


class Solution:
    def minFlips(self, mat: list[list[int]]) -> int:
        m, n = len(mat), len(mat[0])
        N = m * n
        A = np.zeros((N, N), dtype=np.int32)
        b = np.array(mat).flatten()

        # 1. Build Adjacency
        for r in range(m):
            for c in range(n):
                idx = r * n + c
                for dr, dc in [(0, 0), (0, 1), (0, -1), (1, 0), (-1, 0)]:
                    nr, nc = r + dr, c + dc
                    if 0 <= nr < m and 0 <= nc < n:
                        A[nr * n + nc, idx] = 1

        # 2. Gaussian Elimination to find Row Echelon Form
        matrix = np.hstack((A, b.reshape(-1, 1)))
        pivot_row = 0
        pivot_cols = []
        for col in range(N):
            sel = np.where(matrix[pivot_row:, col] == 1)[0]
            if sel.size > 0:
                i = sel[0] + pivot_row
                matrix[[pivot_row, i]] = matrix[[i, pivot_row]]
                # Eliminate all other 1s in this column
                for r_idx in range(N):
                    if r_idx != pivot_row and matrix[r_idx, col] == 1:
                        matrix[r_idx] ^= matrix[pivot_row]
                pivot_cols.append(col)
                pivot_row += 1

        # 3. Feasibility Check
        for i in range(pivot_row, N):
            if matrix[i, -1] == 1:
                return -1

        # 4. Particular Solution
        x_p = np.zeros(N, dtype=np.int32)
        for i, col in enumerate(pivot_cols):
            x_p[col] = matrix[i, -1]

        # 5. Basis for Null Space
        free_cols = [c for c in range(N) if c not in pivot_cols]
        null_basis = []
        for f_col in free_cols:
            vec = np.zeros(N, dtype=np.int32)
            vec[f_col] = 1
            for i, p_col in enumerate(pivot_cols):
                if matrix[i, f_col] == 1:
                    vec[p_col] = 1
            null_basis.append(vec)

        # 6. Minimize Hamming Weight (x_p ^ any combo of null_basis)
        min_steps = float("inf")
        for combo in product([0, 1], repeat=len(null_basis)):
            sol = x_p.copy()
            for bit, base_vec in zip(combo, null_basis):
                if bit:
                    sol ^= base_vec
            min_steps = min(min_steps, np.sum(sol))

        return int(min_steps) if min_steps != float("inf") else -1
