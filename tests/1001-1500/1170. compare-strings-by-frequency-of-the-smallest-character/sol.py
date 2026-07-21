import bisect


class Solution:
    def numSmallerByFrequency(self, queries: List[str], words: List[str]) -> List[int]:
        # 1. The f(s) Kernel: Projection into the Frequency Manifold
        def f(s: str) -> int:
            # We identify the 'Infimum' (min char) and its Density
            min_char = "z"
            count = 0
            for char in s:
                if char < min_char:
                    min_char = char
                    count = 1
                elif char == min_char:
                    count += 1
            return count

        # 2. Suffix-Sum Integration (Bucket Sorting)
        # Since the max frequency is bounded (max length 10),
        # we use a Fixed-Width Bucket to avoid the 'Sorting Dose'.
        buckets = [0] * 12
        for w in words:
            buckets[f(w)] += 1

        # Transform buckets into a Suffix Sum (The Cumulative Density Function)
        # suffix[i] = total words with frequency > i
        for i in range(9, -1, -1):
            buckets[i] += buckets[i + 1]

        # 3. O(1) Probing per Query
        return [buckets[f(q) + 1] for q in queries]
