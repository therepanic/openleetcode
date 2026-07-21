class Solution:
    def findLucky(self, arr: list[int]) -> int:
        from collections import Counter

        freq = Counter(arr)
        lucky = -1

        for num, count in freq.items():
            if num == count:
                lucky = max(lucky, num)

        return lucky
