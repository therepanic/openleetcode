class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        freq = {}
        first = {}
        for i, x in enumerate(nums):
            if x not in freq:
                freq[x] = 0
                first[x] = i
            freq[x] += 1
        return [
            x
            for x, _ in sorted(
                freq.items(), key=lambda item: (-item[1], first[item[0]])
            )[:k]
        ]
