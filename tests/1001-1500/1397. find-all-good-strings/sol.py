from functools import lru_cache


class Solution:
    def findGoodStrings(self, n: int, s1: str, s2: str, evil: str) -> int:
        MOD = 10**9 + 7
        m = len(evil)

        # Precompute KMP failure function for fast transitions
        lps = [0] * m
        for i in range(1, m):
            j = lps[i - 1]
            while j > 0 and evil[i] != evil[j]:
                j = lps[j - 1]
            if evil[i] == evil[j]:
                lps[i] = j + 1

        @lru_cache(None)
        def get_next_state(curr_match, char):
            """Determines the next 'evil' match length using KMP logic."""
            while curr_match > 0 and char != evil[curr_match]:
                curr_match = lps[curr_match - 1]
            if char == evil[curr_match]:
                curr_match += 1
            return curr_match

        @lru_cache(None)
        def dp(idx, e_idx, tight_lo, tight_hi):
            # If we matched the whole 'evil' string, this path is 'bad'
            if e_idx == m:
                return 0
            # If we reached the end, we've found 1 'good' string
            if idx == n:
                return 1

            res = 0
            # Determine the range of characters allowed by s1 and s2
            lower = s1[idx] if tight_lo else "a"
            upper = s2[idx] if tight_hi else "z"

            for char_code in range(ord(lower), ord(upper) + 1):
                c = chr(char_code)

                # Calculate next state parameters
                next_e_idx = get_next_state(e_idx, c)
                next_tight_lo = tight_lo and (c == lower)
                next_tight_hi = tight_hi and (c == upper)

                res = (
                    res + dp(idx + 1, next_e_idx, next_tight_lo, next_tight_hi)
                ) % MOD

            return res

        return dp(0, 0, True, True)
