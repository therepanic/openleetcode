from typing import List
import numpy as np


class Solution:
    def minDistance(self, houses: List[int], k: int) -> int:
        n = len(houses)
        houses = np.sort(np.array(houses))

        # 1. The Integrated Signal (Prefix Sums)
        P = np.concatenate(([0], np.cumsum(houses)))

        # 2. Creating Coordinate Grids for i and j (0 <= i <= j < n)
        # i_grid: rows represent starting house, j_grid: columns represent ending house
        i_idx, j_idx = np.indices((n, n))

        # 3. Vectorized Median Calculation
        # Masking to only compute the Upper Triangle (where j >= i)
        mask = j_idx >= i_idx
        mid_idx = (i_idx + j_idx) // 2

        # 4. The Horizontal Sum (L1 Cost) calculated via Broadcasting
        # G[i,j] = (houses[mid] * (mid-i+1) - sum(houses[i..mid])) +
        #          (sum(houses[mid+1..j]) - houses[mid] * (j-mid))
        G = np.zeros((n, n))

        # Extracting the components for the vectorized formula
        count_left = mid_idx - i_idx + 1
        count_right = j_idx - mid_idx

        sum_left = P[mid_idx + 1] - P[i_idx]
        sum_right = P[j_idx + 1] - P[mid_idx + 1]

        # The Vectorized L1 Manifold
        G[mask] = (houses[mid_idx[mask]] * count_left[mask] - sum_left[mask]) + (
            sum_right[mask] - houses[mid_idx[mask]] * count_right[mask]
        )

        # 5. DP Phase: Optimal Partitioning
        dp = np.full((k + 1, n + 1), float("inf"))
        dp[0, 0] = 0

        # --- Assuming G (N x N) and dp (K+1 x N+1) are already initialized ---
        # G[i, j] is the cost for one mailbox to cover houses from index i to j.
        # dp[m-1, :n] is the vector of minimum costs using m-1 mailboxes.

        for m in range(1, k + 1):
            # 1. Linear Transformation: Broadcast dp[m-1] into the transition space
            # We take the previous state vector and 'stretch' it to align with G
            # Shape: (n, 1) + (n, n) -> (n, n)
            # Each cell [i, j] represents: "Cost of m-1 mailboxes for i houses + 1 mailbox for houses i...j"
            prev_states = dp[m - 1, :n][:, np.newaxis]
            transition_matrix = prev_states + G

            # 2. Causality Masking (The Upper-Triangular Constraint)
            # We cannot transition from more houses to fewer houses.
            # We set the lower triangle to infinity so they are ignored in the min()
            i_idx, j_idx = np.indices((n, n))
            transition_matrix[j_idx < i_idx] = float("inf")

            # 3. Horizontal Reduction (The Min-Plus Product)
            # Taking the minimum along the 'previous house' axis (axis 0)
            # This gives us the optimal cost for covering 'j+1' houses using 'm' mailboxes.
            dp[m, 1:] = np.min(transition_matrix, axis=0)

        return int(dp[k, n])
