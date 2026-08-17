class Solution:
    def isCovered(self, ranges: List[List[int]], left: int, right: int) -> bool:
        slots = [0] * 51
        for s, e in ranges:
            slots[s : e + 1] = [1] * (e - s + 1)
        for i in range(left, right + 1):
            if slots[i] == 0:
                return False
        return True
