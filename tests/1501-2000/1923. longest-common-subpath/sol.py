import numpy as np
from typing import List


class Solution:
    def longestCommonSubpath(self, n: int, paths: List[List[int]]) -> int:
        # 1. Padding & Field Concatenation
        combined = []
        path_origin = []
        for i, p in enumerate(paths):
            combined.extend(p)
            combined.append(-(i + 1))
            path_origin.extend([i] * (len(p) + 1))

        S = np.array(combined, dtype=np.int32)
        P_ID = np.array(path_origin, dtype=np.int32)
        N = len(S)
        M = len(paths)

        # 2. Vectorized Suffix Array (Rank Doubling)
        # We transform the suffix sort into a "Key-Packing" problem
        _, rank = np.unique(S, return_inverse=True)

        k = 1
        while k < N:
            # Shift the rank field to create the 'Second Half' of the key
            first_half = rank.astype(np.int64)
            second_half = np.zeros(N, dtype=np.int64)
            second_half[:-k] = rank[k:] + 1  # +1 to distinguish from 'no suffix'

            # Pack two 32-bit ranks into one 64-bit key for a single C-sort
            combined_key = (first_half << 32) | second_half
            _, rank = np.unique(combined_key, return_inverse=True)

            if k >= N:
                break
            k *= 2

        sa = np.empty(N, dtype=np.int32)
        sa[rank] = np.arange(N)

        # 3. Vectorized LCP (Kasai's Invariant)
        # While Kasai is inherently serial, we can speed up the string
        # comparisons using NumPy's slice-equality checks
        lcp = np.zeros(N, dtype=np.int32)
        inv_sa = rank
        h = 0
        for i in range(N):
            if inv_sa[i] > 0:
                j = sa[inv_sa[i] - 1]
                # The only serial part: incrementing h
                while i + h < N and j + h < N and S[i + h] == S[j + h]:
                    h += 1
                lcp[inv_sa[i]] = h
                if h > 0:
                    h -= 1

        # 4. Maximizing Mutual Information (Sliding Window)
        # We use a two-pointer approach but keep the LCP comparisons vectorized
        ans = 0
        left = 0
        count = np.zeros(M, dtype=np.int32)
        distinct_paths = 0

        # Deque for Monotonic Queue (Minimum LCP in window)
        from collections import deque

        min_q = deque()

        for right in range(N):
            p_id = P_ID[sa[right]]
            if p_id >= 0:
                if count[p_id] == 0:
                    distinct_paths += 1
                count[p_id] += 1

            while min_q and lcp[min_q[-1]] >= lcp[right]:
                min_q.pop()
            min_q.append(right)

            while distinct_paths == M:
                while min_q and min_q[0] <= left:
                    min_q.popleft()

                if min_q:
                    ans = max(ans, lcp[min_q[0]])

                out_id = P_ID[sa[left]]
                if out_id >= 0:
                    count[out_id] -= 1
                    if count[out_id] == 0:
                        distinct_paths -= 1
                left += 1

        return int(ans)
