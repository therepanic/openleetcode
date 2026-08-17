import numpy as np


class Solution:
    def maximalNetworkRank(self, n: int, roads: List[List[int]]) -> int:
        # 1. Construct the Adjacency Matrix (A)
        A = np.zeros((n, n), dtype=int)
        if roads:
            # Vectorized edge ingestion using advanced indexing
            edges = np.array(roads)
            A[edges[:, 0], edges[:, 1]] = 1
            A[edges[:, 1], edges[:, 0]] = 1

        # 2. Compute the Degree Vector (d)
        d = A.sum(axis=1)

        # 3. Compute the Rank Matrix for all pairs via broadcasting: R_ij = d_i + d_j - A_ij
        # d[:, None] creates a column vector, d[None, :] creates a row vector
        Rank = d[:, None] + d[None, :] - A

        # 4. Enforce i != j by masking out the main diagonal
        np.fill_diagonal(Rank, -1)

        # 5. Extract the maximum rank across the entire structure
        return int(Rank.max())
