from functools import lru_cache


class Solution:
    def maxHappyGroups(self, batchSize: int, groups: List[int]) -> int:
        # 1. Reduction to the Modulo Manifold
        counts = [0] * batchSize
        happy_count = 0
        for g in groups:
            rem = g % batchSize
            if rem == 0:
                happy_count += 1
            else:
                counts[rem] += 1

        # 2. Greedy Contractions (The "Exceptional Curves" Pairing)
        # Pairs that sum to batchSize immediately yield 1 happy group
        for i in range(1, (batchSize // 2) + 1):
            if i == batchSize - i:  # Self-pairing (e.g., 2+2=4)
                pair_count = counts[i] // 2
                happy_count += pair_count
                counts[i] %= 2
            else:
                pair_count = min(counts[i], counts[batchSize - i])
                happy_count += pair_count
                counts[i] -= pair_count
                counts[batchSize - i] -= pair_count

        # 3. MAP Inference on the remaining State Vector
        # The state is a tuple of remaining counts for each remainder 1..B-1
        state_vector = tuple(counts[1:])

        @lru_cache(None)
        def viterbi_search(current_counts, leftover):
            if sum(current_counts) == 0:
                return 0

            res = 0
            # Try taking one group of remainder 'r'
            for i, count in enumerate(current_counts):
                if count > 0:
                    rem = i + 1
                    # New counts after "consuming" this group
                    next_counts = list(current_counts)
                    next_counts[i] -= 1

                    # If leftovers were 0, this group is happy (+1)
                    is_happy = 1 if leftover == 0 else 0
                    new_leftover = (leftover + rem) % batchSize

                    res = max(
                        res, is_happy + viterbi_search(tuple(next_counts), new_leftover)
                    )
            return res

        return happy_count + viterbi_search(state_vector, 0)
