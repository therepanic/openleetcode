class Solution:
    def canBeEqual(self, target: List[int], arr: List[int]) -> bool:
        counts = [0] * 1001

        for t, a in zip(target, arr):
            counts[t] += 1
            counts[a] -= 1

        return not any(counts)
