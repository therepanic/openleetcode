class Solution:
    def minimumHammingDistance(
        self, source: list[int], target: list[int], allowedSwaps: list[list[int]]
    ) -> int:
        n = len(source)
        parent = list(range(n))

        def find(x):
            if parent[x] != x:
                parent[x] = find(parent[x])
            return parent[x]

        def unite(a, b):
            parent[find(a)] = find(b)

        for a, b in allowedSwaps:
            unite(a, b)

        # Group source values by their component root
        from collections import defaultdict, Counter

        groups = defaultdict(list)
        for i in range(n):
            groups[find(i)].append(source[i])
        groups = {root: Counter(vals) for root, vals in groups.items()}

        hamming_dist = 0
        for i in range(n):
            root = find(i)
            freq = groups[root]
            if freq[target[i]] > 0:
                freq[target[i]] -= 1  # matched, consume this source value
            else:
                hamming_dist += 1  # no match found in this component

        return hamming_dist
