from typing import List


class Solution:
    def canReorderDoubled(self, arr: List[int]) -> bool:
        freq = {}
        for i in arr:
            freq[i] = freq.get(i, 0) + 1

        arr.sort(key=lambda x: abs(x))
        for val in arr:
            if freq[val] == 0:
                continue
            target = val * 2
            if target in freq and freq[target] > 0:
                freq[val] -= 1
                freq[target] -= 1
            else:
                return False
        return True
