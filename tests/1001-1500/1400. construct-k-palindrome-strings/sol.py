from collections import Counter


class Solution:
    def canConstruct(self, s: str, k: int) -> bool:
        if len(s) < k:
            return False

        char_count = Counter(s)
        odd_count = sum(freq % 2 for freq in char_count.values())
        return odd_count <= k
