from functools import lru_cache


class Solution:
    def minimumIncompatibility(self, nums: List[int], k: int) -> int:
        n = len(nums)
        sz = n // k

        # 1. Feasibility Constraint: Pigeonhole Principle
        # If any element appears more than k times, partitioning is impossible
        from collections import Counter

        counts = Counter(nums)
        if any(v > k for v in counts.values()):
            return -1

        nums.sort()

        # 2. Candidate Generation (Pre-calculating valid subset costs)
        # We only care about subsets of size 'sz' with unique elements
        valid_subsets = {}
        for mask in range(1 << n):
            if bin(mask).count("1") == sz:
                subset = [nums[i] for i in range(n) if (mask >> i) & 1]
                if len(set(subset)) == sz:
                    valid_subsets[mask] = max(subset) - min(subset)

        # 3. Recursive Set Partitioning (The Optimization Manifold)
        @lru_cache(None)
        def solve(remaining_mask):
            if remaining_mask == 0:
                return 0

            res = float("inf")
            # To avoid redundant permutations, always include the first available element
            first_element = (remaining_mask & -remaining_mask).bit_length() - 1

            # Search for candidates that contain the 'first_element'
            for mask, cost in valid_subsets.items():
                if (mask & remaining_mask) == mask and (mask >> first_element) & 1:
                    res = min(res, cost + solve(remaining_mask ^ mask))

            return res

        ans = solve((1 << n) - 1)
        return int(ans) if ans != float("inf") else -1
