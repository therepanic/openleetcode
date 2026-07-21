class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        d = {}
        for i in arr:
            if i in d:
                d[i] += 1
            else:
                d[i] = 1
        s = set()
        for value in d.values():
            if value in s:
                return False
            s.add(value)

        return True
