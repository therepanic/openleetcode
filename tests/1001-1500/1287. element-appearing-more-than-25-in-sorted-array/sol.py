class Solution:
    def findSpecialInteger(self, arr: List[int]) -> int:
        n = len(arr)
        q = n // 4
        m = {}
        for num in arr:
            m[num] = m.get(num, 0) + 1
            if m[num] > q:
                return num
        return None
