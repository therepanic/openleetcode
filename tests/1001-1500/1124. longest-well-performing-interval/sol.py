class Solution:
    def longestWPI(self, hours: List[int]) -> int:
        score = 0
        longest_interval = 0
        # We start at score 0 before considering any days (index -1)
        seen_at = {0: -1}

        for i, h in enumerate(hours):
            # 1. Update the score (Up or Down)
            score += 1 if h > 8 else -1

            # 2. Check the two rules
            if score > 0:
                # Rule A: We are positive! The whole thing counts.
                longest_interval = i + 1
            elif (score - 1) in seen_at:
                # Rule B: We are negative.
                # Look for the earliest spot that was exactly 1 point lower.
                # Distance = Current Index - Index of that earlier spot
                longest_interval = max(longest_interval, i - seen_at[score - 1])

            # 3. Remember this score?
            # Only remember the FIRST time we see a score (to keep intervals long)
            if score not in seen_at:
                seen_at[score] = i

        return longest_interval
