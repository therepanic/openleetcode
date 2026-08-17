from functools import lru_cache


class Solution:
    def getMaxGridHappiness(
        self, m: int, n: int, introvertsCount: int, extrovertsCount: int
    ) -> int:
        # To optimize, ensure n is the smaller dimension
        if n > m:
            m, n = n, m

        # Precompute row-internal happiness and neighbor-external interactions
        # 0: Empty, 1: Introvert, 2: Extrovert

        @lru_cache(None)
        def get_row_stats(row_tuple):
            # Returns (internal_happiness, intro_used, extro_used)
            h = 0
            intro, extro = 0, 0
            for i in range(n):
                if row_tuple[i] == 1:
                    h += 120
                    intro += 1
                    if i > 0 and row_tuple[i - 1] != 0:
                        h -= 30
                    if i < n - 1 and row_tuple[i + 1] != 0:
                        h -= 30
                elif row_tuple[i] == 2:
                    h += 40
                    extro += 1
                    if i > 0 and row_tuple[i - 1] != 0:
                        h += 20
                    if i < n - 1 and row_tuple[i + 1] != 0:
                        h += 20
            return h, intro, extro

        @lru_cache(None)
        def get_inter_row_score(row_up, row_down):
            # Interaction score between two adjacent rows
            score = 0
            for i in range(n):
                u, d = row_up[i], row_down[i]
                if u == 0 or d == 0:
                    continue
                # Adjustment for both cells based on their types
                if u == 1:
                    score -= 30
                else:
                    score += 20
                if d == 1:
                    score -= 30
                else:
                    score += 20
            return score

        # All possible row configurations as tuples (3^n)
        import itertools

        possible_rows = list(itertools.product([0, 1, 2], repeat=n))

        @lru_cache(None)
        def dp(row_idx, in_rem, ex_rem, prev_row):
            if row_idx == m:
                return 0

            res = 0
            for curr_row in possible_rows:
                h_internal, i_used, e_used = get_row_stats(curr_row)
                if i_used <= in_rem and e_used <= ex_rem:
                    inter_score = get_inter_row_score(prev_row, curr_row)
                    total_gain = h_internal + inter_score
                    res = max(
                        res,
                        total_gain
                        + dp(row_idx + 1, in_rem - i_used, ex_rem - e_used, curr_row),
                    )
            return res

        return dp(0, introvertsCount, extrovertsCount, (0,) * n)
